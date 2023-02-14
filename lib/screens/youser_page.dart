
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class YouserPage extends StatefulWidget {
  const YouserPage({super.key});

  @override
  State<YouserPage> createState() => _YouserPageState();
}

class _YouserPageState extends State<YouserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: Container(
  padding:const EdgeInsets.all(10) ,
  child: ListView(
    children: [
      TextButton.icon(onPressed: (){FlutterPhoneDirectCaller.callNumber('+91 8075613583');}, icon: Icon(Icons.call), label: Text("Help")),
      
      const SizedBox(height: 10,),
      Row(
        children: const [
          Icon(
            Icons.person,
            color: Colors.blue,
          ),
            SizedBox(width: 10,),
            Text("Account",style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold) ,)
        ],
      ),
      Divider(height: 20,thickness: 1,),
        SizedBox(height: 10,),

        buildAccounOption(context,"Socil"),
 

    ],
  ),
),

    );
  }
  GestureDetector buildAccounOption(BuildContext context,String title){
    return GestureDetector(
   onTap: (){
  

   },
   child:  Padding(
    padding:const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
   child: Row(

   mainAxisAlignment: MainAxisAlignment.spaceBetween,  
   children: [
    Text(title,style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.grey[600]
    ),),
    const Icon(Icons.arrow_forward,color: Colors.grey,),
   ], 
   ),
   
   
   ),



    );
  }



}