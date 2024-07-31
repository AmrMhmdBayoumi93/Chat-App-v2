
import 'package:chatapp/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({super.key});


    static String id ='ChatScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading:false,
        
        title: 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children:
          [
              Image.asset(KImageLogoPath,
            height: 40,
          ),
        const Text("  Scholar Chat", 
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
         ],
        
        
         ),
        
       
        ),

      
      body:
       
      const Center(
        child:  const Text("  Scholar Chat", 
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      
      ),
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
    );


   
  }
}