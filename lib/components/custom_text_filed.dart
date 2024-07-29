import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
    
    String? hintText;
    void Function (String value)? onChanged;


   CustomTextFiled({this.hintText,this.onChanged });
  
  @override
  Widget build(BuildContext context) {
    return TextField(  
      onChanged: onChanged,

                  cursorColor:  Colors.white,
                  style: const TextStyle(
                      color: Colors.white,
                    fontSize: 35,
                  ),

                  


                  
                  decoration: InputDecoration(


                    hintText: hintText,
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),




                    border: const OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),


                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),

                  ),


                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),



                  errorBorder: const OutlineInputBorder(
                    borderSide:BorderSide(color: Colors.red, width: 2.0),
                  ),

                  
                ),
                );
           
  }
}