import 'package:flutter/material.dart';
import 'package:flutter_application_covid19/covid19/covid.dart';
import 'package:lottie/lottie.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App-Covid19',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      //duration: const Duration(seconds: 5),
      vsync: this,
    );

    controller.addStatusListener((status) async { 
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context){
            return const CovidScreen();
          })
        );
      }
      else {
        Navigator.pop(context);
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App-Covid19'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
          const SizedBox(height: 42,),
            Lottie.asset(
              'assets/26428-covid-19-protect.json'),
            const SizedBox(
              height: 42,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                textStyle: const TextStyle(fontSize: 20),
                primary: Colors.orangeAccent
              ),
              icon: const Icon(
                Icons.medication_liquid_outlined,
                size: 42,
              ),
              label: const Text(
                'Launch',
                style: TextStyle(color: Colors.black),
                ),
              onPressed: showDoneDialog,
            ),
          ],
        ),
      ),
    );
  }

  void showDoneDialog() => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/unlock.json',
                  repeat: false,
                  controller: controller,
                  onLoaded: (composition) {
                    controller.duration = composition.duration;
                    controller.forward();
                  }
                ),
                const Text(
                  'Welcome to Global Covid19',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16,)
              ],
            ),
          ));
}


