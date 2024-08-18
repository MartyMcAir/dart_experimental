import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// https://www.youtube.com/watch?v=ohPcjj_yGBU
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeManager(),
    child: const ThemeSwitchApp(),
  ));
}

class ThemeSwitchApp extends StatelessWidget {
  const ThemeSwitchApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme switcher 1 title',
      // DEFAULT THEME HERE
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeData,
      home: const ThemeSwitcheScreen(),
    );
  }
}

class ThemeSwitcheScreen extends StatefulWidget {
  const ThemeSwitcheScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcheScreen> {
  late ThemeManager _themeManager;

  @override
  void initState() {
    super.initState();
    _themeManager = Provider.of<ThemeManager>(context, listen: false);
    _themeManager.addListener(themeListener);
  }

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  void themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Switcher1 app"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        // BACKGROUND COLOR HERE
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).canvasColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text("Dummy Title"),
            const SizedBox(height: 40),
            const Text("This a lot of words here u see?"),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("Button1")),
                ElevatedButton(onPressed: () {}, child: const Text("Button2")),
              ],
            ),
            // SWITCH BUTTON FOR SWITCH THEME HERE
            // Switch(
            //   value: themeManager.themeData == ThemeMode.dark,
            //   onChanged: (value) {
            //     themeManager.toggleTheme(value);
            //   },
            // ),
            // DROPDOWN BUTTON FOR SWITCHING THEME
            DropdownButton<ThemeMode>(
              value: themeManager.themeData,
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text("Light Theme"),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text("Dark Theme"),
                ),
              ],
              onChanged: (ThemeMode? newTheme) {
                if (newTheme != null) {
                  themeManager.setTheme(newTheme);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

const primaryColor = Colors.deepPurple;
const secondaryColor = Colors.purple;

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      ),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      backgroundColor: WidgetStateProperty.all(secondaryColor),
    ),
  ),
  textTheme: const TextTheme(
    titleSmall: TextStyle(color: Colors.black87, fontSize: 16),
    titleMedium: TextStyle(color: Colors.black87, fontSize: 20),
    titleLarge: TextStyle(color: Colors.black87, fontSize: 24),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: secondaryColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: secondaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      backgroundColor: WidgetStateProperty.all(primaryColor),
    ),
  ),
  textTheme: const TextTheme(
    titleSmall: TextStyle(color: Colors.white70, fontSize: 16),
    titleMedium: TextStyle(color: Colors.white70, fontSize: 20),
    titleLarge: TextStyle(color: Colors.white70, fontSize: 24),
  ),
);

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeData => _themeMode;

  void setTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
