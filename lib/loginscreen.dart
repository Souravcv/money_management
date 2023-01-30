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
  String _status = '';

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      // 2. Pass that key to the `IntroductionScreen` `key` param
      key: _introKey,
      pages: [
        PageViewModel(
       image: Image.asset('assets/images/money.jpeg',height: 250,),
        title: "hello sourav",
        body: "Investment tracking: Some money management applications can help you track your investments, including stocks, mutual funds, and exchange-traded funds. This information can help you make informed decisions about your investments.",
     
      ),
        PageViewModel(
          
        image: Image.asset('assets/images/WhatsApp Image 2023-01-30 at 5.55.30 PM.jpeg',height: 250,),
        title: "hello sourav",
        body: "Financial reports: Money management applications often generate reports that give you a snapshot of your financial situation. These reports can be used to identify areas where you are spending too much money and to make adjustments to your budget.",
        
      ),
        PageViewModel(
       image: Image.asset('assets/images/moneymanager.jpeg',height: 250,),
        title: "hello sourav",
        body: "A money management application is a software tool that helps individuals and organizations manage their finances. It typically provides features such as budget tracking, expense tracking, investment tracking, and bill reminders. The goal of a money management application is to give users a complete overview of their financial situation and help them make informed decisions about spending, saving, and investing. Some popular examples of money management applications include Mint, Personal Capital, and YNAB (You Need A Budget). ",
       
      ),



        PageViewModel(
          image: Image.asset("assets/images/finished.jpeg",height: 250,),
            title: "A money management application is a software tool that helps individuals and organizations manage their finances. It typically provides features such as budget tracking, expense tracking, investment tracking, and bill reminders. The goal of a money management application is to give users a complete overview of their financial situation and help them make informed decisions about spending, saving, and investing. Some popular examples of money management applications include Mint, Personal Capital, and YNAB (You Need A Budget). ",
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