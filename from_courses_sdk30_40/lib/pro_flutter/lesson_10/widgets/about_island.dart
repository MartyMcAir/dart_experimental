import 'package:flutter/material.dart';

class AboutIsland extends StatelessWidget {
  const AboutIsland({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Остров Бали',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Бали — настоящая сказка наяву, прекрасный остров, покрытый террасами изумрудных рисовых полей и лесами из гвоздичных и коричных деревьев, усыпанных ароматными цветами. ',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
