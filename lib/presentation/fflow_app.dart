import 'package:fflow_test_app/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class FFlowApp extends StatelessWidget {
  const FFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
