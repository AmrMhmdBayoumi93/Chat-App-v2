
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main()async {
    

 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  
  runApp(const ChatApp());



}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {

    


    return MaterialApp(
           title: 'Chat App',
      debugShowCheckedModeBanner: false,

        // routes is a Map {
        // String value '' : ()=> RegisterScreen() ,
        // String value '' : ()=> LoginScreen() ,
        //}
      // routes :{  
        //  String value '' : (context)return LoginScreen() widget
       //   }
       
      routes: {
        LoginScreen.id: (context) =>  const LoginScreen(),     //  String value '' : return LoginScreen() widget
        RegisterScreen.id: (context) =>  const RegisterScreen(),    //  String value '' : return LoginScreen() widget
        ChatScreen.id: (context)=>const ChatScreen(), 
      },
        // home :LoginScreen()
      initialRoute: LoginScreen.id , 
        //  LoginScreen.id  == ' LoginScreen'
       // Use the name of the route as a String
     
     
       );











  }
}
