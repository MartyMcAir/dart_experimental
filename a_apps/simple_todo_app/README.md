# Base concept for any app
```
- 1 void main() {  runApp(); }

- 2 MyApp extends StatelessWidget /StatefulWidget {..}
- 2.1 if StatelessWidget -> Widget buil(..){..}
- 2.2 if StatefulWidget ->  State<MyPage> createState() => MyScreenState();

- 3 MyPage extends StatelessWidget or StatefulWidget {..}

- 4.1 if Page extends StatefulWidget -> MyScreenState extends State<MyPage> {..}
- 4.2 if Page extends StatelessWidget -> MyScreen extends StatelessWidget {..}

- 5 "controller/notifier etc":
- 5.1 if "MyScreenState" extends State<MyPage> {..}
	- 5.2.1 based on controller (TextEditingController)
	- "controller": inside class MyScreenState extends State<MyPage>{..}

- 5.2 if "MyScreen" extends StatelessWidget {..}
	- 5.2.1 based on MyNotifier
	- body can bee: Consumer<MyNotifier>(..)
	- onChanged / onPressed: context.read<MyNotifier>().myMethod();
	- "controller": MyNotifier extends ChangeNotifier {..}
	- 5.2.2 based on ???
```

# ------------------------------------------------------------------

# state_todo
(youtube)[https://www.youtube.com/watch?v=VfdTUKt21Ls]

- 3 Page: extends StatefulWidget {..}
- 5 "controller": inside class TodoScreenState extends State<TodoPage>{..}
    - TextEditingController
![screen_search](img/state_todo.jpg)
..

# ------------------------------------------------------------------

# notifier_todo
(youtube)[https://www.youtube.com/watch?v=b1Loe5q_Zpc]

- 1 void main(): { runApp(ChangeNotifierProvider(..)); }
- 3 Page: extends StatelessWidget {..} with routes: {..} -> to Screens
- 4 Screen: extends StatelessWidget {..}
    - body in Screen: Consumer<TaskNotifier>(..)
    - onChanges / onPressed: context.read<TaskNotifier>().checkTask(index);
        - using: context.read<TaskNotifier>().checkTask(index);
- 5 "controller": TaskNotifier extends ChangeNotifier {..}
![screen_search](img/notifier_todo.jpg)
..


