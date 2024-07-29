import 'package:chatapp/components/custom_button.dart';
import 'package:chatapp/components/custom_text_filed.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/screens/register_screen.dart';
import 'package:flutter/material.dart';

  // const primaryColor = Color(0xff26435F);
 

class LoginScreen extends StatelessWidget {

 static String id = 'LoginScreen';   //  static String id

    LoginScreen({super.key});


   
  
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
                     Text('LOGIN',
                                   style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                      
                                   ),
                                   ),
                   ],
                 ),
              
               
                        // TextFormField() sign in 
                      
               CustomTextFiled(
                hintText: 'Email',
               ),
                const SizedBox(height: 10,),

               CustomTextFiled(
                hintText: 'Password',
               ),
               
  const SizedBox(height: 25,),


  


                    //Extract it then
                   // Wrap Container() with GestureDetector() 
                   
                


                
            //     Container(

            //       //color:Colors.white,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         color: Colors.white,
            //       ),
            //       width: double.infinity,
            //           height: 50, 

            // child: const Center(child: Text("Login",
            //     style: TextStyle(
            //       fontSize: 30,
            //       fontWeight:  FontWeight.bold,
            //       color: Colors.black,
            //     )
            // )),
            //     ),









  // Wrap Container() with GestureDetector() 
              CustomButton(
                onTap:(){
                  print('login');
                },
                buttonName: 'Login',),


               const SizedBox(height: 15,),




                  Row(


                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    Text('don\'t have an account? ',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                    ),



GestureDetector(
  onTap:(){
      // Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),),);
 
      // Navigator.pushNamed(context, RegisterScreen().id); // non static id -- access using object
       Navigator.pushNamed(context, RegisterScreen.id); // static id -- access using class name only
 
 
  },
                      child: Text(' Register here ',
                      style: TextStyle(
                         fontSize: 22,
                        color: Colors.white,
                        fontWeight:  FontWeight.bold,
                      ),),
                    ),
                  
                  
                  
                  ],),




























                        // ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                            
                        //     backgroundColor: Colors.white,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //   ),
                        //   onPressed:(){

                        // },
                        
                        //   child: Text('LOGIN',
                        //   style: TextStyle(
                        //     fontSize: 25,
                        //     color: Colors.black,
                        //     fontFamily: 'pacifico',
                        //   ),
                        // ),),
          

                       










               
               
               
               
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}

