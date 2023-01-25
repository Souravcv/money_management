import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management/db/category/category_db.dart';
import 'package:money_management/models/category/category_models.dart';

import '../../db/trasactions/trasactions_db.dart';
import '../../models/transaction/transaction_model.dart';


class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refriesh();
    CategoryDB.instance.refreshUI();
    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.TransactionListNotifier,
       builder: (BuildContext ctx, List<TransactionModel>newList, Widget? _){
        return ListView.separated(
      padding:const EdgeInsets.all(10) ,
     
      itemBuilder: (ctx,intex){
         final _value = newList[intex];
      return  Card(
        elevation: 0,
        child: ListTile(
          leading:CircleAvatar(
            radius: 50,
            child: Text(
              parseDate(_value.date),
             textAlign:TextAlign.center,
             ),
             backgroundColor:_value.type == CategoryType.income?Colors.blueGrey:Colors.red ,
          

          ),
          title:Text('RS ${_value.amount}') ,
          subtitle: Text(_value.category.name),
        ),
      );

    },
     separatorBuilder: ( ctx,intex){
    return const SizedBox(height: 10,); 
    }, itemCount: newList.length);
       });
  }
  String parseDate(DateTime date){
    final _date = DateFormat.MMMd().format(date);
    final _spliteDate = _date.split(' ');
   return '${_spliteDate.last}\n ${_spliteDate.first}';

   // return '${date.day}\n${date.month}';
  }
}