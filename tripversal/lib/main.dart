// ignore_for_file: prefer_const_constructors
// Kelompok 4 - SE-43-03
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tripversal/helpBody.dart';
import 'package:tripversal/loginBody.dart';
import 'package:tripversal/models/carModel.dart';
import 'package:tripversal/models/guideModel.dart';
import 'package:tripversal/models/onGoingModel.dart';
import 'package:tripversal/models/resvModel.dart';
import 'package:tripversal/models/userModel.dart';
import 'package:tripversal/orderBody.dart';
import 'package:tripversal/paymentBody.dart';
import 'package:tripversal/services/guideServices.dart';
import 'package:tripversal/services/resvServices.dart';
import 'package:tripversal/services/userServices.dart';
import 'package:tripversal/services/carServices.dart';
import 'package:tripversal/settingBody.dart';
import 'package:tripversal/widgets/sideNav.dart';
import 'package:tripversal/widgets/checkBox.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'createAccBody.dart';
import 'forgetPassBody.dart';

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}
void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Leonardho R Sitanggang-1302194041",
      home: LoginPage(), //Navbar
    );
  }
}
class NavBar extends StatefulWidget {
  const NavBar({Key key, this.pass_usernameNav}) : super(key: key);
  final String pass_usernameNav;
  
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  static var _usernamePass;

  final List<Widget> _widgetOptions = <Widget>[
    RentACarPage(pass_username: _usernamePass),
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
              label: 'Reservation',
            ),
          ],
          //Selected menu style.
          selectedLabelStyle: TextStyle(fontSize: 15),
          selectedItemColor: Colors.white,
          backgroundColor: Color(0xFF22A7F0),
          unselectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _usernamePass = widget.pass_usernameNav;
            });
          },
          
        ),
    );
  }
}

class RentACarPage extends StatefulWidget {
  const RentACarPage({Key key, this.pass_username}) : super(key: key);

  final String pass_username;

  @override

  _RentACarPage createState() => _RentACarPage();
}

class _RentACarPage extends State<RentACarPage> {
  var _car = carModel();
  var _carServices = carServices();

  List<carModel> _carList = <carModel>[];
  
  @override
  void initState(){
    super.initState();
    getAllCarData();
  }

  getAllCarData() async {
    _carList = <carModel>[];
    var cars = await _carServices.readCar();

    cars.forEach((car){
      setState((){
        var carModels = carModel();
        carModels.idCar = car['id_car'];
        carModels.plate = car['plate'];
        carModels.type = car['type'];
        carModels.carname = car['carname'];
        carModels.location = car['location'];
        carModels.price = car['price'];
        carModels.rating = car['rating'];
        carModels.driver = car['driver'];
        carModels.seat = car['seat'];
        carModels.tank = car['tank'];
        carModels.distance = car['distance'];
        carModels.desc = car['desc'];
        _carList.add(carModels);
      });
    });
  }

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
        title: Text("Welcome, ${widget.pass_username}", 
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
              MaterialPageRoute(builder: (context) => AccountPage()),
            );
          },
        )
      ],//error image blur so badly and not round yet

        //Transparent setting.
        backgroundColor: Color(0x44FFFFFF),
        elevation: 0,
      ),

      //Body.
      body: Container(
            height: MediaQuery.of(context).size.height,
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
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
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
                  child: Text("Showing ${_carList.length.toString()} result...",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                        color: Color(0xFF808080)
                      ),
                    ),
                ),

                Flexible(
                  child: ListView.builder(
                    itemCount : _carList.length,
                    itemBuilder: (context, index){

                      return Card(
                        child:Container(
                          height: 140,
                          child: Row(
                            children: [
                              Center(
                                child:Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child:Image.asset("assets/images/${ _carList[index].plate}.jpg", width: 150),
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
                                                  _carList[index].driver, 
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
                                            children: [
                                              WidgetSpan(
                                                child: Icon(Icons.car_rental,   
                                                  size: 20,
                                                  color: Color(0xFF4169E1),
                                                ),
                                              ),
                                              TextSpan(
                                                text: _carList[index].carname, 
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
                                            children: [
                                              WidgetSpan(
                                                child: Icon(Icons.location_on, 
                                                  size: 20,
                                                  color: Color(0xFF4169E1),
                                                ),
                                              ),
                                              TextSpan(
                                                text: _carList[index].location, 
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
                                                  children: [
                                                    TextSpan(
                                                      text: "Rp. ",
                                                      style: TextStyle(
                                                        color: Color(0xFF808080),
                                                        fontSize: 21,
                                                        fontWeight: FontWeight.w700,
                                                      )
                                                    ),
                                                    TextSpan(
                                                      text: _carList[index].price.toString(),
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
                                                children: [
                                                  WidgetSpan(
                                                    child: Icon(Icons.star, 
                                                      size: 20,
                                                      color: Color(0xFF4169E1),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: _carList[index].rating.toString(), 
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
                                                PageRouteBuilder(
                                                  pageBuilder: (c, a1, a2) => BookCarPage(pass_idCar: _carList[index].idCar),
                                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                                    final tween = Tween(begin: Offset(0.0, 1.0), end: Offset.zero);
                                                    final curvedAnimation = CurvedAnimation(
                                                      parent: animation,
                                                      curve: Curves.ease,
                                                    );

                                                    return SlideTransition(
                                                      position: tween.animate(curvedAnimation),
                                                      child: child,
                                                    );
                                                  }
                                                ),
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                        ),
                        elevation: 6,
                        margin: EdgeInsets.all(6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ); 
                      //End of card.
                  }
                //End of item list.
                )
              )
            ], 

        )
      )
      
    );
  }
}
class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override

  _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  //const AccountPage({Key key}) : super(key: key);
  var _user = userModel();
  var _userServices = userServices();

  List<userModel> _userList = <userModel>[];
  
  @override
  void initState(){
    super.initState();
    getAllUserData();
  }

  getAllUserData() async {
    _userList = <userModel>[];
    var users = await _userServices.readUser();

    users.forEach((user){
      setState((){
        var userModels = userModel();
        userModels.fullname = user['fullname'];
        userModels.idCard = user['id_card'].toString();
        userModels.password = user['password'];
        userModels.email = user['email'];
        userModels.phone = user['phone'];
        _userList.add(userModels);
      });
    });
  }

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
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => const NavBar(),
              ),
            );
          },
        )
      ],
        //Transparent setting.
        backgroundColor: Color(0x44FFFFFF),
        elevation: 0,
      ),

      body: ListView.builder(
        itemCount : _userList.length,
        itemBuilder: (context, index){

        return Container(
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
                      
                          hintText: _userList[index].fullname,
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
                      
                          hintText: _userList[index].idCard,
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
                      
                          hintText: _userList[index].password,
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
                      
                          hintText: _userList[index].email,
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
                      
                          hintText: _userList[index].phone,
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
        );
     })
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

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
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => const NavBar(),
              ),
            );
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
class TourGuidePage extends StatefulWidget {
  const TourGuidePage({Key key, this.pass_idGuide}) : super(key: key);
  final String pass_idGuide;

  @override

  _TourGuidePage createState() => _TourGuidePage();
}

class _TourGuidePage extends State<TourGuidePage> {
  var _guide = guideModel();
  var _guideServices = guideServices();

  List<guideModel> _guideList = <guideModel>[];
  
  @override
  void initState(){
    super.initState();
    getAllGuideData();
  }

  getAllGuideData() async {
    _guideList = <guideModel>[];
    var guides = await _guideServices.readGuide();

    guides.forEach((guide){
      setState((){
        var guideModels = guideModel();
        guideModels.idGuide = guide['id_guide'];
        guideModels.name = guide['name'];
        guideModels.price = guide['price'];
        guideModels.rating = guide['rating'];
        guideModels.customer = guide['customer'];
        guideModels.desc = guide['desc'];
        guideModels.phone = guide['phone'];
        guideModels.address = guide['address'];
        guideModels.email = guide['email'];
        _guideList.add(guideModels);
      });
    });
  }

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
              MaterialPageRoute(builder: (context) => AccountPage()),
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
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
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
              child: Text("Showing ${_guideList.length.toString()} result...",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                    color: Color(0xFF808080)
                  ),
                ),
            ),

            Flexible(
              child: ListView.builder(
              itemCount : _guideList.length,
              itemBuilder: (context, index){
                      
                  return  Card( //item-1 -----------------------------------------
                      child:Container(
                        height: 100,
                        child: Row(
                          children: [  
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset("assets/images/${ _guideList[index].name}.jpg", width: 80),
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
                                              children: [
                                                WidgetSpan(
                                                  child: Icon(Icons.person, 
                                                    size: 20,
                                                    color: Color(0xFF4169E1),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: _guideList[index].name,
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
                                                children: [
                                                  WidgetSpan(
                                                    child: Icon(Icons.star, 
                                                      size: 20,
                                                      color: Color(0xFF4169E1),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: _guideList[index].rating.toString(),
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
                                                children: [
                                                  TextSpan(
                                                    text: "Rp. ",
                                                    style: TextStyle(
                                                      color: Color(0xFF808080),
                                                      fontSize: 21,
                                                      fontWeight: FontWeight.w700,
                                                    )
                                                  ),
                                                  TextSpan(
                                                    text: _guideList[index].price.toString(),
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
                            Container(
                              height: 80,
                              width: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ButtonTheme(
                                minWidth: 30,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (c, a1, a2) => BookGuidePage(pass_idGuide: _guideList[index].idGuide),
                                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                          final tween = Tween(begin: Offset(0.0, 1.0), end: Offset.zero);
                                          final curvedAnimation = CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.ease,
                                          );

                                          return SlideTransition(
                                            position: tween.animate(curvedAnimation),
                                            child: child,
                                          );
                                        }
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.arrow_forward, size: 25),
                                  label: Text(""),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1F9F2F)),
                                  ),
                                )
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      elevation: 8,
                      margin: EdgeInsets.all(6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
 
                  //End of card.
                  }
                )
              )
            
          ]
        )
      )
    );
  }
}
class MyResPage extends StatefulWidget {
  const MyResPage({Key key}) : super(key: key);

  @override

  _MyResPage createState() => _MyResPage();
}

class _MyResPage extends State<MyResPage> {
  var _resv = resvModel();
  var _ongoing = onGoingModel();
  var _resvServices = resvServices();

  List<resvModel> _historyList = <resvModel>[];
  List<onGoingModel> _onGoingList = <onGoingModel>[];
  
  @override
  void initState(){
    super.initState();
    getAllHistoryData();
    getAllOnGoingData();
  }

  getAllHistoryData() async {
    _historyList = <resvModel>[];
    var history = await _resvServices.readHistory();

    history.forEach((history){
      setState((){
        var historyModels = resvModel();
        historyModels.idHistory = history['id_history'];
        historyModels.idUser = history['id_user'];
        historyModels.type = history['type'];
        historyModels.price = history['price'];
        historyModels.rating = history['rating'];
        historyModels.name = history['name'];
        historyModels.phone = history['phone'];
        historyModels.location = history['location'];
        historyModels.barcode = history['barcode'];
        historyModels.dateStart= DateTime.tryParse(history['dateStart']);
        historyModels.dateEnd= DateTime.tryParse(history['dateEnd']);
        historyModels.dateComment= DateTime.tryParse(history['dateComment']);
        historyModels.comment= history['comment'];
        _historyList.add(historyModels);
      });
    });
  }
  getAllOnGoingData() async {
    _onGoingList = <onGoingModel>[];
    var ongoing = await _resvServices.readOnGoing();

    ongoing.forEach((ongoing){
      setState((){
        var onGoingModels = onGoingModel();
        onGoingModels.idOnGoing = ongoing['id_ongoing'];
        onGoingModels.idUser = ongoing['id_user'];
        onGoingModels.idCarGuide = ongoing['id_car_guide'];
        onGoingModels.type = ongoing['type'];
        onGoingModels.desc = ongoing['desc'];
        onGoingModels.dateStart= DateTime.tryParse(ongoing['dateStart']);
        onGoingModels.dateEnd= DateTime.tryParse(ongoing['dateEnd']);

        _onGoingList.add(onGoingModels);
      });
    });
  }

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
              MaterialPageRoute(builder: (context) => AccountPage()),
            );
          },
        )
      ],//error image blur so badly and not round yet

        //Transparent setting.
        backgroundColor: Color(0x44FFFFFF),
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
              children: <Widget>[
                
                ExpansionTile( //Collapse-1 ===========================================
                  initiallyExpanded: true,
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
                                            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
                                            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
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
                                                            fontSize: 22,
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
                                  Container(
                                    height: 60,
                                    width: 80,
                                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                    child: RaisedButton(
                                      color: const Color(0xFFe33b51),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(1.0),
                                            child: Icon(
                                              Icons.cancel,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(0),
                                            child: Text(
                                              "Cancel",
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
                                              Icons.info,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(0),
                                            child: Text(
                                              "Details",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context, MaterialPageRoute(
                                            builder: (context) => const PaymentPage(),
                                          ),
                                        );
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

                ExpansionTile( //Collapse-2 ===========================================
                  initiallyExpanded: true,
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
                    Container(
                      height: 260, 
                      margin: EdgeInsets.symmetric(horizontal: 5), 
                      child: ListView.builder(               
                        scrollDirection: Axis.horizontal,
                        itemCount : _onGoingList.length,
                        itemBuilder: (context, index){
                          return Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFF4169E1), width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.circular(10),             
                                color: Colors.white,
                              ),
                                  
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(_onGoingList[index].type, style: TextStyle(fontWeight: FontWeight.w800)),
                                    subtitle: Text(
                                      "${_onGoingList[index].desc} ~ end on ${_onGoingList[index].dateEnd}",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical : 3), 
                                    child: Image.asset('assets/images/D 1670 VZB.jpg', width: 180),
                                  ),
                                  Align(
                                    
                                  ),
                                  Row(
                                  children:[ 
                                    Container(
                                      height: 40,
                                      width: 90, 
                                      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical : 10), 
                                      child: RaisedButton(
                                        color: const Color(0xFF4169E1),
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
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
                                      height: 40,
                                      width: 100,
                                      child: RaisedButton(
                                        color: const Color(0xFF13B402),
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
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
                                ])
                                ],
                              ),
                            ),
                            elevation: 10,
                          );
                        }
                        
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
                        Container(
                        //Can use flexible error flex
                        height: MediaQuery.of(context).size.height,                    
                        child: ListView.builder(               
                          scrollDirection: Axis.vertical,
                          itemCount : _historyList.length,
                          itemBuilder: (context, index){
                              return Card( //item-1 -----------------------------------------
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:Container(
                                  // height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.circular(10),             
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [ 
                                      Align( 
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
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: _historyList[index].type,
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
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: _historyList[index].location,
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
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: "~on ${_historyList[index].dateStart.toString()}",
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
                                      //Review section
                                      Align(
                                        child: ExpansionTile( 
                                          leading: IconButton(
                                            iconSize: 30,
                                            icon: const Icon(Icons.star,
                                            color: Color(0xFF808080)),
                                            onPressed: () {},
                                          ),
                                          title: const Text(
                                            "My Review",
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
                                                
                                                  Row(
                                                    children: [  
                                                      Expanded(
                                                        child:Container(
                                                          alignment: Alignment.topLeft,
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                alignment: Alignment.topLeft,
                                                                margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
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
                                                                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                                                                child: RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: _historyList[index].comment,
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
                                                                margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                                                                child: RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: "~on ${_historyList[index].dateComment.toString()}",
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
                                                    
                                                ]
                                              )
                                            )  
                                          ],
                                        ),
                                      ),

                                      //Review section
                                      Align(
                                        child: ExpansionTile( 
                                          leading: IconButton(
                                            iconSize: 30,
                                            icon: const Icon(Icons.info,
                                            color: Color(0xFF808080)),
                                            onPressed: () {},
                                          ),
                                          title: const Text(
                                            "Detail",
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
                                                  Container(
                                                    alignment: Alignment.topLeft,
                                                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                                                    child: RichText(
                                                      text: const TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: "Period :",
                                                            style: TextStyle(
                                                              color: Color(0xFF212121),
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
                                                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: "${_historyList[index].dateStart.toString()} - ${_historyList[index].dateEnd.toString()}",
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
                                                  Container(
                                                    alignment: Alignment.topLeft,
                                                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                                                    child: RichText(
                                                      text: const TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: "Price :",
                                                            style: TextStyle(
                                                              color: Color(0xFF212121),
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
                                                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: "Rp. ${_historyList[index].price.toString()}",
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
                                                  Container(
                                                    alignment: Alignment.topLeft,
                                                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                                                    child: RichText(
                                                      text: const TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: "Driver :",
                                                            style: TextStyle(
                                                              color: Color(0xFF212121),
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
                                                        margin: const EdgeInsets.symmetric(horizontal: 30.0),
                                                        child: RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: _historyList[index].name,
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
                                                      Container(
                                                        alignment: Alignment.center,
                                                        child: RichText(
                                                          text: const TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: "Barcode :",
                                                                style: TextStyle(
                                                                  color: Color(0xFF212121),
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 16
                                                                )
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ),
                                                      Container(
                                                        alignment: Alignment.center,
                                                        child: RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: _historyList[index].barcode,
                                                                style: TextStyle(
                                                                  color: Color(0xFF212121),
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 20
                                                                )
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ),
                                                      Container(margin: const EdgeInsets.symmetric(vertical: 5.0))
                                                      
                                                    ]
                                                  )
                                                )  
                                              ],
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                    elevation: 8,
                                    margin: const EdgeInsets.all(10),
                                  );
                                }

                              )   
                        
                        ),
                      ]
                    )

                  ],
                ),
              )
            )
          )
        )
      )
    );
  }
}

//Drop down location or city.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);
  
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
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
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

class BookCarPage extends StatefulWidget {
  const BookCarPage({Key key, this.pass_idCar}) : super(key: key);

  final int pass_idCar;

  @override

  _BookCarPage createState() => _BookCarPage();
}

class _BookCarPage extends State<BookCarPage> {
  /*const _BookCarPage({Key key}) : super(key: key);*/
  var _car = carModel();
  var _carServices = carServices();

  List<carModel> _carList = <carModel>[];
  
  @override
  void initState(){
    super.initState();
    getAllCarData();
  }

  getAllCarData() async {
    _carList = <carModel>[];
    var cars = await _carServices.readCar();

    cars.forEach((car){
      if(car['id_car'] == widget.pass_idCar){
        setState((){
          var carModels = carModel();
          carModels.idCar = car['id_car'];
          carModels.plate = car['plate'];
          carModels.type = car['type'];
          carModels.carname = car['carname'];
          carModels.location = car['location'];
          carModels.price = car['price'];
          carModels.rating = car['rating'];
          carModels.driver = car['driver'];
          carModels.seat = car['seat'];
          carModels.tank = car['tank'];
          carModels.distance = car['distance'];
          carModels.desc = car['desc'];
          _carList.add(carModels);
        });
      }
    });
  }
  
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
          onPressed: () {
            // Respond to button press
          },
          icon: Image.asset("assets/images/wishlist.png"),
          color: const Color(0xFF00B0FF),
          //Wishlist icon external
          padding: const EdgeInsets.all(0.0)
        ),
        IconButton(
          icon: Icon(Icons.home, color: Color(0xFF4169E1)),
          iconSize: 40,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      //Transparent setting.
      backgroundColor: Color(0x44FFFFFF),
      elevation: 0,
    ),

      body: ListView.builder(
        itemCount : _carList.length,
        itemBuilder: (context, index){
            return Container(
            height: MediaQuery.of(context).size.height,
            transform: Matrix4.translationValues(0.0, 0.0, 0.0),
            child: Column(
              children: [
                //Text.
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), 
                    child: Image.asset('assets/images/${_carList[index].plate}.jpg'),
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
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.car_rental, 
                                size: 24,
                                color: Color(0xFF4169E1),
                              ),
                            ),
                            TextSpan(
                              text: _carList[index].carname,
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
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.star, 
                                size: 20,
                                color: Color(0xFF4169E1),
                              ),
                            ),
                            TextSpan(
                              text: _carList[index].rating.toString(),
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
                  // flex: 5, //if expanded
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Rp. ",
                          style: TextStyle(
                            color: Color(0xFF808080),
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                          )
                        ),
                        TextSpan(
                          text: _carList[index].price.toString(),
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
                const Divider(
                  height: 10,
                  thickness: 1,
                  indent: 15,
                  endIndent: 15,
                  color: Color.fromARGB(255, 185, 185, 185),
                ),
              
                Flexible(            
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
                            child: Text(
                              _carList[index].desc,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 145, 145, 145)
                              ),
                            ),
                          )
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                            child: const Text(
                              "Specification", 
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                                color: Color(0xFF808080)
                              ),
                            ),
                          )
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row (
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(Icons.person, 
                                          size: 20,
                                          color: Color(0xFF808080),
                                        ),
                                      ),
                                      TextSpan(
                                        text: "${_carList[index].seat.toString()} Seats",
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
                                    children: [
                                      WidgetSpan(
                                        child: Icon(Icons.speed, 
                                          size: 20,
                                          color: Color(0xFF808080),
                                        ),
                                      ),
                                      TextSpan(
                                        text: "${_carList[index].distance.toString()} Km",
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
                                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: ImageIcon(
                                          AssetImage("assets/images/fuel.png"),
                                          color: Color(0xFF808080),
                                          size: 18,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "${_carList[index].tank.toString()} L",
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
                        Align(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              children: [ 
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                    child: const Text(
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
                                      'assets/images/${_carList[index].driver}.jpg', width: 40),
                                    ),
                                ),
                                Expanded(                 
                                  child: Row (
                                    children: [
                                      RichText(
                                        text: TextSpan(                     
                                          text: _carList[index].driver,
                                          style: TextStyle(
                                            color: Color(0xFF4169E1),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                          )
                                        ),                              
                                      )
                                    ]
                                  )
                                )
                              ]
                            )    
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
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                      ]
                    )
                  )
                )
                

              ]
            )
          );
          
          
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (c, a1, a2) => OrderPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                final tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero);
                final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.ease,
                );

                return SlideTransition(
                  position: tween.animate(curvedAnimation),
                  child: child,
                );
              }
            ),
          );
        },
        label: const Text('Checkout'),
        backgroundColor: const Color(0xFF1F9F2F),
      ),
    );
  }
}

class BookGuidePage extends StatefulWidget {
  const BookGuidePage({Key key, this.pass_idGuide}) : super(key: key);

  final int pass_idGuide;

  @override

  _BookGuidePage createState() => _BookGuidePage();
}

class _BookGuidePage extends State<BookGuidePage> {
  //const _BookGuidePage({Key key}) : super(key: key);
  var _guide = guideModel();
  var _guideServices = guideServices();

  List<guideModel> _guideList = <guideModel>[];
  
  @override
  void initState(){
    super.initState();
    getAllGuideData();
  }

  getAllGuideData() async {
    _guideList = <guideModel>[];
    var guides = await _guideServices.readGuide();

    guides.forEach((guide){
      if(guide['id_guide'] == widget.pass_idGuide){
      setState((){
        var guideModels = guideModel();
        guideModels.idGuide = guide['id_guide'];
        guideModels.name = guide['name'];
        guideModels.price = guide['price'];
        guideModels.rating = guide['rating'];
        guideModels.customer = guide['customer'];
        guideModels.desc = guide['desc'];
        guideModels.phone = guide['phone'];
        guideModels.address = guide['address'];
        guideModels.email = guide['email'];
        _guideList.add(guideModels);
      });
    }});
  }

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
          onPressed: () {
            // Respond to button press
          },
          icon: Image.asset("assets/images/wishlist.png"),
          color: const Color(0xFF00B0FF),
          //Wishlist icon external
          padding: const EdgeInsets.all(0.0)
        ),
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

      body: ListView.builder(
        itemCount : _guideList.length,
        itemBuilder: (context, index){
          return Container(
          height: MediaQuery.of(context).size.height,
          transform: Matrix4.translationValues(0.0, 0.0, 0.0),
          child: Column(
            children: [
              //Text.
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                margin: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), 
                  child: Image.asset('assets/images/${_guideList[index].name}.jpg'),
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
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.person, 
                              size: 24,
                              color: Color(0xFF4169E1),
                            ),
                          ),
                          TextSpan(
                            text: _guideList[index].name,
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
                    transform: Matrix4.translationValues(140.0, 0.0, 0.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.star, 
                              size: 20,
                              color: Color(0xFF4169E1),
                            ),
                          ),
                          TextSpan(
                            text: _guideList[index].rating.toString(),
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
                // flex: 5, //if expanded
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Container(
                      // flex: 5, //if expanded
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: RichText(
                        text: TextSpan(
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
                              text: " ${_guideList[index].price.toString()}",
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
              const Divider(
                height: 20,
                thickness: 1,
                indent: 15,
                endIndent: 15,
                color: Color.fromARGB(255, 185, 185, 185),
              ),
        
              Flexible(            
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
                          child: Text(
                            _guideList[index].desc,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 145, 145, 145)
                            ),
                          ),
                        )
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                          child: const Text(
                            "Language", 
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: Color(0xFF808080)
                            ),
                          ),
                        )
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
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Icon(Icons.call, 
                                                  size: 20,
                                                  color: Color(0xFF808080),
                                                ),
                                              ),
                                              TextSpan(
                                                text: "+62 ${_guideList[index].phone}",
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
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Icon(Icons.location_on, 
                                                  size: 20,
                                                  color: Color(0xFF808080),
                                                ),
                                              ),
                                              TextSpan(
                                                text: _guideList[index].address,
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
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Icon(Icons.email, 
                                                  size: 20,
                                                  color: Color(0xFF808080),
                                                ),
                                              ),
                                              TextSpan(
                                                text: " ${_guideList[index].email}",
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
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ]
                  ),
                )
              )
          
            ]
          )
        );
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (c, a1, a2) => OrderPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                final tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero);
                final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.ease,
                );

                return SlideTransition(
                  position: tween.animate(curvedAnimation),
                  child: child,
                );
              }
            ),
          );
        },
        label: const Text('Checkout'),
        backgroundColor: const Color(0xFF1F9F2F),
      ),
    );
  }
}

class OrderPage extends StatelessWidget {
  const OrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: 
          IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: Text("Honda Brio RS / 2020", 
        style: TextStyle(
          color: Color(0xFF4169E1),
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
      //Transparent setting.
      backgroundColor: Color(0x44FFFFFF),
      elevation: 0,
    ),

      body: Center(
        child: Order()
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PaymentPage()),
          );
        },
        label: const Text('Order Now'),
        backgroundColor: const Color(0xFF00B0FF),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key key}) : super(key: key);

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
        title: Text("Payment", 
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
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => const NavBar(),
              ),
            );
          },
        )
      ],
      //Transparent setting.
      backgroundColor: Color(0x44FFFFFF),
      elevation: 0,
    ),

      body: Center(
        child: payment()
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  const HelpPage({Key key}) : super(key: key);

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
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => const NavBar(),
              ),
            );
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
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Login()
      ),
    );
  }
}

class CreateAccPage extends StatelessWidget {
  const CreateAccPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },
          label: const Text('Back'),
          icon: const Icon(Icons.arrow_back),
          backgroundColor: Colors.red,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Center(
        child: CreateAcc()
      ),
    );
  }
}

class ForgetPage extends StatelessWidget {
  const ForgetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },
          label: const Text('Back'),
          icon: const Icon(Icons.arrow_back),
          backgroundColor: Colors.red,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Center(
        child: forgetPass()
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

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
        title: Text("Setting", 
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
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => const NavBar(),
              ),
            );
          },
        )
      ],
      //Transparent setting.
      backgroundColor: Color(0x44FFFFFF),
      elevation: 0,
    ),

      body: Center(
        child: Setting()
      ),
    );
  }
}