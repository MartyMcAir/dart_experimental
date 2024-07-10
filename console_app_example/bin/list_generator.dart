// https://www.youtube.com/watch?v=izr7uBuiacE
void main(List<String> arguments) {
  // print(List.filled(5, 0)); // [0, 0, 0, 0, 0]

  // List<int> threeList = List.filled(3, 3); // [3, 3, 3]
  // print(threeList); // [3, 3, 3]

  // print(List.of([1, 2, 3])); // [1, 2, 3]

  // print(List.unmodifiable([1, 2, 3])); // [1, 2, 3]

  // GENERATE dates  ------------------
  print(List.generate(31, (index) => DateTime(2024, 1, index)));
  // [2023-12-31 00:00:00.000, 2024-01-01 00:00:00.000, 2024-01-02 00:00:00.000, 2024-01-03 00:00:00.000, 2024-01-04 00:00:00.000, 2024-01-05 00:00:00.000, 2024-01-06 00:00:00.000, 2024-01-07 00:00:00.000, 2024-01-08 00:00:00.000, 2024-01-09 00:00:00.000, 2024-01-10 00:00:00.000, 2024-01-11 00:00:00.000, 2024-01-12 00:00:00.000, 2024-01-13 00:00:00.000, 2024-01-14 00:00:00.000, 2024-01-15 00:00:00.000, 2024-01-16 00:00:00.000, 2024-01-17 00:00:00.000, 2024-01-18 00:00:00.000, 2024-01-19 00:00:00.000, 2024-01-20 00:00:00.000, 2024-01-21 00:00:00.000, 2024-01-22 00:00:00.000, 2024-01-23 00:00:00.000, 2024-01-24 00:00:00.000, 2024-01-25 00:00:00.000, 2024-01-26 00:00:00.000, 2024-01-27 00:00:00.000, 2024-01-28 00:00:00.000, 2024-01-29 00:00:00.000, 2024-01-30 00:00:00.000]

  // GENERATE widgets  ------------------
  // Column(children: List.generate(5, (index) => MyWidget(index)));

  // GENERATE 5 STARS  ------------------
  // not full example
  // final stars = List.generate(5,
  // (int index) => StarIcon(selected: selectedIndex <= index,
  //   onPressed: (){
  //     setState: (){
  //       selectedIndex = index;
  //       },
  //       },
  //       ),
  // );

  // GENERATE with 3 ...dots  ------------------
  // Row(children: [
  //   Text(book.title),
  //   ...stars,
  //   PurchaseButton(),
  // ]);
}