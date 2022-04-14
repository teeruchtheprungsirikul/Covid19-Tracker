import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_covid19/widgets/logged_in_widget.dart';
import 'package:flutter_application_covid19/widgets/sign_up_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return const LoggedInWidget();
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something Went Wrong!'));
            } else {
              return const SignUpWidget();
            }
          },
        ),
      );
}
