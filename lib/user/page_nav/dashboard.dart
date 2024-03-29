import 'package:belajar_flutter/user/navbar/navbar.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final Function(ItemListSections) feedbackCallback;

  const DashboardPage({Key? key, required this.feedbackCallback})
      : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Dashboard Page"),
            TextButton(
                onPressed: () =>
                    {widget.feedbackCallback(ItemListSections.Survey)},
                child: Text("Survey"))
          ],
        ),
      ),
    );
  }
}
