import 'package:flutter/material.dart';
import 'package:money_management/screens/add_transaction/screen_add_transaction.dart';
import 'package:money_management/screens/category/screen_category.dart';
import 'package:money_management/screens/home/widgets/bottom_navigation.dart';
import 'package:money_management/screens/transaction/screen_transaction.dart';
import '../category/category_add_popup.dart';
import '../youser_page.dart';


class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  static ValueNotifier<int> selectedIntexNotifier = ValueNotifier(0);
  final _pages = const [
    ScreenTransaction(),
    ScreenCategory(),
    YouserPage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 67, 47, 99),
        title: const Text('MONEY MANAGER'),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIntexNotifier,
          builder: (BuildContext context, int updatedIntex, _) {
            return _pages[updatedIntex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
         backgroundColor:const Color.fromARGB(255, 67, 47, 99),
        onPressed: () {
          if (selectedIntexNotifier.value == 0) {
        
            Navigator.of(context).pushNamed(ScreenaddTransaction.routeName);
          } else {
            showCaTegoryAddpopup(context);
          

          }
        },
        child: const Icon(Icons.add),
      ),
      
    );
  }
}
