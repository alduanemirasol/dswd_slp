import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/security_question_view_model.dart';

class SecurityQuestionScreen extends StatefulWidget {
  const SecurityQuestionScreen({super.key});

  @override
  State<SecurityQuestionScreen> createState() => _SecurityQuestionScreenState();
}

class _SecurityQuestionScreenState extends State<SecurityQuestionScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final viewModel = context.read<SecurityQuestionViewModel>();
        viewModel.loadQuestions();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SecurityQuestionViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text("Security Questions")),
      body: viewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: viewModel.questions.length,
              itemBuilder: (context, index) {
                final question = viewModel.questions[index];
                return ListTile(title: Text(question.text));
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.loadQuestions(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
