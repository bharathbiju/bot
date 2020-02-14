
import 'package:flutter/material.dart';
import 'package:bot/widgets/call_number.dart';
import 'package:bot/widgets/map.dart';


class DialPad extends StatefulWidget {
  @override
  _DialPad createState() => _DialPad();
}

class _DialPad extends State<DialPad> {

  final TextEditingController _controller = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  _initCall() async {
    if(_controller.text != null)
      await CallNumber().callNumber("0422 265 4332");
  }
  

  @override
  Widget build(BuildContext context) {

     Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Emergency'),
        ),
        
      body:Center(
        child: new Center(
                    child: new Column(
                     children : [
                       new Padding(padding: EdgeInsets.only(top: 140.0)),
                       new Text('RL Hospital, Kovilpalayam, Sathy Rd, Coimbatore, Tamil Nadu 641107',
                       style: new TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),),
                       new Padding(padding: EdgeInsets.only(top: 50.0)),
                       new Text("0422 265 4332"),
                  IconButton(onPressed: _initCall, icon: Icon(Icons.call)),  
                  IconButton(onPressed:  () {
                 Navigator.push(context, 
        MaterialPageRoute(
          builder: (context)=> Map()
        )
        );
                
              },
               icon: Icon(Icons.map)),    
                     ]
                    ) 
      ) ,
      ),
      
        // body:new Center(
        //   child:new Column(
        //   children: 
        //     <Widget>[
        //       TextField(
        //         controller: _controller,
        //         keyboardType: TextInputType.phone,
        //         decoration: InputDecoration(
        //           hintText: '8122340558',
        //         ),
        //       ),
        //       IconButton(onPressed: _initCall, icon: Icon(Icons.call)),
        //     ]
        // ),

        // )
      ),
    );
  }
}
