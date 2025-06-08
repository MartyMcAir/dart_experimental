import 'package:flutter_dotenv/flutter_dotenv.dart';

// FIRE BASE shopping list prj
final firebaseUrl = dotenv.env['FIREBASE_SHOPPING_APP_URL'];
final firebaseShoppingList = dotenv.env['FIREBASE_SHOPPING_LIST_NAME'];

// FIRE BASE chat prj (firebase_options.dart)
final firebaseChatPrj = dotenv.env['FIREBASE_CHAT_PRJ_NAME'];
final firebaseMsgSender = dotenv.env['FIREBSE_MSG_SENDER'];
final firebaseAndrApiKey = dotenv.env['FIREBSE_ANDROID_API_KEY'];
final firebaseAndrAppId = dotenv.env['FIREBSE_ANDROID_APP_ID'];
final firebaseWinApiKey = dotenv.env['FIREBSE_WINDOWS_API_KEY'];
final firebaseWinAppId = dotenv.env['FIREBSE_WINDOWS_APP_ID'];
