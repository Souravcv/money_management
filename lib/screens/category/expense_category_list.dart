import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:money_management/db/category/category_db.dart';

import '../../models/category/category_models.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:CategoryDB().expenseCategory,
       builder: (BuildContext ctx, List<CategoryModel> newlist, Widget? _){

      return  ListView.separated(
      itemBuilder: (ctx,index){
        final Category = newlist[index];
     return   Card(
       child: ListTile(
        title: Text(Category.name),
        trailing: IconButton(onPressed: (){
           CategoryDB.instance.deleteCategory(Category.id);
        },
         icon: const Icon  (Icons.delete),
        
        ),
       ),
     );
      },
       separatorBuilder: (ctx,index){
        return const SizedBox(height: 10,);
       },
        itemCount: newlist.length)
        ;
       }
       );
    
    
    
    }
  

  static void notifyListeners() {}
}



























