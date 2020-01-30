import 'package:bot/home.dart';
import 'package:flutter/material.dart';
import 'fact_message.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow.dart';

class FlutterFactsDialogFlow extends StatefulWidget {
  FlutterFactsDialogFlow({Key key, this.title}) : super(key: key);
  

  final String title;

  static BuildContext get context => null;

  @override
  _FlutterFactsDialogFlowState createState() => new _FlutterFactsDialogFlowState();
}

class _FlutterFactsDialogFlowState extends State<FlutterFactsDialogFlow>  {
  
  final List<FactsMessage> _messages = <FactsMessage>[];
  final TextEditingController _textController = new TextEditingController();

  Widget _queryInputWidget(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _submitQuery,
                decoration: InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _submitQuery(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void _dialogFlowResponse(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
    await AuthGoogle(fileJson: "assets/acoustic-apex-265610-6efc39ee055f.json").build();
    Dialogflow dialogFlow =
    Dialogflow(authGoogle: authGoogle);
    AIResponse response = await dialogFlow.detectIntentFromText(query);
    FactsMessage message = FactsMessage(
      text: response.getMessage() ??
           CardDialogflow(response.getListMessage()[0]).title,
      name: "DAS",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _submitQuery(String text) {
    _textController.clear();
    FactsMessage message = new FactsMessage(
      text: text,
      name: widget.title,
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    _dialogFlowResponse(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true, //To keep the latest messages at the bottom
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            )),
        Divider(height: 1.0),
        Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _queryInputWidget(context),
        ),
      ]),
    );
  }
}