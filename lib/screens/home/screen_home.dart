import 'package:flutter/material.dart';
import 'package:money_management/screens/add_transaction/screen_add_transaction.dart';
import 'package:money_management/screens/category/screen_category.dart';
import 'package:money_management/screens/home/widgets/bottom_navigation.dart';
import 'package:money_management/screens/transaction/screen_transaction.dart';

import '../category/category_add_popup.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  static ValueNotifier<int> selectedIntexNotifier = ValueNotifier(0);
  final _pages = const [
    ScreenTransaction(),
    ScreenCategory(),
  ];
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 67, 47, 99),
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
         backgroundColor:Color.fromARGB(255, 67, 47, 99),
        onPressed: () {
          if (selectedIntexNotifier.value == 0) {
            print('hello transation');
            Navigator.of(context).pushNamed(ScreenaddTransaction.routeName);
          } else {
            showCaTegoryAddpopup(context);
            // print('hello category');
            // final _sample = CategoryModel
            // (id: DateTime.now().microsecondsSinceEpoch.toString(),
            //  name: 'Travel', type: CategoryType.expense);
            // CategoryDB().insertCategory(_sample);

          }
        },
        child: const Icon(Icons.add),
      ),
      
    );
  }
}
