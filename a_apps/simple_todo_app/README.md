# Base
- 1 void main() {  runApp(); }
- 2 class MyApp extends StatelessWidget /StatefulWidget {..}
- 2.1 if StatelessWidget -> Widget buil(..){..}
- 2.2 if StatefulWidget ->  State<MyPage> createState() => MyPageScreenState();

- 3 class MyPage extends StatelessWidget or StatefulWidget {..}
- 4.1 if Page extends StatefulWidget -> MyScreenState extends State<MyPage> {..}
- 4.2 if Page extends StatelessWidget -> class MyScreen extends StatelessWidget {..}

- 5 "controller/notifier etc":

# ------------------------------------------------------------------

# state_todo
(youtube)[https://www.youtube.com/watch?v=VfdTUKt21Ls]

- 3 Page: extends StatefulWidget {..}
- 5 "controller": inside class TodoPageScreenState extends State<TodoPage>{..}
    - TextEditingController
![screen_search](img/simple_todo.jpg)
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
- 5 "controller": class TaskNotifier extends ChangeNotifier {..}
![screen_search](img/state_todo.jpg)
..


