import 'package:flutter/material.dart';

import 'main.dart';

//Collapse Resv
class bookCar extends StatelessWidget {
  const bookCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        transform: Matrix4.translationValues(0.0, 0.0, 0.0),
        child: Column(
          children: [
            //Text.
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), 
                child: Image.asset('assets/images/citycar1.jpg'),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80), 
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3)
                  )
                ],
              ),
            ),
            Container( 
              child: Row (
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: RichText(
                      text: TextSpan(
                        children: const [
                          WidgetSpan(
                            child: Icon(Icons.car_rental, 
                              size: 24,
                              color: Color(0xFF4169E1),
                            ),
                          ),
                          TextSpan(
                            text: "Honda Brio RS / 2020",
                            style: TextStyle(
                              color: Color(0xFF4169E1),
                              fontWeight: FontWeight.w700,
                              fontSize: 18
                            )
                          ),                              
                        ],
                      ),
                    )
                  ),
                  Container(
                    transform: Matrix4.translationValues(100.0, 0.0, 0.0),
                    child: RichText(
                      text: TextSpan(
                        children: const [
                          WidgetSpan(
                            child: Icon(Icons.star, 
                              size: 20,
                              color: Color(0xFF4169E1),
                            ),
                          ),
                          TextSpan(
                            text: "4,6",
                            style: TextStyle(
                              color: Color(0xFF4169E1),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            )
                          ),                              
                        ],
                      ),
                    )
                  )
                ]
              ),  
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Row (
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: RichText(
                      text: TextSpan(
                        children: const [
                          WidgetSpan(
                            child: Icon(Icons.person, 
                              size: 20,
                              color: Color(0xFF808080),
                            ),
                          ),
                          TextSpan(
                            text: "5 seats",
                            style: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 16
                            )
                          ),                              
                        ],
                      ),
                    )
                  ),
                  Container(
                    transform: Matrix4.translationValues(20.0, 0.0, 0.0),
                    child: RichText(
                      text: TextSpan(
                        children: const [
                          WidgetSpan(
                            child: Icon(Icons.speed, 
                              size: 20,
                              color: Color(0xFF808080),
                            ),
                          ),
                          TextSpan(
                            text: "26.000 km",
                            style: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 16
                            )
                          ),                              
                        ],
                      ),
                    )
                  ),
                  Container(
                    transform: Matrix4.translationValues(40.0, 0.0, 0.0),
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: RichText(
                      text: TextSpan(
                        children: const [
                          WidgetSpan(
                            child: ImageIcon(
                              AssetImage("assets/images/fuel.png"),
                              color: Color(0xFF808080),
                              size: 18,
                            ),
                          ),
                          TextSpan(
                            text: "35 L (gasoline)",
                            style: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 16
                            )
                          ),                              
                        ],
                      ),
                    )
                  )
                ]
              ),  
            ),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 15,
              endIndent: 15,
              color: Color.fromARGB(255, 185, 185, 185),
            ),
            Container(
              height: MediaQuery.of(context).size.height* 0.32,
              child: Flexible(            
                child : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "Description", 
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: Color(0xFF808080)
                            ),
                          ),
                        )
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", 
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 145, 145, 145)
                            ),
                          ),
                        )
                      ),
                      Align(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [ 
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                  child: Text(
                                    "Driver", 
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                      color: Color(0xFF808080)
                                    ),
                                  ),
                                )
                              ), 
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'assets/images/driver1.jpg', width: 40),
                                  ),
                              ),
                              Expanded(                 
                                child: Row (
                                  children: [
                                    Container(
                                      child: RichText(
                                        text: TextSpan(                     
                                          text: "Ben Parker",
                                          style: TextStyle(
                                            color: Color(0xFF4169E1),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                          )
                                        ),                              
                                      ),
                                    )
                                  ]
                                )
                              )
                            ]
                          )    
                        )                   
                      ),
                      Container(
                        child: Column(
                        children: <Widget>[
                          
                          ExpansionTile( //Collapse-1 ===========================================
                            leading: IconButton(
                              iconSize: 30,
                              icon: const Icon(Icons.reviews,
                              color: Color(0xFF808080)),
                              onPressed: () {},
                            ),
                            title: const Text(
                              "Review",
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
                                                      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                                      child: RichText(
                                                        text: const TextSpan(
                                                          children: [
                                                          WidgetSpan(
                                                            child: Icon(Icons.star, 
                                                              size: 20,
                                                              color: Color(0xFF4169E1),
                                                            ),
                                                          ),
                                                          WidgetSpan(
                                                            child: Icon(Icons.star, 
                                                              size: 20,
                                                              color: Color(0xFF4169E1),
                                                            ),
                                                          ),
                                                          WidgetSpan(
                                                            child: Icon(Icons.star, 
                                                              size: 20,
                                                              color: Color(0xFF4169E1),
                                                            ),
                                                          ),
                                                          WidgetSpan(
                                                            child: Icon(Icons.star, 
                                                              size: 20,
                                                              color: Color(0xFF4169E1),
                                                            ),
                                                          ),
                                                          WidgetSpan(
                                                            child: Icon(Icons.star, 
                                                              size: 20,
                                                              color: Color(0xFF4169E1),
                                                            ),
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
                                                              text: "This car is well maintained by the owner, have a clean interior, and experienced driver",
                                                              style: TextStyle(
                                                                color: Color.fromARGB(255, 77, 77, 77),
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
                                                              text: "~Richard Kyle on 19/1/22",
                                                              style: TextStyle(
                                                                color: Color(0xFF808080),
                                                                fontWeight: FontWeight.w500,
                                                                fontStyle: FontStyle.italic,
                                                                fontSize: 13
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
                          ]
                        )
                      )
                    ]
                  )
                )
              )
            ),
            Container(
              width: MediaQuery.of(context).size.width,
            child: Row (
              children: [
                Container(
                  // flex: 5, //if expanded
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        // flex: 5, //if expanded
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: RichText(
                          text: TextSpan(
                            children: const [
                              TextSpan(
                                text: "Rp.",
                                style: TextStyle(
                                  color: Color(0xFF808080),
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                )
                              ),
                              TextSpan(
                                text: " 290.000",
                                style: TextStyle(
                                  color: Color(0xFF4169E1),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                )
                              ),
                              TextSpan(
                                text: " / Day",
                                style: TextStyle(
                                  color: Color(0xFF808080),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                )
                              ),
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(50.0, 0.0, 0.0),
                  alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {
                        // Respond to button press
                      },
                      icon: Image.asset("assets/images/wishlist.png"),
                      color: Color(0xFF00B0FF),
                     
                       //Wishlist icon external
                      padding: EdgeInsets.all(0.0)
                    )
                ),
              
                Container(
                  height: 40,
                  transform: Matrix4.translationValues(70.0, 0.0, 0.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Respond to button press
                    },
                    child: Text("Order Now"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1F9F2F)),
                    ),
                  )
                )
            
                
              ]
            )
            )

          ]
        )
      ),
    );
  }
}
