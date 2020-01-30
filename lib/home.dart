import 'package:bot/router.dart';
import 'package:bot/widgets/dialog_flow.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Center(
        child:Container(
        child:Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ), 
      ) , 
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, 
        MaterialPageRoute(
          builder: (context)=>FlutterFactsDialogFlow(title: myController.text,)
        )
        ),
        
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
