// typedef https://www.youtube.com/watch?v=OVHnhjZzGWA&list=PLyaYkfwvXhRLQSevXcKNIlz4JtPt2W7P_&index=14
typedef FunctionTypeAlias = bool Function(int); // new way in Dart
typedef int FunctionTypeAlias2(int); // old way in Dart

void main(List<String> arguments) {
  // Замыкание - https://www.youtube.com/watch?v=9ONB8FWqSMA&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=29
  // Пример на кнригах
  // название книги постоянно, а вот издатель может меняться

  // Closure: (dynamic, dynamic) => dynamic from Function 'getBook': static.
  // print(getBook);
  // bookName: Harry Potter, bookPublisher: O'Really
  // print(getBook('Harry Potter', "O'Really"));

  // НЕ ПОНЯЛ! _ выдает не то что ожидается из обучал видео
  var bookResult = getBookWithClosure('Time Mashine');
  bookResult('Second return Edition');
  print(bookResult); // Closure: (dynamic) => String
  bookResult('Another Publisher Editor _ is changed');
  print(bookResult); // Closure: (dynamic) => String
// ---

//------------------------------------------------------
// 10min https://www.youtube.com/watch?v=_k9Xu61XlVE&list=PLyaYkfwvXhRLQSevXcKNIlz4JtPt2W7P_&index=13
  var numbers = <int>[1, 2, 3];
  var removeCallBack = (int a) => numbers.remove(a);
  doWorkForClosure(removeCallBack);
  print('numbers: $numbers'); // [2, 3]

  // How to add!? _ instead remove(a)!?
  // var numbersList = <int>[1, 2, 3];
  // var addCallBack = (var a) => numbersList.add(8);
  // doWorkForClosureWithTypeDef2(addCallBack);
  // doWorkForClosureWithTypeDef2(addCallBack);
  // print('numbers: $numbers'); // [2, 3]
}

doWorkForClosureWithTypeDef2(FunctionTypeAlias2 callback) {
  var result = callback(1);
  print('doWorkForClosureWithTypeDef2: $result');
}

void doWorkForClosureWithTypeDef(FunctionTypeAlias callback) {
  var result = callback(1);
  print('doWorkForClosureWithTypeDef: $result'); // true
}

void doWorkForClosure(bool Function(int) callback) {
  var result = callback(1);
  print('doWorkForClosure: $result'); // true
}

getBookWithClosure(bookName) {
  return (bookPublisher) {
    return 'bookName: $bookName, bookPublisher: $bookPublisher';
  };
}

getBook(bookName, bookPublisher) {
  return 'bookName: $bookName, bookPublisher: $bookPublisher';
}
