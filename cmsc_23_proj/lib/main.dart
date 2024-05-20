import 'package:cmsc_23_proj/firebase_options.dart';
import 'package:cmsc_23_proj/screens/auth_pages/auth_main.dart';
import 'package:cmsc_23_proj/screens/not_found.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/orgProvider/providerOrg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => DonationOrgListProvider())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        colorScheme: ThemeData.dark().colorScheme.copyWith(
          background: Colors.grey[900],
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[800],
        ),
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/'){
          return MaterialPageRoute(builder: (context) => const AuthMain());
        } else {
          return MaterialPageRoute(builder: (context) => const NotFound());
        }
      },
    );
  }
}
