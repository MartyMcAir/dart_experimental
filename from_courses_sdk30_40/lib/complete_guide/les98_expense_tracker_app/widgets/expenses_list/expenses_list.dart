import 'package:flutter/material.dart';

import '../../models/expense.dart';
import '../../widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    // Column() не подойдет когда слишком большое кол-во элементов необходимо отображать
    // И мы точно знаем что все элементы в рамках одного экрана не поместятся
    // и нужен будет скролл и плохо для нагрузки на устройство
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
            color: Theme.of(context).colorScheme.error.withAlpha(190),
            // margin: const EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.symmetric(
              // get margin for card from main Theme
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            )),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
