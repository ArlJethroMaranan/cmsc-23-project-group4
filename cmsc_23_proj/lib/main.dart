import 'package:cmsc_23_proj/screens/admin_view/admin_main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (setting) {
        if (setting.name == '/'){
          return MaterialPageRoute(builder: (context) => AdminMain());
        }
      },
    );
  }
}