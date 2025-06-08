import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

Future<bool> warnIfNoNetworkConnection(BuildContext context) async {
  final connectivityList = await Connectivity().checkConnectivity();
  final isOnline = connectivityList.contains(ConnectivityResult.none);

  if (isOnline && context.mounted) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('No internet connection. Please check your network.')),
    );
  }

  return isOnline;
}
