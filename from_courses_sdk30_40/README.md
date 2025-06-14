.project_setup.yml
- - - - - - - - - - - - 
- flutter doctor --verbose
- flutter pub upgrade
- flutter pub outdated
- - - - - - - -  - - - -
- Android Studio -> File > Invalidate Caches -> Restart
- flutter precache
- dart pub cache repair
- rm -rf .dart_tool .gradle build
- flutter clean
- flutter create .
- flutter pub get
- flutter pub upgrade
- - - - - - - - - - - -
- flutter devices
- flutter config --enable-android
- flutter run -d emulator-5554 -t lib\complete_guide\les237_fovirite_place_app\main_237.dart

## complete_guide - Flutter & Dart - The Complete Guide [2025 Edition]
###### https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/
- https://academind.com/

### les38_dice_roller_app

<img src="img/compl_edit/roll_dice.jpg" width="200">

### les53_quiz_app
<img src="img/compl_edit/quiz/quiz_1.jpg" width="100">
<details>
<img src="img/compl_edit/quiz/quiz_2.jpg" width="300"><br>
<img src="img/compl_edit/quiz/quiz_3.jpg" width="300"><br>
<img src="img/compl_edit/quiz/quiz_lesson77.jpg" width="400"><br>
<img src="img/compl_edit/quiz/quiz_l77_values_across_widgets.jpg" width="400">
<hr></details>

### les98_expense_tracker_app (chart &theme &calendar use examples &adaptive)
- if (Platform.isIOS), theme: ThemeData(useMaterial3: true)
- examples to use: Theme from(..) & copyWith(..) & colorScheme
- Theme dark & light by device settings and TextField and Calendar
- based on one color: ColorScheme.fromSeed(seedColor..
<img src="img/compl_edit/expense/expense_1.jpg" width="200">
<details>
<img src="img/compl_edit/expense/expense_1.jpg" width="300">
<img src="img/compl_edit/expense/expense_light.jpg" width="300">
<img src="img/compl_edit/expense/expense_2.jpg" width="300"><br>
<img src="img/compl_edit/expense/expense_3.jpg" width="300"><br>
<img src="img/compl_edit/expense/expense_adaptive_1.jpg" width="300"><br>
<img src="img/compl_edit/expense/expense_adaptive_2.jpg" width="300"><br>
<hr></details>

### les149 todo app with reOrder.. & les146 how ui updated
<img src="img/compl_edit//todo_app.jpg" width="200">
<details>
<img src="img/compl_edit/widget_elem_trees.jpg" width="400"><br>
<img src="img/compl_edit/how_ui_updated.jpg" width="400"><br>
<img src="img/compl_edit/uI_up_interface.jpg" width="300"><br>
<img src="img/compl_edit/ui_upd_console.jpg" width="300">><br>
<hr></details>

### les155_meals_app 
  - (multi screen app, with filters for food, using Grid & Navigator)
  - with examples to use: riverpod & animation & GoogleFonts
  - lesson 183 meals app with riverpod example
    - theme: ThemeData(useMaterial3: true) & colorCheme (colorSchemeSeed?)
  - lesson 198 meals app with animation
<img src="img/compl_edit/meal/meal_app_1_categories.jpg" width="150">
<details>
<img src="img/compl_edit/meal/meal_app_1_categories.jpg" width="250">
<img src="img/compl_edit/meal/meal_app_screens.jpg" width="400"><br>
<img src="img/compl_edit/meal/meal_app_2.jpg" width="250"><br>
<img src="img/compl_edit/meal/meal_app_3_meal_details.jpg" width="250"><br>
<img src="img/compl_edit/meal/meal_app_4_favorites.jpg" width="250"><br>
<img src="img/compl_edit/meal/meal_app_5_drawer_menu.jpg" width="250"><br>
<img src="img/compl_edit/meal/meal_app_6_checkbox_filters.jpg" width="250"><br>
- lesson 183 meals app with riverpod example
<img src="img/compl_edit/meal/meals_app_riverpod_1.jpg" width="400"><br>
<img src="img/compl_edit/meal/meals_app_riverpod_2.jpg" width="400"><br>
<hr></details>

### les207 shopping list with forms examples
 - forms: building & using & submission & resetting 
 - showing on-screen validation errors
 - TextFormField() integrated with Form()
<details>
<img src="img/compl_edit/shopping_list/shopping_list_1.jpg" width="300"><br>
<img src="img/compl_edit/shopping_list/shopping_list_2.jpg" width="300"><br>
<img src="img/compl_edit/shopping_list/shopping_list_3.jpg" width="300"><br>
<hr></details>

### les221 shop list with FireBase
- http request/response & try catch & FutureBuilder
<img src="img/compl_edit/shopping_list/shop_list_fire_base_1.jpg" width="300">
<details>
<img src="img/compl_edit/shopping_list/shop_list_fire_base_1.jpg" width="450">
<img src="img/compl_edit/shopping_list/shop_list_fire_base_2.jpg" width="450">
<img src="img/compl_edit/shopping_list/shop_list_fire_base_3.jpg" width="250">
<img src="img/compl_edit/shopping_list/shop_list_fire_base_4.jpg" width="250">
<hr></details>

### les237 favorite place app
- image_picker, local database sql lite
- use native sensors in device: gps, camera 
- using: geoLocation + FlutterMap & openstreetmap
- ColorScheme.fromSeed, png with opacity / transparent
<img src="img/compl_edit/place/places_screen.jpg" width="200">
<details>
  <summary>▶️ Demo animation - click to expand (⚠️23MB — loading may take time)</summary>
  <img src="img/compl_edit/place/places_animation.gif"/>
<hr></details>


### les271 chat app (msg bubble)
- device camera
- supabase: user authentication, storage, database
- img upload to a Backend (Backend via a SDK)
- using flutter_dotenv, mime (for auto mime type img png/jpg/etc)
- connectivity_plus - check network connection
- log print example, 
- push notification using onesignal.com
<img src="img/compl_edit/chat_app/chat_app_auth.jpg" width="200">
<details>
  <summary>▶️ Demo animation - click to expand (⚠️18MB — loading may take time)</summary>
  <img src="img/compl_edit/chat_app/chat_app.gif"/>
  <img src="img/compl_edit/chat_app/chat_app.jpg" width="450"/>
<hr></details>

<hr>--------------------------------------------------------------------------------

### Learn_flutter
###### https://www.udemy.com/course/learn_flutter/
<details>
- main_lesson15_16_img_font
<img src="img/learn_flutter/main_lesson15_16_img_font.jpg" width="300"><br>
- state_ful_less_13_14
- main_lesson13_stateless btn don't work
<img src="img/learn_flutter/main_lesson13_stateless.jpg" width="300"><br>
- main_lesson22_row_column
<img src="img/learn_flutter/main_lesson22_row_column.jpg" width="300"><br>
- main_lesson23_expanded
<img src="img/learn_flutter/main_lesson23_expanded.jpg" width="300"><br>
- main_lesson24_stack
<img src="img/learn_flutter/main_lesson24_stack.jpg" width="300"><br>
- main_lesson25_weather_app
<img src="img/learn_flutter/main_lesson25_weather_app.jpg" width="300"><br>
- main_lesson26_list_view
<img src="img/learn_flutter/main_lesson26_list_view.jpg" width="300"><br>
- main_lesson27_list_view_generate
<img src="img/learn_flutter/main_lesson27_list_view_generate.jpg" width="300"><br>
- main_lesson28_list_view_dynamic
<img src="img/learn_flutter/main_lesson28_list_view_dynamic.jpg" width="300"><br>
- main_material_design_9_10
<img src="img/learn_flutter/main_material_design_9_10.jpg" width="300"><br>
- main_scaffold_11_12
<img src="img/learn_flutter/main_scaffold_11_12.jpg" width="300"><br>
- dart testing unit, widget, integration (& e2e) (pubspec.yaml -> integration_test)
- toJson, fromJson and http.Client and mocktail 
<img src="img/learn_flutter/les132/testing_pyramid.jpg" width="300"><br>
<img src="img/learn_flutter/les132/arrange_act_assert.jpg" width="300"><br>
<img src="img/learn_flutter/les132/calc.jpg" width="300"><br>
<hr></details>
<hr>

### pro_flutter
###### https://www.udemy.com/course/pro_flutter/
<details>
- lesson_10_1
<img src="img/pro_flutter/lesson_10_1.jpg" width="300"><br>
- lesson_10_2
<img src="img/pro_flutter/lesson_10_2.jpg" width="300"><br>
- lesson_11
<img src="img/pro_flutter/lesson_11.jpg" width="300"><br>
- lesson_9
<img src="img/pro_flutter/lesson_9.jpg" width="300"><br>
- lesson_9/four_main_row_column
<img src="img/pro_flutter/four_main_row_column.jpg" width="300"><br>
- lesson_9/six_main_grid_view
<img src="img/pro_flutter/six_main_grid_view.jpg" width="300"><br>
- navigation_routes_14
- <img src="img/pro_flutter/navigate_route_1.jpg" width="300">
- <img src="img/pro_flutter/navigate_route_2.jpg" width="300"><br>
- /widgets_examples/list_view7
<img src="img/pro_flutter/widgets_examples/list_view_7.jpg" width="300"><br>
- /widgets_examples/grid_view_table_8
<img src="img/pro_flutter/widgets_examples/grid_view_table_8.jpg" width="300"><br>
- /widgets_examples/column_row_horizontal_vertical
<img src="img/pro_flutter/widgets_examples/column_row_horizontal_vertical.jpg" width="300"><br>
- /widgets_examples/lesson9
<img src="img/pro_flutter/widgets_examples/send_data_to_other_device.jpg" width="300"><br>
- /widgets_examples/theme_example13_main
<img src="img/pro_flutter/widgets_examples/theme_example13_main.jpg" width="300"><br>
<hr></details>
<hr>

### other_lessons
<details>
- filepicker_dont_ready 
<img src="img/other_lessons/filepicker_dont_ready.jpg" width="300"><br>
- infinite_list
<img src="img/other_lessons/infinite_list.jpg" width="300"><br>
- jsonuse_example
<img src="img/other_lessons/jsonuse_example.jpg" width="300"><br>
- 1) using_edittext.dart (720)
<img src="img/other_lessons/using_edittext.jpg" width="300"><br>
- 2) text_editor_v2.dart (720)
<img src="img/other_lessons/text_editor_v2.jpg" width="300"><br>
- 3) text_editor_v1.dart (720)
<img src="img/other_lessons/text_editor_v1.jpg" width="300"><br>
</details>