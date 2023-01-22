import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx,index){
     return   Card(
       child: ListTile(
        title: Text('expense CategoryList $index'),
        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete),
        
        ),
       ),
     );
      },
       separatorBuilder: (ctx,index){
        return const SizedBox(height: 10,);
       },
        itemCount: 100);
  }
}