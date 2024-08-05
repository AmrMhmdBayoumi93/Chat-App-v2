import 'package:chatapp/components/custom_button.dart';
import 'package:chatapp/components/custom_text_form_filed.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/helper_functions/show_snackbar.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? password;

    GlobalKey<FormState> formKey=GlobalKey();
    bool isLoading =false;

  @override
  Widget build(BuildContext context) {

    return ModalProgressHUD(
      inAsyncCall: isLoading,

      child: Scaffold(
        backgroundColor: kPrimaryColor,
      
      
        body: Form(
          key:formKey,
          child: SafeArea(
            child: ListView(
              children:[
                Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25,),
                          Image.asset(
                            'assets/images/Scholar.png',
                            width: 100,
                            height: 100,
                          ),
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
                              Text(
                                'REGISTER',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
              
              
              
              
              
                            // take data from user take email by use onChanged()
              
                          CustomTextFormFiled(
                            onChanged: (data) {
                              email = data;
                            },
                            hintText: 'Email',
                          ),
                          const SizedBox(height: 10,),
              
                            // take data from user take password  by use onChanged()
              
                          CustomTextFormFiled(
                            onChanged: (data) {
                              password = data;
                            },
                            hintText: 'Password',
                          ),
                          const SizedBox(height: 25,),
              
              
              
              
              
              
              
              
                        // Register Button for create User with mail and password
                          CustomButton(
                            buttonName: 'Register',
                            onTap: () async {
                  
                  
                              // vaildate using this SnackBar()           or         using form validation  best manner
                  
                  
                              // if (email == null || password == null) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text('Please enter both email and password'),
                              //     ),
                              //   );
                              //   return;
                              // }
                              
              
              
              
                                      // validate using formKey.currentState.validate()
                            if (formKey.currentState!.validate()) {
                               formKey.currentState!.save();
                  
                              FirebaseAuth auth = FirebaseAuth.instance;
                              
                             
                               //    at the start of code register process
                              isLoading=true;
                              setState(() {
                                
                              });
            
                              try {
              
                                UserCredential userCredential = await auth.createUserWithEmailAndPassword(
                                  email: email!,
                                  password: password!,
                                );
                                print(userCredential.user!.email);
                                print(userCredential.user!.displayName);
                                print('Register is done');
              
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Registration successful'),
            
                                  ),
                                );
                                // Navigator.of(context).pop();  // go to RegisterScreen
                               
                                   Navigator.pushNamed(context, ChatScreen.id);
                                   
                              }
              
              
              
              
                               on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                   print('The password provided is too weak.');
                                   ScaffoldMessenger.of(context).showSnackBar(
                                     const SnackBar(
                                       content: Text('The password provided is too weak.'),
                                     ),
                                   );
                                   
                                 } else if (e.code == 'email-already-in-use') {
                                print('The account already exists for that email.');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('The account already exists for that email.')),);
              
                                 }
              
                              }  
                                            // for handling any other EX
                              catch(e){
                      
                       ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('there was an error try again later...')),);
                              }
            
                      
            
                            }
            
                            
            
            
                    else   {
                       showSnackBar(context , 'there was an error try again later...');
                  
                            }






                        //    at the end of code register process
                               
                      isLoading =false;
                      setState(() {
                                
                              });



              
                            },  
                          ),
              
              
              






              
              
                          const SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);  // return to the previous screen
                                },
                                child: const Text(
                                  ' Login here ',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ]
                ),
          ),
        ),
        
      ),
    );
  }

 
}
