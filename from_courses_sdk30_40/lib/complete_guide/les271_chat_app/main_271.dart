// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../config/supabase_config.dart';
// import '../../firebase_options.dart';
import 'screens/auth.dart';
import 'screens/chat.dart';
import 'screens/splash.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:from_courses_sdk30_40/firebase_options.dart';

// les272 Auth https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37736590#announcements
// http://console.firebase.google.com/u/0/
//
// flutter run --verbose --debug -d RFCRC1DKX5R -t lib/complete_guide/les271_chat_app/main_271.dart
Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: '$supaBaseUrl', anonKey: '$supaBaseAnonKey');
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // 299les https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37736714#learning-tools
  // firebase_messaging skip tmp  _ for onesignal
  OneSignal.initialize('$oneSignalAppId');
  OneSignal.Notifications.requestPermission(true);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 63, 17, 177)),
      ),
      // https://temp-mail.org/ 123456
      // ketowad509@endelite.com
      // tetiha5523@jeanssi.com
      home: StreamBuilder<AuthState>(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }
          final session = snapshot.data?.session;
          if (session != null) {
            return const ChatScreen();
          }
          return const AuthScreen();
        },
      ),
    );
  }
}

//
// les285 Storage in fireBase required credit cart
// alternative: Supabase, Appwrite, Uploadcare (rest only), Cloudinary (rest only)
// Supabase - not bad
// https://supabase.com/dashboard/project/yydsqlhnvnifvmsnahwv
// https://supabase.com/docs/guides/storage
//
