import 'package:flutter/material.dart';

import '../calculator.dart';

// les136 https://www.udemy.com/course/learn_flutter/learn/lecture/33644494#overview
class PowerOfTwo2 extends StatefulWidget {
  final Calculator calculator;

  const PowerOfTwo2({super.key, required this.calculator});

  @override
  State<PowerOfTwo2> createState() => _PowerOfTwo2State();
}

class _PowerOfTwo2State extends State<PowerOfTwo2> {
  final _controller = TextEditingController();

  String _result = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(_getResult);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'To the power of two:',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        TextField(
          key: const Key('textField_powerOfTwo'),
          controller: _controller,
          keyboardType: TextInputType.number,
        ),
        const Divider(),
        Text(
          'Result: $_result',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Divider(),
      ],
    );
  }

  void _getResult() async {
    try {
      final input = double.tryParse(_controller.text);
      final powerOfTwoResult = await widget.calculator.powerOfTwo(input!);
      setState(() {
        _result = powerOfTwoResult.toString();
      });
    } catch (_) {
      setState(() {
        _result = '';
      });
    }
  }
}
