import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/screens/home/screen_home.dart';

class Login extends StatefulWidget {
   Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
final nameController = TextEditingController();

final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Padding(padding: EdgeInsets.all(25),
    child: Center(
      child: SingleChildScrollView(
        child: Column(
          children:  [
            const SizedBox(height: 40,),
            Icon(Icons.person_outline,color: Colors.grey[300],size: 145,),
         const   SizedBox(height: 13,),
            const Text("Wellcome to Money manager",style:TextStyle(fontSize:30,fontWeight: FontWeight.bold ),
            ),
            Text("What can i callyou",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey[400]),
            ),
          const  SizedBox(height: 20,),
          Column(
            children: [
              


                 TextFormField( 
                  controller: nameController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  decoration: InputDecoration(
                    
                    border: InputBorder.none,
                    prefixIcon:Icon(Icons.person,size: 30,) ,
                    labelText: "Name",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w800,
                    )
                  ) ,
                ),
                 TextFormField( 
                  controller: emailController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  decoration: InputDecoration(
                    
                    border: InputBorder.none,
                    prefixIcon:Icon(Icons.email,size: 30,) ,
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w800,
                    )
                  ) ,
                ),
              
            ],
          ),
          SizedBox(height:60 ,
          width: double.infinity,
          child:
           ElevatedButton(
            
            onPressed: (){
              vcheckLogin(context);

        //       Navigator.of(context).pushReplacement(
        // MaterialPageRoute(builder: (ctx) => const ScreenHome()));
            }, 
            child: const Text("Login"),),
          ),
        
      
          ],
        ),
      ),
    ),
    ),
    
      
    );
  }

  vcheckLogin(BuildContext ctx){
 final names = nameController.text;
 final email = emailController.text;
 if(names!=email){
  validateEmail(ctx);
  
 }else{
 ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(content:Text("pless enter name") ));
 }
  }
  void validateEmail(BuildContext ctx){
final bool isVlaid =   EmailValidator.validate(emailController.text.trim());
if(isVlaid){
  Navigator.of(ctx).push(
        MaterialPageRoute(builder: (ctx) => const ScreenHome()));
}else{
   ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(content:Text("please enter valid email address") ));
}
}

}
