// ignore_for_file: prefer_const_constructors
// Leonardho R Sitanggang - 1302194041 - SE-43-03
import 'package:flutter/material.dart';
import 'package:tripversal/bookGuideBody.dart';
import 'package:tripversal/helpBody.dart';
import 'package:tripversal/loginBody.dart';
import 'package:tripversal/widgets/sideNav.dart';
import 'package:tripversal/widgets/checkBox.dart';
import 'package:tripversal/myResvBody.dart';
import 'package:tripversal/bookCarBody.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}
void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Leonardho R Sitanggang-1302194041",
      home: LoginPage(), //Navbar
    );
  }
}
class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    RentACarPage(),
    TourGuidePage(),
    MyResPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.car_rental),
              label: 'Rent a Car',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Tour Guide',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'My Reservation',
            ),
          ],
          //Selected menu style.
          selectedLabelStyle: TextStyle(fontSize: 15),
          selectedItemColor: Color(0xFF4169E1),
          unselectedItemColor: Color(0xFF808080),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
    );
  }
}

class RentACarPage extends StatelessWidget {
  const RentACarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: 
          IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: Text("Welcome, Rose Monde", 
        style: TextStyle(
          color: Color(0xFF4169E1),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      
      actions: [
        IconButton(
          icon: Image.asset('assets/images/User.jpg'),
          iconSize: 50,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AccountPage()),
            );
          },
        )
      ],//error image blur so badly and not round yet

        //Transparent setting.
        backgroundColor: Color(0x44FFFFFF),
        elevation: 0,
      ),

      //Body.
      body: Center(
        child: Column(
          children: [
            //Text.
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                transform: Matrix4.translationValues(0.0, 5.0, 0.0),
                child: Text(
                  "Location", 
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: Color(0xFF808080)
                  ),
                ),
              ),
            ),
            
            //Text.
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  //Drop down.
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                    child: MyStatefulWidget(),
                  ),

                  //Text entry search.
                  Container(   
                    width: 200,
                    transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'search by driver, car...',
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                  ),

                  //Sort by button.
                  Container(
                    //Button properties.
                    decoration: BoxDecoration(
                      borderRadius : BorderRadius.circular(10),
                      color: Color(0xFF4169E1),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3)
                        )
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                    
                    child: PopupMenuButton( 
                      iconSize: 35,
                      icon: Icon(Icons.sort, color: Colors.white),
                      enabled: true,
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: ListTile(
                            leading: IconButton(
                              iconSize: 30,
                              icon: Icon(Icons.arrow_drop_up,
                              color: Color(0xFF4169E1)),
                              onPressed: () {},
                            ),
                            title: Text('Sort by Price'),
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: IconButton(
                              iconSize: 30,
                              icon: Icon(Icons.arrow_drop_down,
                              color: Color(0xFF4169E1)),
                              onPressed: () {},
                            ),
                            title: Text('Sort by Price'),
                          ),
                        )
                      ]
                    ),
                  ),

                ],
              ),
            ),

            //Text.
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                //transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                child: Text(
                  "Categories", 
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: Color(0xFF808080)
                  ),
                ),
              ),
            ),  

            Align(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    //Button item.
                    //Button / Container color must changed when selected.
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: OutlinedButton.icon(
                        onPressed: () {
                            //Respond
                        },
                        icon: Icon(Icons.motorcycle, size: 30),
                        label: Text("Motorcycle")
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: OutlinedButton.icon(
                        onPressed: () {
                            //Respond
                        },
                        icon: Icon(Icons.motorcycle, size: 30),
                        label: Text("City Car")
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: OutlinedButton.icon(
                        onPressed: () {
                            //Respond
                        },
                        icon: Icon(Icons.airport_shuttle, size: 30),
                        label: Text("Minibus")
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: OutlinedButton.icon(
                        onPressed: () {
                            //Respond
                        },
                        icon: Icon(Icons.motorcycle, size: 30),
                        label: Text("Bus")
                      ),
                    ),
                  ]
                )
              )
            ),

            //Car Item.
            Align(
              child: Text('Showing 4 result...',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                    color: Color(0xFF808080)
                  ),
                ),
            ),

            Flexible(
              child : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                      
                      Card( //item-1 -----------------------------------------
                        child:Container(
                          height: 140,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Center(
                                child:Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child:Image.asset("assets/images/citycar1.jpg", width: 150),
                                        flex:2 ,
                                      ),
                                    
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          transform: Matrix4.translationValues(0.0, 5.0, 0.0),
                                          
                                          //Left section.
                                          child: Row(
                                            children: [
                                              Text(
                                                "Driver", 
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14,
                                                  color: Color(0xFF4169E1)
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                                child: Text(
                                                  "none", 
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13,
                                                    color: Color(0xFF808080)
                                                  ),
                                                ),
                                              ),
                                            ],

                                          )
                                        ),
                                      ),

                                    ]
                                  ),
                                ),
                              ),
                              Expanded(
                                child:Container(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Container(
                                        // flex: 5, //if expanded
                                        margin: EdgeInsets.symmetric(vertical: 5.0),
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            children: const [
                                              WidgetSpan(
                                                child: Icon(Icons.car_rental,   
                                                  size: 20,
                                                  color: Color(0xFF4169E1),
                                                ),
                                              ),
                                              TextSpan(
                                                text: " Honda Brio RS / 2020",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                )
                                              ),
                                            ],
                                          ),
                                        )
                                      ),
                                      Container(
                                        // flex: 5, //if expanded
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            children: const [
                                              WidgetSpan(
                                                child: Icon(Icons.location_on, 
                                                  size: 20,
                                                  color: Color(0xFF4169E1),
                                                ),
                                              ),
                                              TextSpan(
                                                text: " Bojongsoang",
                                                style: TextStyle(
                                                  color: Color(0xFF808080),
                                                  fontWeight: FontWeight.w700,
                                                )
                                              ),
                                            ],
                                          ),
                                        )
                                      ),

                                      Container(
                                        // flex: 5, //if expanded
                                        margin: EdgeInsets.symmetric(vertical: 5.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              // flex: 5, //if expanded
                                              alignment: Alignment.topLeft,
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
                                                        color: Colors.black,
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

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            // flex: 5, //if expanded
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.symmetric(horizontal: 5.0),
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
                                                    text: " 4,8",
                                                    style: TextStyle(
                                                      color: Color(0xFF4169E1),
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w700,
                                                    )
                                                  ),
                                                ],
                                              ),
                                            )
                                          ),
                                          ElevatedButton.icon(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => const BookCarPage()),
                                              );
                                            },
                                            icon: Icon(Icons.book, size: 18),
                                            label: Text("Book now"),
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1F9F2F)),
                                            ),
                                          ),
                                          SizedBox(width: 8,),
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                                flex:8 ,
                              ),
                            ],
                          ),
                        ),
                        elevation: 8,
                        margin: EdgeInsets.all(10),
                      ), 
                      //End of card.

                      Card( //item-2 -----------------------------------------
                        child:Container(
                          height: 140,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Center(
                                child:Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child:Image.asset("assets/images/citycar2.jpg", width: 150),
                                        flex:2 ,
                                      ),
                                    
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          transform: Matrix4.translationValues(0.0, 5.0, 0.0),
                                          
                                          //Left section.
                                          child: Row(
                                            children: [
                                              Text(
                                                "Driver", 
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14,
                                                  color: Color(0xFF4169E1)
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                                child: Text(
                                                  "none", 
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13,
                                                    color: Color(0xFF808080)
                                                  ),
                                                ),
                                              ),
                                            ],

                                          )
                                        ),
                                      ),

                                    ]
                                  ),
                                ),
                              ),
                              Expanded(
                                child:Container(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Container(
                                        // flex: 5, //if expanded
                                        margin: EdgeInsets.symmetric(vertical: 5.0),
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            children: const [
                                              WidgetSpan(
                                                child: Icon(Icons.car_rental,   
                                                  size: 20,
                                                  color: Color(0xFF4169E1),
                                                ),
                                              ),
                                              TextSpan(
                                                text: " Daihatsu Ayla / 2017",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                )
                                              ),
                                            ],
                                          ),
                                        )
                                      ),
                                      Container(
                                        // flex: 5, //if expanded
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            children: const [
                                              WidgetSpan(
                                                child: Icon(Icons.location_on, 
                                                  size: 20,
                                                  color: Color(0xFF4169E1),
                                                ),
                                              ),
                                              TextSpan(
                                                text: " Baleendah",
                                                style: TextStyle(
                                                  color: Color(0xFF808080),
                                                  fontWeight: FontWeight.w700,
                                                )
                                              ),
                                            ],
                                          ),
                                        )
                                      ),

                                      Container(
                                        // flex: 5, //if expanded
                                        margin: EdgeInsets.symmetric(vertical: 5.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              // flex: 5, //if expanded
                                              alignment: Alignment.topLeft,
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
                                                      text: " 245.000",
                                                      style: TextStyle(
                                                        color: Colors.black,
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

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            // flex: 5, //if expanded
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.symmetric(horizontal: 5.0),
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
                                                    text: " 4,4",
                                                    style: TextStyle(
                                                      color: Color(0xFF4169E1),
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w700,
                                                    )
                                                  ),
                                                ],
                                              ),
                                            )
                                          ),
                                          ElevatedButton.icon(
                                            onPressed: () {
                                                // Respond to button press
                                            },
                                            icon: Icon(Icons.book, size: 18),
                                            label: Text("Book now"),
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1F9F2F)),
                                            ),
                                          ),
                                          SizedBox(width: 8,),
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                                flex:8 ,
                              ),
                            ],
                          ),
                        ),
                        elevation: 8,
                        margin: EdgeInsets.all(10),
                      ), 
                      //End of card.

                      Card( //item-3. -----------------------------------------
                        child:Container(
                          height: 150,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Center(
                                child:Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child:Image.asset("assets/images/citycar3.jpg", width: 150),
                                        flex:2 ,
                                      ),
                                    
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          transform: Matrix4.translationValues(0.0, 5.0, 0.0),
                                          
                                          //Left section.
                                          child: Row(
                                            children: [
                                              Text(
                                                "Driver", 
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14,
                                                  color: Color(0xFF4169E1)
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(20),
                                                      child: Image.asset(
                                                        'assets/images/driver1.jpg', width: 32),
                                                    ),
                                                    Text(
                                                      " Ben Parker", 
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w800,
                                                        fontSize: 13,
                                                        color: Color(0xFF808080)
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ),
                                            ],

                                          )
                                        ),
                                      ),

                                    ]
                                  ),
                                ),
                              ),
                              Expanded(
                                child:Container(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Container(
                                        // flex: 5, //if expanded
                                        margin: EdgeInsets.symmetric(vertical: 5.0),
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            children: const [
                                              WidgetSpan(
                                                child: Icon(Icons.car_rental,   
                                                  size: 20,
                                                  color: Color(0xFF4169E1),
                                                ),
                                              ),
                                              TextSpan(
                                                text: " Toyota Raize / 2022",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                )
                                              ),
                                            ],
                                          ),
                                        )
                                      ),
                                      Container(
                                        // flex: 5, //if expanded
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            children: const [
                                              WidgetSpan(
                                                child: Icon(Icons.location_on, 
                                                  size: 20,
                                                  color: Color(0xFF4169E1),
                                                ),
                                              ),
                                              TextSpan(
                                                text: " Bojongsoang",
                                                style: TextStyle(
                                                  color: Color(0xFF808080),
                                                  fontWeight: FontWeight.w700,
                                                )
                                              ),
                                            ],
                                          ),
                                        )
                                      ),

                                      Container(
                                        // flex: 5, //if expanded
                                        margin: EdgeInsets.symmetric(vertical: 5.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              // flex: 5, //if expanded
                                              alignment: Alignment.topLeft,
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
                                                      text: " 360.000",
                                                      style: TextStyle(
                                                        color: Colors.black,
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

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            // flex: 5, //if expanded
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.symmetric(horizontal: 5.0),
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
                                                    text: " 4,9",
                                                    style: TextStyle(
                                                      color: Color(0xFF4169E1),
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w700,
                                                    )
                                                  ),
                                                ],
                                              ),
                                            )
                                          ),
                                          ElevatedButton.icon(
                                            onPressed: () {
                                                // Respond to button press
                                            },
                                            icon: Icon(Icons.book, size: 18),
                                            label: Text("Book now"),
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1F9F2F)),
                                            ),
                                          ),
                                          SizedBox(width: 8,),
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                                flex:8 ,
                              ),
                            ],
                          ),
                        ),
                        elevation: 8,
                        margin: EdgeInsets.all(10),
                      ), 
                      //End of card.

                      Card( //item-4 -----------------------------------------
                        child:Container(
                          height: 150,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Center(
                                child:Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child:Image.asset("assets/images/citycar4.jpg", width: 150),
                                        flex:2 ,
                                      ),
                                    
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          transform: Matrix4.translationValues(0.0, 5.0, 0.0),
                                          
                                          //Left section.
                                          child: Row(
                                            children: [
                                              Text(
                                                "Driver", 
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14,
                                                  color: Color(0xFF4169E1)
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(20),
                                                      child: Image.asset(
                                                        'assets/images/driver2.jpg', width: 32),
                                                    ),
                                                    Text(
                                                      " Craig Mckay", 
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w800,
                                                        fontSize: 13,
                                                        color: Color(0xFF808080)
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ),
                                            ],

                                          )
                                        ),
                                      ),

                                    ]
                                  ),
                                ),
                              ),
                              Expanded(
                                child:Container(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Container(
                                        // flex: 5, //if expanded
                                        margin: EdgeInsets.symmetric(vertical: 5.0),
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            children: const [
                                              WidgetSpan(
                                                child: Icon(Icons.car_rental,   
                                                  size: 20,
                                                  color: Color(0xFF4169E1),
                                                ),
                                              ),
                                              TextSpan(
                                                text: " Honda Brio Satya / 2016",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                )
                                              ),
                                            ],
                                          ),
                                        )
                                      ),
                                      Container(
                                        // flex: 5, //if expanded
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            children: const [
                                              WidgetSpan(
                                                child: Icon(Icons.location_on, 
                                                  size: 20,
                                                  color: Color(0xFF4169E1),
                                                ),
                                              ),
                                              TextSpan(
                                                text: " Margacinta",
                                                style: TextStyle(
                                                  color: Color(0xFF808080),
                                                  fontWeight: FontWeight.w700,
                                                )
                                              ),
                                            ],
                                          ),
                                        )
                                      ),

                                      Container(
                                        // flex: 5, //if expanded
                                        margin: EdgeInsets.symmetric(vertical: 5.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              // flex: 5, //if expanded
                                              alignment: Alignment.topLeft,
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
                                                      text: " 320.000",
                                                      style: TextStyle(
                                                        color: Colors.black,
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

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            // flex: 5, //if expanded
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.symmetric(horizontal: 5.0),
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
                                                    text: " 4,8",
                                                    style: TextStyle(
                                                      color: Color(0xFF4169E1),
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w700,
                                                    )
                                                  ),
                                                ],
                                              ),
                                            )
                                          ),
                                          ElevatedButton.icon(
                                            onPressed: () {
                                                // Respond to button press
                                            },
                                            icon: Icon(Icons.book, size: 18),
                                            label: Text("Book now"),
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1F9F2F)),
                                            ),
                                          ),
                                          SizedBox(width: 8,),
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                                flex:8 ,
                              ),
                            ],
                          ),
                        ),
                        elevation: 8,
                        margin: EdgeInsets.all(10),
                      ), 
                      //End of card.

                  ]
                )
              )
            )
            //End of item list.

          ], 
        ),)
      );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: 
          IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: Text("Account", 
        style: TextStyle(
          color: Color(0xFF4169E1),
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
      
      actions: [
        IconButton(
          icon: Icon(Icons.home, color: Color(0xFF4169E1)),
          iconSize: 40,
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
        //Transparent setting.
        backgroundColor: Color(0x44FFFFFF),
        elevation: 0,
      ),

      body: Center(
        child: Container(
          transform: Matrix4.translationValues(0.0, -40.0, 0.0),
          child: Flexible(
            child : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  //Text.
                  Container(
                    width: 160,
                    margin: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80), 
                      child: Image.asset('assets/images/User.jpg'),
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

                  //Full name section.
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                      child: Text(
                        "Fullname", 
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xFF808080)
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.0),
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                          ),
                      
                          hintText: 'Rose Monde',
                        ),
                      ),
                    ),
                  ),

                  //ID Card section.
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                      child: Text(
                        "ID Card / Passport Number", 
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xFF808080)
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.0),
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                          ),
                      
                          hintText: '9171010203010001',
                        ),
                      ),
                    ),
                  ),

                  //Password section.
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                      child: Text(
                        "Password", 
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xFF808080)
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.0),
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                          ),
                      
                          hintText: 'nopass123',
                        ),
                      ),
                    ),
                  ),

                  //Email section.
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                      child: Text(
                        "Email", 
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xFF808080)
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 3.0),
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                          ),
                      
                          hintText: 'monderose@gmail.com',
                        ),
                      ),
                    ),
                  ),

                  //Phone number section.
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                      child: Text(
                        "Phone Number", 
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xFF808080)
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 3.0),
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                          ),
                      
                          hintText: '08114882001',
                        ),
                      ),
                    ),
                  ),
                  //End of text entry section.

                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                        child: Icon(
                          Icons.info,
                          color: Color(0xFF4169E1),
                          size: 30.0,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 300,
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "Password must have min 8 character, Have 1 capital and 1 number.", 
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Color(0xFF4169E1)
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),

                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                              // Respond to button press
                          },
                          icon: Icon(Icons.photo, size: 20),
                          label: Text("Change Photo"),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF4169E1), 
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                              // Respond to button press
                          },
                          icon: Icon(Icons.save, size: 20),
                          label: Text("Save Changes"),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF13B402), 
                          ),
                        ),
                      ),
                    ]
                  )

                ]
              )
            )
          )
        ),
      )
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: 
          IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: Text("About", 
        style: TextStyle(
          color: Color(0xFF4169E1),
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
      
      actions: [
        IconButton(
          icon: Icon(Icons.home, color: Color(0xFF4169E1)),
          iconSize: 40,
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
      //Transparent setting.
      backgroundColor: Color(0x44FFFFFF),
      elevation: 0,
    ),

      body: Center(
        child: Column(
          children: [
            Align(
              child: Icon(
                Icons.travel_explore,
                color: Color(0xFF4169E1),
                size: 100.0,
              ),     
            ),
            //Bug fontfamily not working.
            Align(
              child: Text('tripversal',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  fontFamily: 'FuturaMediumBT',
                  color: Color(0xFF4169E1)
                ),
              ),
            ),
            Text('-The joy of trip-',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontSize: 15,
                fontFamily: 'FuturaMediumBT',
                color: Color(0xFF4169E1)
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text('Tripversal is an application that will help you travel around Indonesia. With Tripversal you can rent a various of vehicle like citycar, minibus, motorcycle, even a bus. Not only that, you can also rent a tour guide with various spoken language. Our vehicle and guide are trusted and will help you through the day. So dont hesitate and book now to get a trip that will never be forgotten.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'FuturaMediumBT',
                  color: Color(0xFF808080)
                ),
              ),
            ),
            
          ]
        )
      ),
    );
  }
}
class TourGuidePage extends StatelessWidget {
  const TourGuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: 
          IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: Text("Welcome, Rose Monde", 
        style: TextStyle(
          color: Color(0xFF4169E1),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      
      actions: [
        IconButton(
          icon: Image.asset('assets/images/User.jpg'),
          iconSize: 50,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AccountPage()),
            );
          },
        )
      ],//error image blur so badly and not round yet

        //Transparent setting.
        backgroundColor: Color(0x44FFFFFF),
        elevation: 0,
      ),

      body: Center(
        child: Column(
          children: [
            //Text.
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                transform: Matrix4.translationValues(0.0, 5.0, 0.0),
                child: Text(
                  "Location", 
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: Color(0xFF808080)
                  ),
                ),
              ),
            ),
            
            //Text.
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  //Drop down.
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                    child: MyStatefulWidget(),
                  ),

                  //Text entry search.
                  Container(   
                    width: 200,
                    transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'search by name...',
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                  ),

                  //Sort by button.
                  Container(
                    //Button properties.
                    decoration: BoxDecoration(
                      borderRadius : BorderRadius.circular(10),
                      color: Color(0xFF4169E1),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3)
                        )
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                    
                    child: PopupMenuButton( 
                      iconSize: 35,
                      icon: Icon(Icons.sort, color: Colors.white),
                      enabled: true,
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: ListTile(
                            leading: IconButton(
                              iconSize: 30,
                              icon: Icon(Icons.arrow_drop_up,
                              color: Color(0xFF4169E1)),
                              onPressed: () {},
                            ),
                            title: Text('Sort by Price'),
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: IconButton(
                              iconSize: 30,
                              icon: Icon(Icons.arrow_drop_down,
                              color: Color(0xFF4169E1)),
                              onPressed: () {},
                            ),
                            title: Text('Sort by Price'),
                          ),
                        )
                      ]
                    ),
                  ),

                ],
              ),
            ),

            //Text.
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                //transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                child: Text(
                  "Language", 
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: Color(0xFF808080)
                  ),
                ),
              ),
            ),

            Align(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    //Language-1
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        children:  [
                          Align(
                            child: MyStatefulWidget2(),
                          ),  
                          Align(
                            child: Container(
                              transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/indonesia.png', width: 25),
                              ),                      
                            ),
                          ),
                          Align(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Text(
                                "ID  ", 
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ]       
                      ),
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.circular(10),
                        color: Color(0xFF4169E1),
                      ),
                    ),
                    
                    //Language-2
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        children:  [
                          Align(
                            child: MyStatefulWidget2(),
                          ),  
                          Align(
                            child: Container(
                              transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/united-kingdom.png', width: 25),
                              ),                      
                            ),
                          ),
                          Align(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Text(
                                "EN  ", 
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ]       
                      ),
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.circular(10),
                        color: Color(0xFF4169E1),
                      ),
                    ),

                    //Language-3
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        children:  [
                          Align(
                            child: MyStatefulWidget2(),
                          ),  
                          Align(
                            child: Container(
                              transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/spain.png', width: 25),
                              ),                      
                            ),
                          ),
                          Align(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Text(
                                "ES  ", 
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ]       
                      ),
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.circular(10),
                        color: Color(0xFF4169E1),
                      ),
                    ),


                  ]
                )
              )
            ),

            Align( //text
              child: Text('Showing 4 result...',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                    color: Color(0xFF808080)
                  ),
                ),
            ),

            Flexible(
              child : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                      
                    Card( //item-1 -----------------------------------------
                      child:Container(
                        height: 100,
                        color: Colors.white,
                        child: Row(
                          children: [  
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/driver1.jpg', width: 80),
                                ),
                            ),
                            Expanded(
                              child:Container(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Container(
                                      // flex: 5, //if expanded
                                      margin: EdgeInsets.symmetric(vertical: 5.0),
                                      alignment: Alignment.topLeft,
                                      child: Row (
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: const [
                                                WidgetSpan(
                                                  child: Icon(Icons.person, 
                                                    size: 20,
                                                    color: Color(0xFF4169E1),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "Ben Parker",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                ),                              
                                              ],
                                            ),
                                          ),
                                          Container(
                                            transform: Matrix4.translationValues(70.0, 0.0, 0.0),
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
                                    ),
                                    Container(
                                      // flex: 5, //if expanded
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: TextSpan(
                                          children: const [
                                            WidgetSpan(
                                              child: Icon(Icons.message, 
                                                size: 20,
                                                color: Color(0xFF4169E1),
                                              ),
                                            ),
                                            TextSpan(
                                              text: " ID, EN, ES, FR",
                                              style: TextStyle(
                                                color: Color(0xFF808080),
                                                fontWeight: FontWeight.w700,
                                              )
                                            ),
                                          ],
                                        ),
                                      )
                                    ),

                                    Container(
                                      // flex: 5, //if expanded
                                      margin: EdgeInsets.symmetric(vertical: 10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            // flex: 5, //if expanded
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.symmetric(horizontal: 25.0),
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
                                                    text: " 450.000",
                                                    style: TextStyle(
                                                      color: Colors.black,
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

                                  ],
                                ),
                              ),
                              flex:8 ,
                            ),
                            SizedBox(
                              height: 100,
                              width: 60,
                              child: ButtonTheme(
                                minWidth: 30,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const BookGuidePage()),
                                    );
                                  },
                                  icon: Icon(Icons.play_arrow, size: 25),
                                  label: Text(""),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1F9F2F)),
                                  ),
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                      elevation: 8,
                      margin: EdgeInsets.all(10),
                    ),

                    Card( //item-2 -----------------------------------------
                      child:Container(
                        height: 100,
                        color: Colors.white,
                        child: Row(
                          children: [  
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/driver2.jpg', width: 80),
                                ),
                            ),
                            Expanded(
                              child:Container(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Container(
                                      // flex: 5, //if expanded
                                      margin: EdgeInsets.symmetric(vertical: 5.0),
                                      alignment: Alignment.topLeft,
                                      child: Row (
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: const [
                                                WidgetSpan(
                                                  child: Icon(Icons.person, 
                                                    size: 20,
                                                    color: Color(0xFF4169E1),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "Craig Mckay",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                ),                              
                                              ],
                                            ),
                                          ),
                                          Container(
                                            transform: Matrix4.translationValues(70.0, 0.0, 0.0),
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
                                                    text: "4,8",
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
                                      // flex: 5, //if expanded
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: TextSpan(
                                          children: const [
                                            WidgetSpan(
                                              child: Icon(Icons.message, 
                                                size: 20,
                                                color: Color(0xFF4169E1),
                                              ),
                                            ),
                                            TextSpan(
                                              text: " ID, EN, ZH, PT",
                                              style: TextStyle(
                                                color: Color(0xFF808080),
                                                fontWeight: FontWeight.w700,
                                              )
                                            ),
                                          ],
                                        ),
                                      )
                                    ),

                                    Container(
                                      // flex: 5, //if expanded
                                      margin: EdgeInsets.symmetric(vertical: 10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            // flex: 5, //if expanded
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.symmetric(horizontal: 25.0),
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
                                                    text: " 420.000",
                                                    style: TextStyle(
                                                      color: Colors.black,
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

                                  ],
                                ),
                              ),
                              flex:8 ,
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
                                  icon: Icon(Icons.play_arrow, size: 25),
                                  label: Text(""),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1F9F2F)),
                                  ),
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                      elevation: 8,
                      margin: EdgeInsets.all(10),
                    ),

                    Card( //item-3 -----------------------------------------
                      child:Container(
                        height: 100,
                        color: Colors.white,
                        child: Row(
                          children: [  
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/driver3.jpg', width: 80),
                                ),
                            ),
                            Expanded(
                              child:Container(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Container(
                                      // flex: 5, //if expanded
                                      margin: EdgeInsets.symmetric(vertical: 5.0),
                                      alignment: Alignment.topLeft,
                                      child: Row (
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: const [
                                                WidgetSpan(
                                                  child: Icon(Icons.person, 
                                                    size: 20,
                                                    color: Color(0xFF4169E1),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "Kelly Christy",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                ),                              
                                              ],
                                            ),
                                          ),
                                          Container(
                                            transform: Matrix4.translationValues(70.0, 0.0, 0.0),
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
                                                    text: "4,7",
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
                                      // flex: 5, //if expanded
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: TextSpan(
                                          children: const [
                                            WidgetSpan(
                                              child: Icon(Icons.message, 
                                                size: 20,
                                                color: Color(0xFF4169E1),
                                              ),
                                            ),
                                            TextSpan(
                                              text: " ID, EN, PT",
                                              style: TextStyle(
                                                color: Color(0xFF808080),
                                                fontWeight: FontWeight.w700,
                                              )
                                            ),
                                          ],
                                        ),
                                      )
                                    ),

                                    Container(
                                      // flex: 5, //if expanded
                                      margin: EdgeInsets.symmetric(vertical: 10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            // flex: 5, //if expanded
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.symmetric(horizontal: 25.0),
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
                                                    text: " 380.000",
                                                    style: TextStyle(
                                                      color: Colors.black,
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

                                  ],
                                ),
                              ),
                              flex:8 ,
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
                                  icon: Icon(Icons.play_arrow, size: 25),
                                  label: Text(""),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1F9F2F)),
                                  ),
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                      elevation: 8,
                      margin: EdgeInsets.all(10),
                    ),

                    Card( //item-4 -----------------------------------------
                      child:Container(
                        height: 100,
                        color: Colors.white,
                        child: Row(
                          children: [  
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/driver4.jpg', width: 80),
                                ),
                            ),
                            Expanded(
                              child:Container(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Container(
                                      // flex: 5, //if expanded
                                      margin: EdgeInsets.symmetric(vertical: 5.0),
                                      alignment: Alignment.topLeft,
                                      child: Row (
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: const [
                                                WidgetSpan(
                                                  child: Icon(Icons.person, 
                                                    size: 20,
                                                    color: Color(0xFF4169E1),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "Maia Austin",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                ),                              
                                              ],
                                            ),
                                          ),
                                          Container(
                                            transform: Matrix4.translationValues(70.0, 0.0, 0.0),
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
                                      // flex: 5, //if expanded
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: TextSpan(
                                          children: const [
                                            WidgetSpan(
                                              child: Icon(Icons.message, 
                                                size: 20,
                                                color: Color(0xFF4169E1),
                                              ),
                                            ),
                                            TextSpan(
                                              text: " ID, EN, ES, FR",
                                              style: TextStyle(
                                                color: Color(0xFF808080),
                                                fontWeight: FontWeight.w700,
                                              )
                                            ),
                                          ],
                                        ),
                                      )
                                    ),

                                    Container(
                                      // flex: 5, //if expanded
                                      margin: EdgeInsets.symmetric(vertical: 10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            // flex: 5, //if expanded
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.symmetric(horizontal: 25.0),
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
                                                    text: " 370.000",
                                                    style: TextStyle(
                                                      color: Colors.black,
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

                                  ],
                                ),
                              ),
                              flex:8 ,
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
                                  icon: Icon(Icons.play_arrow, size: 25),
                                  label: Text(""),  
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1F9F2F)),
                                  ),
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                      elevation: 8,
                      margin: EdgeInsets.all(10),
                    ),

                  ] 
                  //End of card.
                )
              )
            )
          ]
        )
      )
    );
  }
}
class MyResPage extends StatelessWidget {
  const MyResPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: 
          IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: Text("Welcome, Rose Monde", 
        style: TextStyle(
          color: Color(0xFF4169E1),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      
      actions: [
        IconButton(
          icon: Image.asset('assets/images/User.jpg'),
          iconSize: 50,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AccountPage()),
            );
          },
        )
      ],//error image blur so badly and not round yet

        //Transparent setting.
        backgroundColor: Color(0x44FFFFFF),
        elevation: 0,
      ),
      
      body: Center(
        child: ExpansionResv()
      )
    );
  }
}

//Drop down location or city.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
  
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'Bandung';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(
        color: Color(0xFF4169E1),
        fontSize: 15,
      ),
      underline: Container(
        height: 2,
        color: Color(0xFF4169E1),
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>["Bandung", "Jakarta", "Bali", "Lombok", "Toraja"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class BookCarPage extends StatelessWidget {
  const BookCarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: 
          IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: Text("Book Car", 
        style: TextStyle(
          color: Color(0xFF4169E1),
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
      
      actions: [
        IconButton(
          icon: Icon(Icons.home, color: Color(0xFF4169E1)),
          iconSize: 40,
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
      //Transparent setting.
      backgroundColor: Color(0x44FFFFFF),
      elevation: 0,
    ),

      body: Center(
        child: bookCar()
      ),
    );
  }
}
class BookGuidePage extends StatelessWidget {
  const BookGuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: 
          IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: Text("Book Tour Guide", 
        style: TextStyle(
          color: Color(0xFF4169E1),
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
      
      actions: [
        IconButton(
          icon: Icon(Icons.home, color: Color(0xFF4169E1)),
          iconSize: 40,
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
      //Transparent setting.
      backgroundColor: Color(0x44FFFFFF),
      elevation: 0,
    ),

      body: Center(
        child: bookGuide()
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: 
          IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: Text("Help", 
        style: TextStyle(
          color: Color(0xFF4169E1),
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
      
      actions: [
        IconButton(
          icon: Icon(Icons.home, color: Color(0xFF4169E1)),
          iconSize: 40,
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
      //Transparent setting.
      backgroundColor: Color(0x44FFFFFF),
      elevation: 0,
    ),

      body: Center(
        child: help()
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: login()
      ),
    );
  }
}