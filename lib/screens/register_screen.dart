import 'package:chatapp/components/custom_button.dart';
import 'package:chatapp/components/custom_text_filed.dart';
import 'package:chatapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static String id = 'RegisterScreen';

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  CustomTextFiled(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFiled(
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
                      if (email == null || password == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter both email and password'),
                          ),
                        );
                        return;
                      }
                      

                      FirebaseAuth auth = FirebaseAuth.instance;
                      try {
                        UserCredential userCredential = await auth.createUserWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                        print(userCredential.user!.email);
                        print(userCredential.user!.displayName);
                        print('Register is done');

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Registration successful'),
                          ),
                        );
                      }

                       on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                           print('The password provided is too weak.');
                           ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                               content: Text('The password provided is too weak.'),
                             ),
                           );
                           
                         } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('The account already exists for that email.')),);

                         }

                      }  
                      
                      catch(e){
               ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Successfully registered***')),);
                      }
                       

                    },  
                  ),





                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
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
                        child: Text(
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
        ),
      ),
    );
  }
}
