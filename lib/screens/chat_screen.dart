
import 'package:chatapp/components/custom_chat_bubble.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
   
  
 FirebaseFirestore firestore = FirebaseFirestore.instance;
 
   CollectionReference messages = 
   FirebaseFirestore.instance.collection(kMessagesCollections);
                                //kMessagesCollections = 'messages'

   final TextEditingController messageController = TextEditingController();
final ScrollController scrollController = ScrollController();

    ChatScreen({super.key});
  
     static String id ='ChatScreen';


  @override
  Widget build(BuildContext context) {

    var email =ModalRoute.of(context)!.settings.arguments ;
    // String email =ModalRoute.of(context)!.settings.arguments as String;
      // recieve email from LoginScreen to make id for any message 


    return  StreamBuilder<QuerySnapshot>(
      
       stream: messages.orderBy('createdAt',descending: true).snapshots(), 
  //messages.snapshots(), //get request all docs that  in a collection named 'messages' for real time
              // one and more
  // messages.get()  // get request all docs that  in a collection named 'messages' for one time
        
        builder: (context, snapshot) {
          
           if (snapshot.hasData) {
            

            print(' YES , snapshot has data');
            // print(snapshot.data!.docs[1]['message']);

              List <MessageModel> messagesList = [];
              for(int i =0;i<snapshot.data!.docs.length;i++){
                messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
              }  
 







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
                     
                      reverse: true,



                      controller: scrollController,

                          itemCount: messagesList.length,
                         itemBuilder: (context, index) {
               
                         return messagesList[index].id==email?  CustomChatBubbleForMe(
                         messageModel:messagesList[index],
                            ) :CustomChatBubbleForFriend(
                              messageModel: messagesList[index],);
                
                         }
               ),
             ),
      





      //   TextField()
      
      
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextField(
                style: TextStyle(
                 fontSize: 25,
                ),
                controller:  messageController,
                
                onSubmitted: (data){
                  messages.add({
                   kMessage: data,
                    kCreatedAt:DateTime.now(),
                    'id':email,
                     
                           });
                          
                           messageController.clear();  // delete the message from TF
               
               
                   //  scrollController.position.minScrollExtent,
                   
                          scrollController.animateTo(    // go to last message
                           scrollController.position.minScrollExtent, 
                           duration: Duration(seconds: 1),
                              curve: Curves.easeIn,
                 );
               
                       //   scrollController.jumpTo()
               
                },
                     
                     
                     
                
                
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
             ),
      
          ] 
          
          ),
      
        
      ); 
      }
          
    
  else {

    return const Text('Loading...');
    
  }
    
    
        }

    );
  
  }


  
  }

