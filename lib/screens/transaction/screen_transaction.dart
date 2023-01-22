import 'package:flutter/material.dart';


class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding:const EdgeInsets.all(10) ,
      itemBuilder: (ctx,intex){
      return const Card(
        elevation: 0,
        child: ListTile(
          leading:CircleAvatar(child: Text('19\njan', textAlign:TextAlign.center,),
          radius: 50,

          ),
          title:Text('RS 200000') ,
          subtitle: Text('Travel'),
        ),
      );

    },
     separatorBuilder: ( ctx,intex){
    return const SizedBox(height: 10,);
    }, itemCount: 10);
  }
}