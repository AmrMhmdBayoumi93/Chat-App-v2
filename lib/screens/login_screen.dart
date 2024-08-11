import 'package:chatapp/components/custom_button.dart';
import 'package:chatapp/components/custom_text_form_filed.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/helper_functions/show_snackbar.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

  // const primaryColor = Color(0xff26435F);
 

class LoginScreen extends StatefulWidget {

 static String id = 'LoginScreen';   //  static String id

    const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

    String? email,password;
    bool isLoading =false;
    GlobalKey<FormState> formKey=GlobalKey();




  @override
  Widget build(BuildContext context) {

    return  ModalProgressHUD(
      inAsyncCall: isLoading,
    
      child: Scaffold(
        backgroundColor: kPrimaryColor,
      
        body: Form(
          key: formKey,
      
          child: ListView(
          
            children:[
               SafeArea(
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
                          
                   CustomTextFormFiled(
                    onChanged:(data){
                        email=data;
                      },
          
          
                    hintText: 'Email',
                   ),
          
          
          
                    const SizedBox(height: 10,),
          
          
          
          
                   CustomTextFormFiled(
                    obscureText: true,
                    
                    onChanged: (data){
                      password=data;
                      },
                    
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
                                    // Login Button
          
                  CustomButton(
                    onTap:()async{
          
                      FirebaseAuth auth =FirebaseAuth.instance;
                      
                      if (formKey.currentState!.validate()){

                    
                        isLoading=true;
                              setState(() {
                                
                              });


                      

                      try {

            UserCredential userCredential = await auth.signInWithEmailAndPassword(
              email: email!,
              password: password!
            );

             print('Login success');
              print(userCredential.user!.email);

          
          //  showSnackBar(context, 'Login Successefully');
              ScaffoldMessenger.of (context).showSnackBar(
              const SnackBar(content: Text('Login Successefully'),
              duration: Duration(microseconds: 900),
              
                          ),
               
              );



              Navigator.pushNamed(context, ChatScreen.id,arguments: email);

          
           }     on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  showSnackBar(context, 'No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  showSnackBar(context, 'Wrong password provided for that user.');
                                } else if (e.code == 'too-many-requests') {
                                  showSnackBar(context, 'Access to this account has been temporarily disabled. Please try again later.');
                                } else if (e.code == 'invalid-email') {
                                  showSnackBar(context, 'The email address is badly formatted.');
                                } else if (e.code == 'user-disabled') {
                                  showSnackBar(context, 'The user account has been disabled.');
                                } else if (e.code == 'operation-not-allowed') {
                                  showSnackBar(context, 'Email/password accounts are not enabled.');
                                } else {
                                  showSnackBar(context, 'Failed to login: $e');
                                }
                              }
              catch (e){
           showSnackBar(context, ' oops there was an error... try again later');
              }
          

          } else {

                       showSnackBar(context, 'there was an error... try again later');
          }




                           
                      isLoading =false;
                      setState(() {
                                
                              });

          
                    
                    },
                    buttonName: 'Login',),
          
          
                   const SizedBox(height: 15,),
          
          
          
          
                      Row(
          
          
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
          
                        const Text('don\'t have an account? ',
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
                          child: const Text(' Register here ',
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
            
            ]
           ),
        ),
      
      ),
    );
  }
}

