import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../providers/todo_provider.dart';
import '../data/models/todo_model.dart';

class AddEditTodoScreen extends ConsumerWidget {
  final TodoModel? todo;
  AddEditTodoScreen({this.todo, super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (todo != null) controller.text = todo!.title;

    return Scaffold(
      appBar: AppBar(title: Text(todo != null ? "Edit Todo" : "Add Todo")),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(controller: controller, hintText: "Todo Title"),
            SizedBox(height: 20),
            CustomButton(
              title: "Save",
              onPressed: () {
                final title = controller.text.trim();
                if (title.isEmpty) return;
                if (todo != null) {
                  ref.read(todoListProvider.notifier).updateTodo(todo!.id, title);
                } else {
                  ref.read(todoListProvider.notifier).addTodo(title);
                }
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}