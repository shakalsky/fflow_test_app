import 'package:fflow_test_app/dependency_injector.dart';
import 'package:fflow_test_app/firebase_options.dart';
import 'package:fflow_test_app/presentation/fflow_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initInjector();
  runApp(const FFlowApp());
}
