import 'package:flutter/material.dart';
import 'package:lifely/core/theme/theme.dart';
import 'package:lifely/features/student_view/presentation/screens/student_view.dart';
import 'package:lifely/splash_screen.dart/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Lifely());
}

class Lifely extends StatelessWidget {
  const Lifely({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const StudentView(),
    );
  }
}
