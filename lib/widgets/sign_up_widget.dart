import 'package:flutter/material.dart';
import 'package:flutter_application_covid19/provider/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Lottie.asset(
              'assets/26428-covid-19-protect.json',
              animate: true,
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hey There,\n Welcome to Covid19 Tracker',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login to your account to continue',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                minimumSize: const Size(double.infinity,50),
              ),
              icon: const FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red,
                ),
              label: const Text('Sign Up with Google'),
              onPressed: () {
                final provider = 
                  Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
            ),
            const SizedBox(height: 40),
            RichText(
              text: const TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            const Spacer(),
          ],
        ),
      
    );
  }
}
