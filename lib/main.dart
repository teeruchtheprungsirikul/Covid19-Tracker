import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_covid19/page/home_page.dart';
import 'package:flutter_application_covid19/provider/google_sign_in.dart';
//import 'package:flutter_application_covid19/widgets/sign_up_widget.dart';
//import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = 'MainPage';
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData.dark().copyWith(
              colorScheme:
                  ColorScheme.fromSwatch().copyWith(secondary: Colors.indigo)),
          home: const HomePage(),
        ),
      );
}


