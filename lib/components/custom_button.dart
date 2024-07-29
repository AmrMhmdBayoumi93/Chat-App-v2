import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  String buttonName;

  // VoidCallback? onTap;        VoidCallback? == void Function()? 
    void Function()? onTap;
   CustomButton({required this.buttonName ,required this.onTap});
 
        
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      
                    //color:Colors.white,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                        height: 50, 
      
              child: Center(
                  child: Text(buttonName,
      
                
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight:  FontWeight.bold,
                    color: Colors.black,
                  )
              )),
                  ),
    );



  }


}