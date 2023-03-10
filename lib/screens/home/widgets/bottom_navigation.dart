import 'package:flutter/material.dart';

import 'package:money_management/screens/home/screen_home.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key, });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ScreenHome.selectedIntexNotifier,
      builder:(BuildContext ctx, int updatedIntex, Widget? _){
        return BottomNavigationBar(
           backgroundColor:const Color.fromARGB(255, 67, 47, 99),
          selectedItemColor:const Color.fromARGB(255, 162, 158, 196) ,
          unselectedItemColor:const Color.fromARGB(255, 0, 0, 0),
        currentIndex: updatedIntex,
        onTap:(newIndex){
       
          ScreenHome.selectedIntexNotifier.value = newIndex;
    
        } ,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Category'),
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Transaction'),
         BottomNavigationBarItem(icon: Icon(Icons.perm_identity_sharp),label: 'Me'),
         
      ]);
      } ,
    );
  }
}