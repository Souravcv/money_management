import 'package:flutter/material.dart';
import 'package:money_management/screens/home/screen_home.dart';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';





class IntroScreenDemo extends StatefulWidget {
  @override
  State<IntroScreenDemo> createState() => _IntroScreenDemoState();
}

class _IntroScreenDemoState extends State<IntroScreenDemo> {
  // 1. Define a `GlobalKey` as part of the parent widget's state
  final _introKey = GlobalKey<IntroductionScreenState>();
  String _status = 'Waiting...';

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      // 2. Pass that key to the `IntroductionScreen` `key` param
      key: _introKey,
      pages: [
        PageViewModel(
       image: Image.asset('assets/images/WhatsApp Image 2023-01-28 at 3.14.27 PM (1).jpeg',height: 50,),
        title: "hello sourav",
        body: "igfpieyfgwieyghfd rgweuwegffuygb",
     
      ),
        PageViewModel(
        image: Image.asset('assets/images/WhatsApp Image 2023-01-28 at 3.14.27 PM (1).jpeg',height: 50,),
        title: "hello sourav",
        body: "igfpieyfgwieyghfd rgweuwegffuygb",
        
      ),
        PageViewModel(
       image: Image.asset('assets/images/WhatsApp Image 2023-01-28 at 3.14.27 PM (1).jpeg',height: 250,),
        title: "hello sourav",
        body: "igfpieyfgwieyghfd rgweuwegffuygb",
       
      ),



        PageViewModel(
            title: 'klgfxchjkljhgcbxcvhn',
            bodyWidget: Column(
              children: [
                Text(_status),
                ElevatedButton(
                    onPressed: () {
  Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) =>  ScreenHome()));

                      setState(() => _status = 'Going to the next Home...');

                      // 3. Use the `currentState` member to access functions defined in `IntroductionScreenState`
                      Future.delayed(const Duration(seconds: 3),
                          () => _introKey.currentState?.next());
                    },
                    child: const Text('skip'))
              ],
            )),
     
      ],
      showNextButton: false,
      showDoneButton: false,
    );
  }
}