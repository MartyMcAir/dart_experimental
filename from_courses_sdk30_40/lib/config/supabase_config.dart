import 'package:flutter_dotenv/flutter_dotenv.dart';

final supaBaseUrl = dotenv.env['SUPABASE_URL'];
// final supaBaseUrl = dotenv.env['SUPABASE_URL'];
final supaBaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];
final supaBaseChatStorage = dotenv.env['SUPABASE_CHAT_STORAGE'];
final oneSignalAppId = dotenv.env['ONE_SIGNAL_APP_ID'];
