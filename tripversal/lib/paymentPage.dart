import 'package:flutter/material.dart';
import 'package:tripversal/main.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key key, this.passUsername, this.passIdUser, this.passTotal}) : super(key: key);

  final String passUsername;
  final int passIdUser;
  final int passTotal;

  @override

  _PaymentPage createState() => _PaymentPage();
}

class _PaymentPage extends State<PaymentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: 
          const IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: const Text("Payment", 
        style: TextStyle(
          color: Color(0xFF4169E1),
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
      
      actions: [
        IconButton(
          icon: const Icon(Icons.home, color: Color(0xFF4169E1)),
          iconSize: 40,
          onPressed: () {    
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => const NavBar()
              ),
            );
          },
        )
      ],
      //Transparent setting.
      backgroundColor: const Color(0x44FFFFFF),
      elevation: 0,
    ),

      body: Center(
        child: Align(
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
                                    child: Text(
                                      paymentMethod, 
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
                                  child: Text(
                                    "Rp. ${widget.passTotal.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}", 
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.black
                                    ),
                                  ),
                                ),   
                                const SizedBox(
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
                            const SizedBox(
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
        )
      ),
    );
  }
}