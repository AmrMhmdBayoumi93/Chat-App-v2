  import 'package:chatapp/components/custom_button.dart';
import 'package:chatapp/components/custom_text_filed.dart';
import 'package:chatapp/constants.dart';

import 'package:flutter/material.dart';
 
class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
 
   static  String id = 'RegisterScreen';
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kPrimaryColor,

      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                      
                  const SizedBox(height: 25,), 
                      
                     //   assets\images\scholar.png
                    Image.asset('assets/images/Scholar.png',
                    width: 100,
                    height: 100,),
                      
                      // SizedBox(height: 100,),
                      
                      
                        
                      
                const Text(
                          'Scholar Chat',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontFamily: 'pacifico',
                          ),
                        ),
                 
                       const SizedBox(height: 100,),
                 const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text('REGISTER',
                                   style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                      
                                   ),
                                   ),
                   ],
                 ),
              
               
                        // TextFormField() sign in 
                      
               CustomTextFiled(
                onChanged:(data){
                 String email=data;

                },
                hintText: 'Email',
               ),
                const SizedBox(height: 10,),

               CustomTextFiled(
                 onChanged:(data){
                 String password=data;

                },
                hintText: 'Password',
               ),
             

  const SizedBox(height: 25,),

 
 
 

  // Wrap Container() in the CustomButton class Widget with GestureDetector() 
              CustomButton( 

                buttonName: 'Register',
                onTap: (){
                  print('Register');
               
                }, 

                 
                ),


               const SizedBox(height: 15,),




                  Row(


                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    Text('Already have an account? ',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                    ),


               

GestureDetector(
  onTap:(){
      Navigator.pop(context);               // return to last login screen
  },
                      child: Text(' Login here ',
                      style: TextStyle(
                         fontSize: 22,
                        color: Colors.white,
                        fontWeight:  FontWeight.bold,
                      ),),
                    ),







                  
                  
                  ],),




















               

                       










               
               
               
               
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}

