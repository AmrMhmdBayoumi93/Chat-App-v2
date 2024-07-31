
 import 'package:flutter/material.dart';



void showSnackBar(BuildContext context ,String message) {
    ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                 content: Text('there was an error try again later...')),);
  
  }