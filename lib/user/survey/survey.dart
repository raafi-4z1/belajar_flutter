import 'package:belajar_flutter/user/navbar/navbar.dart';
import 'package:flutter/material.dart';

class SurveyPage extends StatefulWidget {
  final Function(ItemListSections) feedbackCallback;

  const SurveyPage({Key? key, required this.feedbackCallback})
      : super(key: key);

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Survey Page"),
            TextButton(
                onPressed: () =>
                    {widget.feedbackCallback(ItemListSections.Dashboard)},
                child: Text("Kembali"))
          ],
        ),
      ),
    );
  }
}
