import 'package:bot/router.dart';
import 'package:bot/widgets/dialog_flow.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }
   
    return Scaffold(
      
      body:Center(
        child: new Center(
                    child: new Column(
                     children : [
                       new Padding(padding: EdgeInsets.only(top: 140.0)),
                       new Text('Chat Bot for Medical Assitance',
                       style: new TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),),
                       new Padding(padding: EdgeInsets.only(top: 50.0)),
                       new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Your Name",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                       controller: myController,
                      validator: (val) {
                        if(val.length==0) {
                          return "Name cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                     ]
                    )
      //   child:Container(
      //   child:Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: TextField(
      //     controller: myController,
      //   ),
      // ), 
      // ) , 
      ) ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (myController.text.length == 0) {
            return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('please enter you name'),
            ],
          ),
        ),
      );
    },
  );
            
          } 
          else { Navigator.push(context, 
        MaterialPageRoute(
          builder: (context)=>FlutterFactsDialogFlow(title: myController.text,)
        )
        );
          }
         
        },
        
        child: Icon(Icons.child_care ),
      ),
    );
  }
}
