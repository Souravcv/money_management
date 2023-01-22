import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/screens/home/screen_home.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

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
          selectedItemColor:Color.fromARGB(255, 53, 149, 204) ,
          unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
        currentIndex: updatedIntex,
        onTap:(newIndex){
          ScreenHome.selectedIntexNotifier.value = newIndex;
    
        } ,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Transaction'),
        BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Category')
      ]);
      } ,
    );
  }
}