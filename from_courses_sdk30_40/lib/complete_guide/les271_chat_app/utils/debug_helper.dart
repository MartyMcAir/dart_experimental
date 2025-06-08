import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';

// import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../../config/supabase_config.dart';

void logPrint(
    {State? state, AuthResponse? supaBaseAuthResponse, dynamic additionalInfo, int stackDepth = 2}) {
  // OneSignal.Notifications.addClickListener((event) {
  //   print("Notification clicked: ${event.notification.jsonRepresentation()}");
  // });

  final client = Supabase.instance.client.auth;
  String location = _getCurrentLocation(stackDepth);

  print('============== DEBUG LOG [$location] ==============');
  print('mounted: ${state != null ? state.mounted : 'no state'}');
  if (additionalInfo != null) {
    print('additionalInfo: $additionalInfo');
  }
  print('------------------------------------------');
  print('data from .env:');
  print('supaBaseUrl: $supaBaseUrl');
  print('supaBaseAnonKey: $supaBaseAnonKey');
  if (supaBaseAuthResponse != null) {
    print('------------------------------------------');
    print('data from AuthResponse:');
    print(
        'supabaseSignResponse userId: ${supaBaseAuthResponse.user?.id} and accessToken: ${supaBaseAuthResponse.session?.accessToken}');
  }

  print('------------------------------------------');
  print('data from Supabase.instance.client:');
  print('currentUser?.id: ${client.currentUser?.id}');
  print('currentSession?.accessToken: ${client.currentSession?.accessToken}');
  print('=====================================================');
}

String _getCurrentLocation(int stackDepth) {
  final traceString = StackTrace.current.toString().split('\n')[stackDepth];
  final match = RegExp(r'#\d+\s+(.+)\s+\((.+?):(\d+):\d+\)').firstMatch(traceString);
  String location = 'unknown';
  if (match != null) {
    final function = match.group(1);
    final filePath = match.group(2);
    final line = match.group(3);
    // location = '$filePath:$line (function: $function)';
    final shortPath = _shortenPath(filePath ?? '');
    location = '$shortPath:$line (function: $function)';
  }
  return location;
}

String _shortenPath(String fullPath) {
  // package:from_courses_sdk30_40/complete_guide/les271_chat_app/screens/auth.dart:88 (function: _AuthScreenState.build)
  final index = fullPath.indexOf('/les271_chat_app/');
  if (index != -1) {
    // ./les271_chat_app/screens/auth.dart:88 (function: _AuthScreenState.build)
    return '.${fullPath.substring(index)}';
  }

  final parts = p.split(fullPath);
  if (parts.length >= 2) {
    return '../${parts[parts.length - 2]}/${parts.last}';
  }
  return p.basename(fullPath);
}
