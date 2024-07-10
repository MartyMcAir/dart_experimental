import 'package:flutter/material.dart';

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      // с закомменченной поиск ботомшита уйдет влево
      // padding: const EdgeInsets.all(20),
      // даллее паддинг такой же закинут в SearchRhymeBottomSheet
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
      child:
          // Column( // Если разсместить колонку внути другой
          //  и даже если это было из другого метода/класса
          // тогда верстака сломается
          // children: [

          SizedBox(
              // -60 это как бы отступ _ но эт bad подход
              // height: MediaQuery.of(context).size.height - 60,
              width: double.infinity,
              child: child),

      //   ],
      // ), .. Column
    );
  }
}
