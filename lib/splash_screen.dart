import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/screens/home/screen_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  gotoLogin() ;
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        body: Center(child: Image.asset('assets/images/WhatsApp Image 2023-01-28 at 3.14.27 PM (1).jpeg',height: 100,)),
    );
  }
  
  Future<void> gotoLogin() async {
  await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const ScreenHome()));
  }
  
  
}