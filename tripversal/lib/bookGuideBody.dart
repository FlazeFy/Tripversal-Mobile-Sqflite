import 'package:flutter/material.dart';

//Collapse Resv
class bookGuide extends StatelessWidget {
  const bookGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        transform: Matrix4.translationValues(0.0, 0.0, 0.0),
        child: Column(
          children: [
            //Text.
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), 
                child: Image.asset('assets/images/driver1.jpg'),
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
            Row (
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.car_rental, 
                            size: 24,
                            color: Color(0xFF4169E1),
                          ),
                        ),
                        TextSpan(
                          text: "Ben Parker",
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
                    text: const TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.star, 
                            size: 20,
                            color: Color(0xFF4169E1),
                          ),
                        ),
                        TextSpan(
                          text: "4,9",
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
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row (
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.message, 
                              size: 20,
                              color: Color(0xFF808080),
                            ),
                          ),
                          TextSpan(
                            text: "ID, EN, ES, FR",
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
                      text: const TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.person, 
                              size: 20,
                              color: Color(0xFF808080),
                            ),
                          ),
                          TextSpan(
                            text: "40 Customer in 10 month",
                            style: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 16
                            )
                          ),                              
                        ],
                      ),
                    )
                  ),
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
            SizedBox(
              height: MediaQuery.of(context).size.height* 0.41,
              child: Flexible(            
                child : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Text(
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
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", 
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 145, 145, 145)
                            ),
                          ),
                        )
                      ),
                      Column(
                        children: <Widget>[
                    
                          ExpansionTile( //Collapse-Contact ===========================================
                            leading: IconButton(
                              iconSize: 30,
                              icon: const Icon(Icons.contact_mail,
                              color: Color(0xFF808080)),
                              onPressed: () {},
                            ),
                            title: const Text(
                              "Contact",
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
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: RichText(
                                          text: const TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Icon(Icons.call, 
                                                  size: 20,
                                                  color: Color(0xFF808080),
                                                ),
                                              ),
                                              TextSpan(
                                                text: "+62 811-4882-001",
                                                style: TextStyle(
                                                  color: Color(0xFF808080),
                                                  fontSize: 15
                                                )
                                              ),                              
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: RichText(
                                          text: const TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Icon(Icons.location_on, 
                                                  size: 20,
                                                  color: Color(0xFF808080),
                                                ),
                                              ),
                                              TextSpan(
                                                text: "Jl. Telekomunikasi No.1",
                                                style: TextStyle(
                                                  color: Color(0xFF808080),
                                                  fontSize: 15
                                                )
                                              ),                              
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: RichText(
                                          text: const TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Icon(Icons.email, 
                                                  size: 20,
                                                  color: Color(0xFF808080),
                                                ),
                                              ),
                                              TextSpan(
                                                text: " parkerben02@gmail.com",
                                                style: TextStyle(
                                                  color: Color(0xFF808080),
                                                  fontSize: 15
                                                )
                                              ),                              
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(margin: const EdgeInsets.symmetric(vertical: 10.0))

                                  ]
                                )
                              )   
                              
                            ],
                          ),

                          ExpansionTile( //Collapse-review ===========================================
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
                                      child:Flexible(
                                        
                                        
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
                                                              text: "The translator is very kind and friendly. He is also very familiar with tourist sites in Bandung.",
                                                              style: TextStyle(
                                                                color: Color.fromARGB(255, 77, 77, 77),
                                                                fontSize: 16
                                                              )
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ),
                                                    Container(
                                                      alignment: Alignment.topLeft,
                                                      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
                    ]
                  )
                )
              )
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
            child: Row (
              children: [
                Container(
                  // flex: 5, //if expanded
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        // flex: 5, //if expanded
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Rp.",
                                style: TextStyle(
                                  color: Color(0xFF808080),
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                )
                              ),
                              TextSpan(
                                text: " 450.000",
                                style: TextStyle(
                                  color: Color(0xFF4169E1),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                )
                              ),
                              TextSpan(
                                text: " / 12 hr",
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
                      color: const Color(0xFF00B0FF),
                     
                       //Wishlist icon external
                      padding: const EdgeInsets.all(0.0)
                    )
                ),
              
                Container(
                  height: 40,
                  transform: Matrix4.translationValues(70.0, 0.0, 0.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Respond to button press
                    },
                    child: const Text("Order Now"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF1F9F2F)),
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
