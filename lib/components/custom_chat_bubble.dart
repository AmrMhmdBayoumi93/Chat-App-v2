import 'package:chatapp/constants.dart';
import 'package:chatapp/models/message_model.dart';
import 'package:flutter/material.dart';

class CustomChatBubble extends StatelessWidget {

   final MessageModel messageModel;

   CustomChatBubble({
     required this.messageModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Align(
 
      alignment: Alignment.centerLeft,

      child: Container( 
        
        margin:const EdgeInsets.symmetric(horizontal: 16,vertical: 16), 
         // space out of Container
         
        padding: const EdgeInsets.only(left:16,top: 16,bottom: 16,right: 32), 
         // space in Container around Text()

      
      
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
                
      
      
      
       child:  Text(messageModel.message,

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