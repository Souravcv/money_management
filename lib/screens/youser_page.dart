
import 'package:flutter/material.dart';




class YouserPage extends StatelessWidget {
  const YouserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
        Center(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 350,),
           
           SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                showModalBottomSheet(
                  shape:const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    )
                  ) ,
                  context:context ,
                  builder:(BuildContext context){
                    Column(children:const [
                      
                    ],);
                     return SizedBox(
                      height: 300,
               child:Column(children:  [
                Padding(padding: EdgeInsets.all(5)),
              
                Center(child: Column(
                  children: [
                    const SizedBox(height: 50,),
                    const Text("Manager Your Daily \n   Activiy So Easy",style: TextStyle(fontSize: 30),),
                    const SizedBox(height: 10,),
                    const Text('The smart tool is designed to help you\n          manager yourdaily activity'),
                     const SizedBox(height: 20,),
                    ElevatedButton(
                      style:ElevatedButton.styleFrom(primary: Colors.black) ,
                      onPressed: (){},
                     child:  Text("Get Started",style: TextStyle(fontSize: 20),),)
                  ],
                ),
                
                )
               
                  
               ]),
      
                     
                     );
                  });
              }, 
              child: const Text("click")),
          ],
        ),
      ),

     ) ],)),
    );
  }
}

