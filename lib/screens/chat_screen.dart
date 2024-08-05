
import 'package:chatapp/components/custom_chat_bubble.dart';
import 'package:chatapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatelessWidget {
   const ChatScreen({super.key});


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


      // chat bubble    


                                // marign and padding in Container()
      
      body:
      Column(
        children: [
          

          // ListView in a Column must be wrap with Expanded() 

           Expanded(
             child: ListView.builder(
             
                       itemBuilder: (context, index) {
             
              return   CustomChatBubble();
              
                       }
             ),
           ),





           TextField(



            
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.send,
              color: kPrimaryColor,
              ),
              hintText: 'Send a message',
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                    width: 2.0,
                                    ),
                                      borderRadius:BorderRadius.all(Radius.circular(30)),



              ),
              enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                    width: 2.0,
                                    ),
                                      borderRadius:BorderRadius.all(Radius.circular(30)),



              ),



            ),

          ),

  









          
        
      ]), 

      

                 




































        
        // Padding(                                       // padding Widget // space out of Container
        //   padding: const EdgeInsets.all(8.0),
        //   child: Container(
        //     width: 300,
        //     height: 90, 
            
        //     margin: const EdgeInsets.only(left: 30, right: 10, top: 30),  // space out of Container
          
        //     padding: const EdgeInsets.only(top: 25,left: 33),  // // space in the  Container around the child
            
        //     decoration: BoxDecoration(
        //       color: Colors.yellow,
        //       borderRadius: BorderRadius.circular(10),
        //     ),
            
        //     child: const Text("  How are You", 
                 
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 20,
        //         fontWeight: FontWeight.bold,
        //         fontFamily: 'Poppins',
        //       ),
                
                  
        //           ),
        //   ),
        // ),
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
     

    );
  
  }


  
  }

