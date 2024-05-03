// import 'package:dart_application_1/some_function_without_class.dart';

// как работать с breakpoints: https://code.visualstudio.com/docs/editor/debugging#_breakpoints

// https://github.com/dart-archive/dart-tutorials-samples
// +++ https://www.jpryan.me/dartbyexample/

import '../lib/utils/enum_colors.dart';

void main(List<String> arguments) {
  useEnumExample();

  final vasyaPet = Pet.dog;
  if (vasyaPet == Pet.dog) {
    print('Vasya walks the dog');
  }
  print('vasyaPet under index: $vasyaPet.index'); // 0
  print('vasyaPet under name: $vasyaPet.name'); // dog

  _printPetName(vasyaPet);
  print(Animals.dog.almosLocalizationTransliteration);
  Animals.cat._functionInEnum();
}

useEnumExample() {
  // ENUM перечисление - https://www.youtube.com/watch?v=_bPS1hPE0bs&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=28
  MyColors someColor = MyColors.green;
  int someColorIndex = MyColors.green.index;
  print('some color: $someColor, and index: $someColorIndex');
  List<MyColors> colorsList = MyColors.values;
  print('enumListSize: ${colorsList.length}');
  // for (int i = 0; i < colorsList.length; i++) {
  //   print('name: ${colorsList[i].name}, and opacity: ${colorsList[i].opacity}'); }

  // for (var element in colorsList) {
  //   print('name: ${element.name}, and opacity: ${element.opacity}'); }

  colorsList.forEach((element) {
    print('name: ${element.name}, and opacity: ${element.opacity}');
  });
}

// https://www.youtube.com/watch?v=KdVD7yOZ1IU&list=PLtUuja72DaLLAo63Zsn1UsLONDafJKWrl&index=17
enum Pet { dog, cat, bird }

void _printPetName(Pet somePet) {
  switch (somePet) {
    case Pet.dog:
      print(somePet.name);
      break;
    case Pet.cat:
      print(somePet.name);
      break;
    case Pet.bird:
      print(somePet.name);
      break;
  }
}

// Enhanced enums
enum Animals {
  dog('sobaka'),
  cat('koshka'),
  bird('ptica');

  const Animals(this.almosLocalizationTransliteration);
  final String almosLocalizationTransliteration;

  void _functionInEnum() {
    print('holly shitt! it\'s a: $almosLocalizationTransliteration');
  }
}
