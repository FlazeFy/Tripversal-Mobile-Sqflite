import 'package:flutter/material.dart';

//Collapse Resv
class ExpansionResv extends StatelessWidget {
  const ExpansionResv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Flexible(            
          child : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                
                ExpansionTile( //Collapse-1 ===========================================
                  leading: IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.payment,
                    color: Color(0xFF808080)),
                    onPressed: () {},
                  ),
                  title: const Text(
                    "Waiting for Payment",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  children: <Widget>[                     
                    SingleChildScrollView(               
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: <Widget>[
                            
                          Card( //item-1 -----------------------------------------
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.circular(10),             
                                color: const Color(0xFF4169E1),
                              ),
                              child: Row(
                                children: [  
                                  Expanded(
                                    child:Container(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                            child: RichText(
                                              text: const TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: " Toyota Innova / 2015",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 18
                                                    )
                                                  ),
                                                ],
                                              ),
                                            )
                                          ),
                                          Container(
                                            alignment: Alignment.bottomLeft,
                                            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  alignment: Alignment.bottomLeft,
                                               
                                                  child: RichText(
                                                    text: const TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: "Rp.",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                          )
                                                        ),
                                                        TextSpan(
                                                          text: " 400.000",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 25,
                                                            fontWeight: FontWeight.bold
                                                          )
                                                        ),
                                                        TextSpan(
                                                          text: " / Day",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                          )
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex:8 ,
                                  ),
                                  Container(
                                    //Timer with minute and second.
                                  ),
                                  SizedBox(
                                    height: 100,
                                    width: 60,
                                    child: ButtonTheme(
                                      minWidth: 30,
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                            // Respond to button press
                                        },
                                        icon: const Icon(Icons.cancel, size: 25),
                                        label: const Text(""),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFE14141)),
                                        ),
                                      )
                                    ),
                                  )
                                ],
                              ),
                            ),
                            elevation: 8,
                            margin: const EdgeInsets.all(10),
                          ),

                        ]
                      )
                    )   
                    
                  ],
                ),

                ExpansionTile( //Collapse-2 ===========================================
                  leading: IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.punch_clock,
                    color: Color(0xFF808080)),
                    onPressed: () {},
                  ),
                  title: const Text(
                    "OnGoing",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  children: <Widget>[
                    SingleChildScrollView(               
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: <Widget>[
                            
                          Card( //item-1 -----------------------------------------
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFF4169E1), width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.circular(10),             
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [  
                                  Expanded(
                                    child:Container(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                                            child: RichText(
                                              text: const TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: " Toyota Rush / 2018",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 18
                                                    )
                                                  ),
                                                ],
                                              ),
                                            )
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                            child: RichText(
                                              text: const TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: " D 1914 VBZ",
                                                    style: TextStyle(
                                                      color: Color(0xFF808080),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16
                                                    )
                                                  ),
                                                ],
                                              ),
                                            )
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                            child: RichText(
                                              text: const TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: " 2/3/22 10:00",
                                                    style: TextStyle(
                                                      color: Color(0xFF808080),
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.italic,
                                                      fontSize: 16
                                                    )
                                                  ),
                                                ],
                                              ),
                                            )
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex:8 ,
                                  ),
                                  Container(
                                    height: 60,
                                    width: 80,
                                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: RaisedButton(
                                      color: const Color(0xFF4169E1),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(1.0),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(0),
                                            child: Text(
                                              "Extend",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                      },
                                    )
                                  ),
                                  Container(
                                    height: 60,
                                    width: 80,
                                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: RaisedButton(
                                      color: const Color(0xFF13B402),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(1.0),
                                            child: Icon(
                                              Icons.message,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(0),
                                            child: Text(
                                              "Contact",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                      },
                                    )
                                  ),
                                ],
                              ),
                            ),
                            elevation: 8,
                            margin: const EdgeInsets.all(10),
                          ),

                        ]
                      )
                    )  
                  ],
                ),

                ExpansionTile( //Collapse-3 ===========================================
                  leading: IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.history,
                    color: Color(0xFF808080)),
                    onPressed: () {},
                  ),
                  title: const Text(
                    "History",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  children: <Widget>[                     
                    SingleChildScrollView(               
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: <Widget>[
                            
                          Card( //item-1 -----------------------------------------
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.circular(10),             
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [  
                                  Expanded(
                                    child:Container(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                                            child: RichText(
                                              text: const TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: " Honda Brio RS",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 18
                                                    )
                                                  ),
                                                ],
                                              ),
                                            )
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                            child: RichText(
                                              text: const TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: " Bojongsoang, Bandung",
                                                    style: TextStyle(
                                                      color: Color(0xFF808080),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16
                                                    )
                                                  ),
                                                ],
                                              ),
                                            )
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                            child: RichText(
                                              text: const TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: " 16/2/22",
                                                    style: TextStyle(
                                                      color: Color(0xFF808080),
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.italic,
                                                      fontSize: 16
                                                    )
                                                  ),
                                                ],
                                              ),
                                            )
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex:8 ,
                                  ),
                                  Container(
                                    height: 60,
                                    width: 80,
                                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: OutlineButton(
                                      onPressed: () {
                                          // Respond to button press
                                      },
                                      borderSide: const BorderSide(
                                        color: Color(0xFF4169E1),
                                        width: 2,
                                      ),
                                      child: const Text("Review", 
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF4169E1),
                                        ),
                                      ), 
                                    )
                                  ),
                                  Container(
                                    height: 60,
                                    width: 80,
                                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                          // Respond to button press
                                      },
                                      child: const Text("Book Again", 
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF4169E1)),
                                      ), 
                                    ),
                                  )
                                ],
                              ),
                            ),
                            elevation: 8,
                            margin: const EdgeInsets.all(10),
                          ),

                        ]
                      )
                    )   
                    
                  ],
                ),

              ],
            ),
          )
        )
      )
    );
  }
}
