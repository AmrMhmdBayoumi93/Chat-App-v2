import 'package:chatapp/constants.dart';
import 'package:flutter/material.dart';

class CustomChatBubble extends StatelessWidget {
  const CustomChatBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Align(

      alignment: Alignment.centerLeft,

      child: Container( 
        
        margin:const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        padding: const EdgeInsets.only(left:16,top: 32,bottom: 32,right: 32),
      
      
        // alignment: Alignment.centerLeft,  
      
        // width: 150,
        // height: 65,
      



      decoration: const BoxDecoration(
        
        color:kPrimaryColor,
          borderRadius: BorderRadius.only
          (
          
          topLeft : Radius.circular(32),
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
      
         
         )
                      
      
      ),
                
      
      
      
       child: const Text('i am a new user ',
       style: TextStyle(
       
         color: Colors.white,
         fontSize: 20,
         fontWeight: FontWeight.bold,
         fontFamily: 'Poppins',
       
       
       ),), 
      
      
      
      ),
    );
  }
}