import 'package:flutter/material.dart';

class payment extends StatelessWidget {
  const payment({Key? key}) : super(key: key);

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
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Color(0xFF4169E1), width: 2),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                            child: const Text(
                              "Payment Detail", 
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 10.0),
                                child: const Text(
                                  "Transfer Mandiri", 
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black
                                  ),
                                ),
                              ),
                            ),  
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5.0),
                                child: const Text(
                                  "1300174190012", 
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.black
                                  ),
                                ),
                              ),
                            ),    
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                child: const Text(
                                  "Rp. 800.000", 
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.black
                                  ),
                                ),
                              ),
                            ),   
                            SizedBox(
                              height: 10,
                            )                         
                          ]

                        ),
                      ]
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color(0xFF4169E1),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            child: const Text(
                              "Selesaikan sebelum : ", 
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),  
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            //Countdown timer
                          ),
                        ),    
                        SizedBox(
                          height: 10,
                        )                         
                      ]

                      
                    ),
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 4,
                  indent: 0,
                  endIndent: 15,
                  color: Color.fromARGB(255, 185, 185, 185),
                ),
                Column(
                  children: <Widget>[
                    ExpansionTile( //Collapse-1 ===========================================
                      leading: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.cancel,
                        color: Color(0xFF808080)),
                        onPressed: () {},
                      ),
                      title: const Text(
                        "Can I canceled the order?",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      children: <Widget>[                     
                        SingleChildScrollView(               
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: const <Widget>[
                                
                            
                            ]
                          )
                        )   
                        
                      ],
                    ),

                    ExpansionTile( //Collapse-2 ===========================================
                      leading: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.timer,
                        color: Color(0xFF808080)),
                        onPressed: () {},
                      ),
                      title: const Text(
                        "What happen when the payment timer is run out?",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      children: <Widget>[
                        SingleChildScrollView(               
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: const <Widget>[
                                
                              
                            ]
                          )
                        )  
                      ],
                    ),

                    ExpansionTile( //Collapse-3 ===========================================
                      leading: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.payment,
                        color: Color(0xFF808080)),
                        onPressed: () {},
                      ),
                      title: const Text(
                        "Can I change the payment method?",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      children: <Widget>[                     
                        SingleChildScrollView(               
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: const <Widget>[
                                
                              
                            ]
                          )
                        )   
                        
                      ],
                    ),

                    ExpansionTile( //Collapse-3 ===========================================
                      leading: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.error,
                        color: Color(0xFF808080)),
                        onPressed: () {},
                      ),
                      title: const Text(
                        "What should I do when I send the wrong payment?",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      children: <Widget>[                     
                        SingleChildScrollView(               
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: const <Widget>[
                                
                              
                            ]
                          )
                        )   
                        
                      ],
                    ),

                    ExpansionTile( //Collapse-3 ===========================================
                      leading: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.qr_code,
                        color: Color(0xFF808080)),
                        onPressed: () {},
                      ),
                      title: const Text(
                        "When can I get the order barcode?",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      children: <Widget>[                     
                        SingleChildScrollView(               
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: const <Widget>[
                                
                              
                            ]
                          )
                        )   
                        
                      ],
                    ),

                  ],
                ),
              ]
                
                
            ),
          )
        )
      )
    );
  }
}
