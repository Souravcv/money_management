import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class YouserPage extends StatelessWidget {
  const YouserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
           
              TextButton.icon(
                onPressed: () {
                   showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      )),
                      context: context,
                      builder: (BuildContext context) {
                        Column(
                          children: const [],
                        );
                        return SizedBox(
                          height: 300,
                          child: Column(children: [
                            Padding(padding: EdgeInsets.all(5)),
                            Center(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  const Text(
                                    "About us",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                       "my name is sourav cv i am an growing flutter developer this is my\n first flutter project this app  makes your financial habits  \nbetter if you want to know about me and my flutter project this is my\nwebsite link https://souravcv.github.io/sourav-personal-website/ contact me"),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.black),
                                    onPressed: () {},
                                    child: Text(
                                      "ok",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),
                        );
                      });
                },
                label: const Text(
                  "About us",
                  style: TextStyle(fontSize: 15),
                ),
                icon: const Icon(Icons.person_pin_sharp),
              ),
              TextButton.icon(
                onPressed: () {},
                label: const Text(
                  "Feedback",
                  style: TextStyle(fontSize: 15),
                ),
                icon: const Icon(Icons.feedback),
              ),
                 TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      )),
                      context: context,
                      builder: (BuildContext context) {
                        Column(
                          children: const [],
                        );
                        return SizedBox(
                          height: 300,
                          child: Column(children: [
                            Padding(padding: EdgeInsets.all(5)),
                            Center(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  const Text(
                                    "Privaci Policy",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                        "money manager is an app that makes it easier to analyse your spending and income. This application was my first flutter project. the source code is available on github; the URL is provided below:https://github.com/Souravcv/money_management"),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.black),
                                    onPressed: () {},
                                    child: Text(
                                      "Get Started",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),
                        );
                      });
                },
                label: const Text(
                  "Privaci & Policy",
                  style: TextStyle(fontSize: 15),
                ),
                icon: const Icon(Icons.privacy_tip),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
