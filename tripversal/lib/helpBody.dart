import 'package:flutter/material.dart';

class help extends StatelessWidget {
  const help({Key? key}) : super(key: key);

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
                    icon: const Icon(Icons.car_rental,
                    color: Color(0xFF808080)),
                    onPressed: () {},
                  ),
                  title: const Text(
                    "How to rent a car",
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
                    icon: const Icon(Icons.person,
                    color: Color(0xFF808080)),
                    onPressed: () {},
                  ),
                  title: const Text(
                    "How to book a tour guide",
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
                    icon: const Icon(Icons.cancel,
                    color: Color(0xFF808080)),
                    onPressed: () {},
                  ),
                  title: const Text(
                    "How to cancel the order",
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
                
                ExpansionTile( //Collapse-4 ===========================================
                  leading: IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.password,
                    color: Color(0xFF808080)),
                    onPressed: () {},
                  ),
                  title: const Text(
                    "How to change password",
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

                ExpansionTile( //Collapse-4 ===========================================
                  leading: IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.timelapse,
                    color: Color(0xFF808080)),
                    onPressed: () {},
                  ),
                  title: const Text(
                    "How to extend the order",
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
          )
        )
      )
    );
  }
}
