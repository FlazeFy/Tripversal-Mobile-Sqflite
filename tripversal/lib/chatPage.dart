import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tripversal/main.dart';
import 'package:intl/intl.dart';
import 'package:tripversal/models/messageModel.dart';
import 'package:tripversal/services/carServices.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({key, this.passGarageGuide, this.passUsername}) : super(key: key);
  final String passGarageGuide;
  final String passUsername;

  @override
  _ChatPage createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> with TickerProviderStateMixin{
  //MVC.
  final _message = messageModel();
  final _carServices = carServices();
  final _messageTextCtrl = TextEditingController();
  List<messageModel> _messageList = <messageModel>[];
  var type = "";

  //Back to top controller and initial.
  bool _showBackToTopButton = false;
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 150) {
            _showBackToTopButton = true; 
          } else {
            _showBackToTopButton = false;
          }
        });
      });
    super.initState();
    getAllMessage();
  }

  @override
  void dispose() {
    _scrollController.dispose(); 
    super.dispose();
  }

  //Back to top funtion.
  void _scrollToTop() {
    _scrollController.animateTo(0,
      duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  //Get all message for car & guide
  getAllMessage() async {
    _messageList = <messageModel>[];
    var messages = await _carServices.readMessage();

    messages.forEach((message){
      if(((message['sender'] == widget.passUsername)&&(message['receiver'] == widget.passGarageGuide))||((message['sender'] == widget.passGarageGuide)&&(message['receiver'] == widget.passUsername))){
      setState((){
        var messageModels = messageModel();
        messageModels.idMessage = message['id_message'];
        messageModels.sender = message['sender'];
        messageModels.receiver = message['receiver'];
        messageModels.type = message['type'];
        type = message['type'];
        messageModels.body = message['body'];
        messageModels.imageURL = message['imageURL'];
        messageModels.datetime = DateTime.tryParse(message['datetime']);
        _messageList.add(messageModels);
      });
    }});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: 
          const IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
          title: Text(widget.passGarageGuide, 
          style: const TextStyle(
            color: Color(0xFF4169E1),
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.warehouse, color: Color(0xFF4169E1)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GaragePage(pass_garage: widget.passGarageGuide, pass_username: widget.passUsername)),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF4169E1)),
            iconSize: 40,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NavBar()),
              );
            },
          )
        ],
        backgroundColor: const Color(0x44FFFFFF),
        elevation: 0,
      ),

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                controller: _scrollController,
                itemCount : _messageList.length,
                itemBuilder: (context, index){
                  if(_messageList[index].sender == widget.passUsername){
                    return Column(
                      children:[
                        ChatBubble(
                          clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.only(top: 20),
                          backGroundColor: Colors.lightBlue,
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                            ),
                            child: GestureDetector(
                              onLongPress: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    content: Container(
                                      height: 145,
                                      transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children:[
                                          Container(
                                            transform: Matrix4.translationValues(20.0, 0.0, 0.0),
                                            child: IconButton(
                                              icon: const Icon(Icons.close, color: Color(0xFF4169E1)),
                                              onPressed: () => Navigator.pop(context, 'Cancel'),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width,
                                            child: OutlinedButton.icon(
                                              onPressed: () {
                                                Clipboard.setData(ClipboardData(text: _messageList[index].body,));
                                              },
                                              icon: const Icon(Icons.copy, size: 18),
                                              label: const Text("Copy Message"),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width,
                                            child: OutlinedButton.icon(
                                              onPressed: () async{
                                                var idMessage = _messageList[index].idMessage;
                                                var result = await _carServices.unSendMessage(idMessage);

                                                if(result != null){
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ChatPage(passGarageGuide: widget.passGarageGuide, passUsername: widget.passUsername)),
                                                  );
                                                }
                                              },
                                              icon: const Icon(Icons.delete, size: 18),
                                              label: const Text("Delete Message"),
                                            )
                                          )
                                        ]
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                _messageList[index].body,
                                style: const TextStyle(color: Colors.white),
                              ),
                            )
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical:2),
                            child: Text(DateFormat('yyyy-MM-dd kk:mm').format(_messageList[index].datetime).toString(),
                              style: const TextStyle(color: Colors.grey, fontSize:14))
                          )
                        )
                      ]
                    );
                  } else if (_messageList[index].receiver == widget.passUsername){
                    return Column(
                      children:[
                        ChatBubble(
                          clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 20),
                          backGroundColor: Colors.blueAccent,
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                            ),
                            child: GestureDetector(
                                onLongPress: () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      content: Container(
                                        height: 100,
                                        transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children:[
                                            Container(
                                              transform: Matrix4.translationValues(20.0, 0.0, 0.0),
                                              child: IconButton(
                                                icon: const Icon(Icons.close, color: Color(0xFF4169E1)),
                                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width,
                                              child: OutlinedButton.icon(
                                                onPressed: () {
                                                  Clipboard.setData(ClipboardData(text: _messageList[index].body,));
                                                },
                                                icon: const Icon(Icons.copy, size: 18),
                                                label: const Text("Copy Message"),
                                              ),
                                            ),
                                          ]
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  _messageList[index].body,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              )
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical:2),
                            child: Text(DateFormat('yyyy-MM-dd kk:mm').format(_messageList[index].datetime).toString(),
                              style: const TextStyle(color: Colors.grey, fontSize:14))
                          )
                        )
                      ]
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator()
                  );
                }
              )
            //End of item list.
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
                margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                height: 60,
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(Icons.add, color: Colors.white, size: 20, ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Expanded(
                      child: TextField(
                        controller: _messageTextCtrl,
                        decoration: const InputDecoration(
                          hintText: "Type your message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    FloatingActionButton(
                      heroTag: "send",
                      onPressed: () async{
                        var dt = DateTime.now();

                        var dtStr = dt.toIso8601String();
                        dt = DateTime.tryParse(dtStr);
                        _message.sender = widget.passUsername;
                        _message.receiver = widget.passGarageGuide;
                        _message.type = type;
                        _message.body = _messageTextCtrl.text;
                        _message.imageURL = 'null'; //for now
                        _message.datetime = dt;

                        var result = await _carServices.sendMessage(_message);
                        if(result != null){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChatPage(passGarageGuide: widget.passGarageGuide, passUsername: widget.passUsername)),
                          );
                        } 
                      },
                      child: const Icon(Icons.send,color: Colors.white,size: 18,),
                      backgroundColor: Colors.green,
                      elevation: 0,
                    ),
                    
                  ],
                  
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white, 
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                      offset: const Offset(
                        5.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
              ),
              
            ),
          ], 
      
        ),
      ),
      //Back to the top button.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: _showBackToTopButton == false
          ? null
          : Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: FloatingActionButton.extended(
          heroTag: "backtotop",
          onPressed: _scrollToTop,
          label: const Text('Back To Top', style: TextStyle(color: Colors.white)),
          icon: const Icon(Icons.arrow_circle_up),
          backgroundColor: const Color(0xFF555555).withOpacity(0.5),
          elevation: 0,
        ),
      )
    );
  }
}