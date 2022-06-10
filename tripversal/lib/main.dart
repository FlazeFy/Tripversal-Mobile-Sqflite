// ignore_for_file: prefer_const_constructors
// Kelompok 4 - SE-43-03
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tripversal/helpBody.dart';
import 'package:tripversal/loginBody.dart';
import 'package:tripversal/models/carModel.dart';
import 'package:tripversal/models/guideModel.dart';
import 'package:tripversal/models/messageModel.dart';
import 'package:tripversal/models/onGoingModel.dart';
import 'package:tripversal/models/resvModel.dart';
import 'package:tripversal/models/reviewModel.dart';
import 'package:tripversal/models/userModel.dart';
import 'package:tripversal/models/waitingModel.dart';
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
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';


Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}
void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      RentACarPage(pass_username: widget.pass_usernameNav),
      TourGuidePage(pass_username: widget.pass_usernameNav),
      MyResPage(pass_username: widget.pass_usernameNav),
      ContactPage(pass_username: widget.pass_usernameNav),
    ];
  
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
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Message',
            ),
          ],
          //Selected menu style.
          showUnselectedLabels: true,
          selectedItemColor: Color(0xFF4169E1),
          unselectedItemColor: Color(0xFF414141),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
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
  String categorySearch = 'City Car';

  List<carModel> _carList = <carModel>[];
  
  @override
  void initState(){
    super.initState();
    getAllCityCarData();
  }

  getAllCityCarData() async {
    _carList = <carModel>[];
    var cars = await _carServices.readCar();

    cars.forEach((car){
      if(car['type'] == 'City Car'){
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
          carModels.coordinate_lan = car['coordinate_lan'];
          carModels.coordinate_lng = car['coordinate_lng'];
          _carList.add(carModels);
        });
      }
    });
  }
  getAllMinibusData() async {
    _carList = <carModel>[];
    var cars = await _carServices.readCar();

    cars.forEach((car){
      if(car['type'] == 'Minibus'){
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
          carModels.coordinate_lan = car['coordinate_lan'];
          carModels.coordinate_lng = car['coordinate_lng'];
          _carList.add(carModels);
        });
      }
    });
  }
  getAllOtherData() async {
    _carList = <carModel>[];
    var cars = await _carServices.readCar();

    cars.forEach((car){
      if(car['type'] == 'Other'){
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
          carModels.coordinate_lan = car['coordinate_lan'];
          carModels.coordinate_lng = car['coordinate_lng'];
          _carList.add(carModels);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(pass_username: widget.pass_username),
      appBar: AppBar(
        iconTheme: 
        IconThemeData(
          color: Color(0xFF4169E1),
          size: 35.0,
        ),
      
      actions: [
        //Text entry search.
        Container(   
          width: MediaQuery.of(context).size.width*0.5, 
          transform: Matrix4.translationValues(-70.0, 5.0, 0.0),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal:5),
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
        IconButton(
          icon: Image.asset('assets/images/User.jpg'),
          iconSize: 50,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountPage(pass_username: widget.pass_username)),
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
                      transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                      child: MyStatefulWidget(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            transform: Matrix4.translationValues(0.0, -15.0, 0.0),
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

                        Container(
                          transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                //Button item.
                                //Button / Container color must changed when selected.
                                Container(
                                  width: 80,
                                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                                  child: RaisedButton(
                                    color: Color(0xFF4183D7),
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Icon(
                                            Icons.car_rental,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "City Car",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      getAllCityCarData();
                                      setState(() {});
                                    },
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                                  child: RaisedButton(
                                    color: Color(0xFF4183D7),
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Icon(
                                            Icons.airport_shuttle,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "Minibus",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      getAllMinibusData();
                                      setState(() {});
                                    },
                                  ),
                                ),
                                Container(
                                  width: 92,
                                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                                  child: RaisedButton(
                                    color: Color(0xFF4183D7),
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Icon(
                                            Icons.motorcycle,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "Motorcycle",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      getAllOtherData();
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ]
                            )
                          )
                        ),
                      ],
                    ),

                    //Sort by button.
                    // Container(
                    //   //Button properties.
                    //   decoration: BoxDecoration(
                    //     borderRadius : BorderRadius.circular(10),
                    //     color: Color(0xFF4169E1),
                    //     boxShadow: const [
                    //       BoxShadow(
                    //         color: Colors.grey,
                    //         spreadRadius: 1,
                    //         blurRadius: 5,
                    //         offset: Offset(0, 3)
                    //       )
                    //     ],
                    //   ),
                    //   margin: EdgeInsets.symmetric(horizontal: 10.0),
                    //   transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                      
                    //   child: PopupMenuButton( 
                    //     iconSize: 35,
                    //     icon: Icon(Icons.sort, color: Colors.white),
                    //     enabled: true,
                    //     itemBuilder: (context) => [
                    //       PopupMenuItem(
                    //         child: ListTile(
                    //           leading: IconButton(
                    //             iconSize: 30,
                    //             icon: Icon(Icons.arrow_drop_up,
                    //             color: Color(0xFF4169E1)),
                    //             onPressed: () {},
                    //           ),
                    //           title: Text('Sort by Price'),
                    //         ),
                    //       ),
                    //       PopupMenuItem(
                    //         child: ListTile(
                    //           leading: IconButton(
                    //             iconSize: 30,
                    //             icon: Icon(Icons.arrow_drop_down,
                    //             color: Color(0xFF4169E1)),
                    //             onPressed: () {},
                    //           ),
                    //           title: Text('Sort by Price'),
                    //         ),
                    //       )
                    //     ]
                    //   ),
                    // ),

                  ],
                ),
              ),

              //Car Item.
              Align(
                child: Container(
                  transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                  child: Text("Showing ${_carList.length.toString()} result...",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                        color: Color(0xFF808080)
                      ),
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10), 
                                      child:Image.asset("assets/images/${ _carList[index].plate}.jpg", width: 150),
                                    ),
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
                                                  text: "${_carList[index].price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
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
                                              pageBuilder: (c, a1, a2) => BookCarPage(pass_idCar: _carList[index].idCar, pass_username: widget.pass_username),
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
                    margin: EdgeInsets.all(5),
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
  const AccountPage({Key key, this.pass_username}) : super(key: key);
  final String pass_username;

  @override

  _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  //const AccountPage({Key key}) : super(key: key);
  var _user = userModel();
  var _userServices = userServices();
  var _fullnameCtrl = TextEditingController();
  var _idCardCtrl = TextEditingController();
  var _passwordCtrl = TextEditingController();
  var _emailCtrl = TextEditingController();
  var _phoneCtrl = TextEditingController();

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
      if(user['fullname'] == widget.pass_username){
      setState((){
        var userModels = userModel();
        userModels.idUser = user['id_user'];
        userModels.fullname = user['fullname'];
        userModels.idCard = user['id_card'].toString();
        userModels.password = user['password'];
        userModels.email = user['email'];
        userModels.phone = user['phone'];
        _userList.add(userModels);
      });
    }});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(pass_username: widget.pass_username),
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
                        enabled: false,
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
                        controller: _idCardCtrl,
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
                        controller: _passwordCtrl,
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
                        controller: _emailCtrl,
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
                        controller: _phoneCtrl,
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
                          onPressed: () async {
                            _user.idUser = _userList[index].idUser;
                            _user.fullname = _userList[index].fullname;

                            if(_idCardCtrl.text.isEmpty){
                              _user.idCard = _userList[index].idCard;
                            } else {
                              _user.idCard = _idCardCtrl.text;
                            }
                            if(_passwordCtrl.text.isEmpty){
                              _user.password = _userList[index].password;
                            } else {
                              _user.password = _passwordCtrl.text;
                            }
                            if(_emailCtrl.text.isEmpty){
                              _user.email = _userList[index].email;
                            } else {
                              _user.email = _emailCtrl.text;
                            }
                            if(_phoneCtrl.text.isEmpty){
                              _user.phone = _userList[index].phone;
                            } else {
                              _user.phone = _phoneCtrl.text;
                            }
                            
                            if((_user.password.length > 6)&&(_user.idCard.length == 16)&&(_user.phone.length > 9)&&(_user.phone.length < 14)){
                              var result = await _userServices.editAccount(_user);
                              print(result);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NavBar(pass_usernameNav: _user.fullname)),
                              );
                            } else {
                              print('Create Account Failed');
                            }
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
  const TourGuidePage({Key key, this.pass_username}) : super(key: key);
  final String pass_username;

  @override

  _TourGuidePage createState() => _TourGuidePage();
}

class _TourGuidePage extends State<TourGuidePage> {
  var _guide = guideModel();
  var _guideServices = guideServices();
  bool value = false;
  bool value1 = true;
  bool value2 = false;
  bool value3 = false;

  List<guideModel> _guideList = <guideModel>[];
  
  @override
  void initState(){
    super.initState();
    getAllGuideData_ID();
  }

  getAllGuideData_ID() async {
    _guideList = <guideModel>[];
    var guides = await _guideServices.readGuideID();

    guides.forEach((guide){
      setState((){
        var guideModels = guideModel();
        guideModels.idGuide = guide['id_guide'];
        guideModels.name = guide['name'];
        guideModels.language = guide['language'];
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
  getAllGuideData_EN() async {
    _guideList = <guideModel>[];
    var guides = await _guideServices.readGuideEN();

    guides.forEach((guide){
      setState((){
        var guideModels = guideModel();
        guideModels.idGuide = guide['id_guide'];
        guideModels.name = guide['name'];
        guideModels.language = guide['language'];
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
  getAllGuideData_ES() async {
    _guideList = <guideModel>[];
    var guides = await _guideServices.readGuideES();

    guides.forEach((guide){
      setState((){
        var guideModels = guideModel();
        guideModels.idGuide = guide['id_guide'];
        guideModels.name = guide['name'];
        guideModels.language = guide['language'];
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
      drawer: NavDrawer(pass_username: widget.pass_username),
      appBar: AppBar(
        iconTheme: 
          IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
        ),
      
      actions: [
        Container(   
          width: MediaQuery.of(context).size.width*0.5, 
          transform: Matrix4.translationValues(-70.0, 5.0, 0.0),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal:5),
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
        IconButton(
          icon: Image.asset('assets/images/User.jpg'),
          iconSize: 50,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountPage(pass_username: widget.pass_username)),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          transform: Matrix4.translationValues(0.0, -15.0, 0.0),
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
                        child: Container(
                          transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                //Language-1
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Row(
                                    children:  [
                                      Checkbox(
                                        value: this.value1,
                                        onChanged: (bool value1) {
                                          getAllGuideData_ID();
                                          setState(() {
                                            this.value1 = value1;
                                          });
                                        },
                                      ), 
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                        transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/images/indonesia.png', width: 20),
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
                                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Row(
                                    children:  [
                                      Checkbox(
                                        value: this.value2,
                                        onChanged: (bool value2) {
                                          getAllGuideData_EN();
                                          setState(() {
                                            this.value2 = value2;
                                          });
                                        },
                                      ),  
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                        transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/images/united-kingdom.png', width: 20),
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
                                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Row(
                                    children:  [
                                      Checkbox(
                                        value: this.value3,
                                        onChanged: (bool value3) {
                                          getAllGuideData_ES();
                                          setState(() {
                                            this.value3 = value3;
                                          });
                                        },
                                      ), 
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                        transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/images/spain.png', width: 20),
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
                      )
                    ]
                  ),
                  // //Sort by button.
                  // Container(
                  //   //Button properties.
                  //   decoration: BoxDecoration(
                  //     borderRadius : BorderRadius.circular(10),
                  //     color: Color(0xFF4169E1),
                  //     boxShadow: const [
                  //       BoxShadow(
                  //         color: Colors.grey,
                  //         spreadRadius: 1,
                  //         blurRadius: 5,
                  //         offset: Offset(0, 3)
                  //       )
                  //     ],
                  //   ),
                  //   margin: EdgeInsets.symmetric(horizontal: 10.0),
                  //   transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                    
                  //   child: PopupMenuButton( 
                  //     iconSize: 35,
                  //     icon: Icon(Icons.sort, color: Colors.white),
                  //     enabled: true,
                  //     itemBuilder: (context) => [
                  //       PopupMenuItem(
                  //         child: ListTile(
                  //           leading: IconButton(
                  //             iconSize: 30,
                  //             icon: Icon(Icons.arrow_drop_up,
                  //             color: Color(0xFF4169E1)),
                  //             onPressed: () {},
                  //           ),
                  //           title: Text('Sort by Price'),
                  //         ),
                  //       ),
                  //       PopupMenuItem(
                  //         child: ListTile(
                  //           leading: IconButton(
                  //             iconSize: 30,
                  //             icon: Icon(Icons.arrow_drop_down,
                  //             color: Color(0xFF4169E1)),
                  //             onPressed: () {},
                  //           ),
                  //           title: Text('Sort by Price'),
                  //         ),
                  //       )
                  //     ]
                  //   ),
                  // ),

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
                                          children: [
                                            WidgetSpan(
                                              child: Icon(Icons.message, 
                                                size: 20,
                                                color: Color(0xFF4169E1),
                                              ),
                                            ),
                                            TextSpan(
                                              text: _guideList[index].language,
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
                                                    text: "${_guideList[index].price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
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
                                        pageBuilder: (c, a1, a2) => BookGuidePage(pass_idGuide: _guideList[index].idGuide, pass_username: widget.pass_username),
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
  const MyResPage({Key key, this.pass_username}) : super(key: key);
  final String pass_username;

  @override

  _MyResPage createState() => _MyResPage();
}

class _MyResPage extends State<MyResPage> {
  var _resv = resvModel();
  var _ongoing = onGoingModel();
  var _waiting = waitingModel();
  var _resvServices = resvServices();

  List<resvModel> _historyList = <resvModel>[];
  List<onGoingModel> _onGoingList = <onGoingModel>[];
  List<waitingModel> _waitingList = <waitingModel>[];
  
  @override
  void initState(){
    super.initState();
    getAllWaitingData();
    getAllHistoryData();
    getAllOnGoingData();
  }

  getAllWaitingData() async {
    _waitingList = <waitingModel>[];
    var waiting = await _resvServices.readWaiting();

    waiting.forEach((waiting){
      setState((){
        var waitingModels = waitingModel();
        waitingModels.idWaiting = waiting['id_waiting'];
        waitingModels.idUser = waiting['id_user'];
        waitingModels.idCarGuide = waiting['id_car_guide'];
        waitingModels.type = waiting['type'];
        waitingModels.price = waiting['price'];
        waitingModels.status = waiting['status'];
        waitingModels.carname = waiting['carname'];
        waitingModels.dateStart= DateTime.tryParse(waiting['dateStart']);
        waitingModels.dateEnd= DateTime.tryParse(waiting['dateEnd']);

        _waitingList.add(waitingModels);
      });
    });
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
      drawer: NavDrawer(pass_username: widget.pass_username),
      appBar: AppBar(
        iconTheme: 
          IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
      
      actions: [
        Container(   
          width: MediaQuery.of(context).size.width*0.5, 
          transform: Matrix4.translationValues(-70.0, 5.0, 0.0),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal:5),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
              ),
              border: OutlineInputBorder(),
              hintText: 'search by car or guide name...',
              hintStyle: TextStyle(
                fontStyle: FontStyle.italic
              ),
            ),
          ),
        ),
        IconButton(
          icon: Image.asset('assets/images/User.jpg'),
          iconSize: 50,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountPage(pass_username: widget.pass_username)),
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
                    //Can use flexible error flex
                    ListView.builder(     
                      shrinkWrap: true,          
                      scrollDirection: Axis.vertical,
                      itemCount : _waitingList.length,
                      itemBuilder: (context, index){
                            
                        return Card( //item-1 -----------------------------------------
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
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: " ${_waitingList[index].carname}",
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
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: "Rp.",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        )
                                                      ),
                                                      TextSpan(
                                                        text: " ${_waitingList[index].price.toString()}",
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
                        );
                      }  
                    
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
                        //shrinkWrap: true,                  
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
                                      "${_onGoingList[index].desc} ~ end on ${DateFormat('yyyy-MM-dd – kk:mm').format(_onGoingList[index].dateEnd).toString()}",
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
                    ListView.builder(      
                      shrinkWrap: true,            
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
                                            width: MediaQuery.of(context).size.width*0.8,
                                            alignment: Alignment.topLeft,
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Container(
                                                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                                    child: Text(                     
                                                      _historyList[index].type,
                                                      style: const TextStyle(
                                                        color: Color(0xFF212121),
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 15,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),   
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Container(
                                                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                                    child: Text(                     
                                                      _historyList[index].location,
                                                      style: const TextStyle(
                                                        color: Color(0xFF808080),
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 14,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),   
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Container(
                                                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                                    child: Text(                     
                                                      "~on ${DateFormat('yyyy-MM-dd – kk:mm').format(_historyList[index].dateStart).toString()}",
                                                      style: const TextStyle(
                                                        color: Color(0xFF808080),
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 14,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),   
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          width: 80,
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
                                        SizedBox(width:5),
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
                                        iconSize: 25,
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
                                                                    text: "~on ${DateFormat('yyyy-MM-dd – kk:mm').format(_historyList[index].dateComment).toString()}",
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
                                        iconSize: 23,
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
                                                        text: "${DateFormat('yyyy-MM-dd – kk:mm').format(_historyList[index].dateStart).toString()} - ${DateFormat('yyyy-MM-dd – kk:mm').format(_historyList[index].dateEnd).toString()}",
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
                                                        text: "Rp. ${_historyList[index].price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
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
  const BookCarPage({Key key, this.pass_idCar, this.pass_username}) : super(key: key);

  final int pass_idCar;
  final String pass_username;

  @override

  _BookCarPage createState() => _BookCarPage();
}

class _BookCarPage extends State<BookCarPage> {
  /*const _BookCarPage({Key key}) : super(key: key);*/
  var _car = carModel();
  var _review = reviewModel();
  var _carServices = carServices();
  var carname; var coordinate_lan; var coordinate_lng;
  int idCarGuide; var price; var driver;

  List<carModel> _carList = <carModel>[];
  List<reviewModel> _reviewList = <reviewModel>[];
  
  @override
  void initState(){
    super.initState();
    getAllCarData();
    getAllCarReview();
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
          carname = car['carname'];
          carModels.location = car['location'];
          carModels.price = car['price'];
          price = car['price'];
          carModels.rating = car['rating'];
          carModels.driver = car['driver'];
          driver = car['driver'];
          carModels.seat = car['seat'];
          carModels.tank = car['tank'];
          carModels.distance = car['distance'];
          carModels.desc = car['desc'];
          carModels.coordinate_lan = car['coordinate_lan'];
          carModels.coordinate_lng = car['coordinate_lng'];
          coordinate_lan = car['coordinate_lan'];
          coordinate_lng = car['coordinate_lng'];
          carModels.idOwner = car['id_owner'];
          carModels.owner_name = car['owner_name'];
          carModels.owner_phone = car['owner_phone'];
          carModels.owner_location = car['owner_location'];
          carModels.owner_email = car['owner_email'];
          _carList.add(carModels);
        });
      }
    });
  }

  getAllCarReview() async {
    _reviewList = <reviewModel>[];
    var review = await _carServices.readCarwReview();

    review.forEach((review){
      if((review['id_car_guide'] == widget.pass_idCar)&&(review['type'] == 'Car Rental')){
        setState((){
          var reviewModels = reviewModel();
          reviewModels.idReview = review['id_review'];
          reviewModels.idUser = review['id_user'];
          if(review['fullname'] == widget.pass_username){
            reviewModels.fullname = 'You';
          } else {
            reviewModels.fullname = review['fullname'];
          }     
          reviewModels.idCarGuide = review['id_car_guide'];
          reviewModels.type = review['type'];
          reviewModels.comment = review['comment'];
          reviewModels.rating = review['rating'];
          reviewModels.dateReview= DateTime.tryParse(review['dateReview']);
          
          _reviewList.add(reviewModels);
        });
      }
    });
  }
  Widget getDriverImage() {
    if(driver != 'none'){
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/${driver}.jpg', width: 40),
          ),
      );
    } else {
      return SizedBox();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(pass_username: widget.pass_username),
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
          icon: Icon(Icons.map, color: Color(0xFF4169E1)),
          iconSize: 40,
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => MapsPage(pass_carguidename: carname, pass_coordinate_lan: double.tryParse(coordinate_lan), pass_coordinate_lng: double.tryParse(coordinate_lng)),
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
        ),
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
                          text: "${_carList[index].price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
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
                                  child: getDriverImage()
                                ),
                                
                                Expanded(                 
                                  child: Row (
                                    children: [
                                      RichText(
                                        text: TextSpan(                     
                                          text: _carList[index].driver,
                                          style: TextStyle(
                                            color: Color(0xFF4169E1),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
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
                                            text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  child: Icon(Icons.call, 
                                                    size: 20,
                                                    color: Color(0xFF808080),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: " ${_carList[index].owner_phone}",
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
                                                  text: " ${_carList[index].owner_location}",
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
                                                  text: " ${_carList[index].owner_email}",
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
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical:5),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: ElevatedButton.icon(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder: (c, a1, a2) => ChatPage(pass_garage_guide: _carList[index].owner_name, pass_username: widget.pass_username),
                                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                                    final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
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
                                            icon: Icon(Icons.chat, size: 18),
                                            label: Text("Chat Now"),
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1F9F2F)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5)
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
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,   
                                  itemCount : _reviewList.length,
                                  itemBuilder: (context, index){
                                          
                                  return Card( //item-1 -----------------------------------------
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
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: _reviewList[index].comment,
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
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: "~${_reviewList[index].fullname} on ${DateFormat('yyyy-MM-dd – kk:mm').format(_reviewList[index].dateReview).toString()}",
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
                                    );

                                  }  
                                )
                                
                              ],
                            )
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
              pageBuilder: (c, a1, a2) => OrderPage(pass_idCarGuide: widget.pass_idCar, pass_carguidename: carname, pass_username: widget.pass_username, pass_price: price, type: 'Car Rental'),
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
  const BookGuidePage({Key key, this.pass_idGuide, this.pass_username}) : super(key: key);

  final int pass_idGuide;
  final String pass_username;

  @override

  _BookGuidePage createState() => _BookGuidePage();
}

class _BookGuidePage extends State<BookGuidePage> {
  //const _BookGuidePage({Key key}) : super(key: key);
  var _guide = guideModel();
  var _guideServices = guideServices();
  var _review = reviewModel();
  var guideName; var price;

  List<guideModel> _guideList = <guideModel>[];
  List<reviewModel> _reviewList = <reviewModel>[];
  
  @override
  void initState(){
    super.initState();
    getAllGuideData();
    getAllGuideReview();
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
        guideName = guide['name'];
        guideModels.language = guide['language'];
        guideModels.price = guide['price'];
        price = guide['price'];
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

  getAllGuideReview() async {
    _reviewList = <reviewModel>[];
    var review = await _guideServices.readGuidewReview();

    review.forEach((review){
      if((review['id_car_guide'] == widget.pass_idGuide)&&(review['type'] == 'Tour Guide')){
        setState((){
          var reviewModels = reviewModel();
          reviewModels.idReview = review['id_review'];
          reviewModels.idUser = review['id_user'];
          if(review['fullname'] == widget.pass_username){
            reviewModels.fullname = 'You';
          } else {
            reviewModels.fullname = review['fullname'];
          }     
          reviewModels.idCarGuide = review['id_car_guide'];
          reviewModels.type = review['type'];
          reviewModels.comment = review['comment'];
          reviewModels.rating = review['rating'];
          reviewModels.dateReview= DateTime.tryParse(review['dateReview']);
          
          _reviewList.add(reviewModels);
        });
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(pass_username: widget.pass_username),
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
                              text: " ${_guideList[index].price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
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
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(Icons.message, 
                                        size: 20,
                                        color: Color(0xFF808080),
                                      ),
                                    ),
                                    TextSpan(
                                      text: _guideList[index].language,
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
                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (c, a1, a2) => ChatPage(pass_garage_guide: _guideList[index].name, pass_username: widget.pass_username),
                                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                                  final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
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
                                          icon: Icon(Icons.chat, size: 18),
                                          label: Text("Chat Now"),
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1F9F2F)),
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
                            children: [
                              ListView.builder(
                                shrinkWrap: true,   
                                itemCount : _reviewList.length,
                                itemBuilder: (context, index){
                                        
                                  return Card( //item-1 -----------------------------------------
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
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: _reviewList[index].comment,
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
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: "~${_reviewList[index].fullname} on ${DateFormat('yyyy-MM-dd – kk:mm').format(_reviewList[index].dateReview).toString()}",
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
                                  );

                                }  
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
              pageBuilder: (c, a1, a2) => OrderPage(pass_idCarGuide: widget.pass_idGuide, pass_carguidename: guideName, pass_username: widget.pass_username, pass_price: price, type: 'Tour Guide'),
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
class OrderPage extends StatefulWidget {
  const OrderPage({Key key, this.pass_username, this.pass_idCarGuide, this.pass_carguidename, this.pass_price, this.type}) : super(key: key);

  final String pass_username;
  final String pass_carguidename;
  final int pass_idCarGuide;
  final int pass_price;
  final String type;

  @override

  _OrderPage createState() => _OrderPage();
}

class _OrderPage extends State<OrderPage> {
  TimeOfDay selectedTime = TimeOfDay.now();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  getNextDay(){
    var date = new DateTime.now();
    var newDate = new DateTime(date.year, date.month, date.day + 1);
    return newDate;
  }

  int add = 0;
  getAddition(){
    if(widget.type == 'Car Rental'){
      add = 20000;
    } else {
      add = 0;
    }
    return add;
  }
  getTotal(){
    bool pickup = false; 
    int price = widget.pass_price;
    int total = 0;

    if((!pickup)&&(widget.type == 'Car Rental')){
      total = price + 5000 + getAddition();
    } else {
      total = price + 5000;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: 
          IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: Text(widget.pass_carguidename,
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
        child: Container(
        alignment: Alignment.topCenter,
        child: Flexible(
          child : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ExpansionTile( //Collapse-1 ===========================================
                  title: const Text(
                    "   Customer Detail",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF4169E1)
                    ),
                  ),
                  initiallyExpanded: true,
                  children: <Widget>[                     
                    SingleChildScrollView(               
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: <Widget>[

                        //Full name section.
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                            child: const Text(
                              "Fullname", 
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Color(0xFF212121)
                              ),
                            ),
                          ),
                        ),
                        Align(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25.0),
                            height: 35,
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                                ),
                                hintText: widget.pass_username,
                              ),
                            ),
                          ),
                        ),

                        //Phone number section.
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                            child: const Text(
                              "Phone Number", 
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Color(0xFF212121)
                              ),
                            ),
                          ),
                        ),
                        Align(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 3.0),
                            height: 35,
                            child: const TextField(
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                                ),
                            
                                hintText: '08114882001',
                              ),
                            ),
                          ),
                        ),
                        ]
                      )
                    )   
                    
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 4,
                  indent: 0,
                  endIndent: 15,
                  color: Color.fromARGB(255, 185, 185, 185),
                ),

                ExpansionTile( //Collapse-1 ===========================================
                  title: const Text(
                    "   Order Detail",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF4169E1)
                    ),
                  ),
                  initiallyExpanded: true,
                  children: <Widget>[    
                    //Date section.
                    Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                child: const Text(
                                  "Date Start", 
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xFF212121)
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                width: 90,
                                height: 35,
                                child: TextField(
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                                    ),             
                                    hintText: (DateFormat('yyyy-MM-dd').format(DateTime.now())).toString(),
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                child: const Text(
                                  "End", 
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xFF212121)
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                width: 90,
                                height: 35,
                                child: TextField(
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                                    ),             
                                    hintText: (DateFormat('yyyy-MM-dd').format(getNextDay())).toString(),
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ),
                      ]
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                        child: const Text(
                          "Pick-Up Location", 
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xFF212121)
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal:15.0, vertical: 3.0),
                            height: 45,
                            width: 30,
                            child: IconButton(
                            onPressed: () {
                                // Respond to button press
                              },
                              icon: const Icon(Icons.location_on, size: 30),
                              color: const Color(0xFF00B0FF),
                              padding: const EdgeInsets.all(0.0)
                            )
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 3.0),
                            height: 35,
                            width: MediaQuery.of(context).size.width* 0.45,
                            child: const TextField(
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                                ),
                            
                                hintText: 'Bojongsoang',
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                  child: const Text(
                                    "Time", 
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: Color(0xFF212121)
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                  width: 60,
                                  height: 35,
                                  child: TextField(
                                    onTap: () {
                                      _selectTime(context);
                                    },
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                                      ),        
                                      hintText: (DateFormat('hh:mm').format(DateTime.now())).toString(),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          ),
                        ]
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                        child: const Text(
                          "Note (Optional)", 
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xFF212121)
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                        margin: const EdgeInsets.symmetric(horizontal: 25.0),
                        height: 65,
                        child: TextFormField(
                          minLines: 10,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                            ),
                            hintText: 'Please arrive at the location five minutes early.',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width* 0.9,
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.lightGreen.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10), 
                      ),  
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                            child: const Icon(
                              Icons.info,
                              color: Colors.green,
                              size: 30.0,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width* 0.65,
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              child: const Text(
                                "Make sure the order detail is right. You can't change it in the future", 
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Color(0xFF212121)
                                ),
                              ),
                            ),
                          ),
                        ]
                      ),
                    ),
                  ]
                ),
                const Divider(
                  height: 20,
                  thickness: 4,
                  indent: 0,
                  endIndent: 15,
                  color: Color.fromARGB(255, 185, 185, 185),
                ),
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
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                                    child: const Text(
                                      "Payment Method", 
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width* 0.07),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: const PaymentMethod(),
                                  
                                ),
                              ]
                            ),
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                                    child: const Text(
                                      "Price", 
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width* 0.32),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                    child: Text(
                                      "Rp. ${widget.pass_price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}", 
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                            ),
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                    child: const Text(
                                      "Pick-up addition", 
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width* 0.15),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                    child: Text(
                                      "Rp. ${getAddition().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}", 
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                            ),
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                    child: const Text(
                                      "Tax", 
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width* 0.38),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                    child: const Text(
                                      "Rp. 5.000", 
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                            ),
                            const Divider(
                              height: 20,
                              thickness: 2,
                              indent: 20,
                              endIndent: 30,
                              color: Color.fromARGB(255, 185, 185, 185),
                            ),
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                    child: const Text(
                                      "Total", 
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width* 0.18),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                    child: Text(
                                      "Rp. ${getTotal().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}", 
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                            ),
                          ]

                        ),
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

                    ExpansionTile( //Collapse-2 ===========================================
                      leading: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.price_change,
                        color: Color(0xFF808080)),
                        onPressed: () {},
                      ),
                      title: const Text(
                        "What is pick-up addition?",
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
                        icon: const Icon(Icons.price_check,
                        color: Color(0xFF808080)),
                        onPressed: () {},
                      ),
                      title: const Text(
                        "How much the tax is charged?",
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
            )
          )
        )
      ),
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
  //Time picker
  _selectTime(BuildContext context) async {          
  final TimeOfDay timeOfDay = await showTimePicker(
    context: context,
    initialTime: selectedTime,
    initialEntryMode: TimePickerEntryMode.dial,
  );
  if(timeOfDay != null && timeOfDay != selectedTime)
    {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
class ForgetPage extends StatefulWidget {
  const ForgetPage({Key key, this.pass_usernameNav}) : super(key: key);
  final String pass_usernameNav;

  @override

  _ForgetPage createState() => _ForgetPage();
}
class _ForgetPage extends State<ForgetPage> {

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
        child: Container(
          transform: Matrix4.translationValues(0.0, 0.0, 0.0),
          child: Flexible(
            child : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  //Text.
                  SizedBox(
                    width: 250,
                    child: Image.asset('assets/images/forgotpass.gif'),
                  ),

                  //Full name section.
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                      child: const Text(
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
                      margin: const EdgeInsets.symmetric(horizontal: 25.0),
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                          ),
                      
                          hintText: widget.pass_usernameNav,
                        ),
                      ),
                    ),
                  ),

                  //Email section.
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                      child: const Text(
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
                      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 3.0),
                      height: 35,
                      child: const TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                          ),
                      
                          hintText: '',
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width* 0.9,
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10), 
                    ),  
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          child: const Icon(
                            Icons.info,
                            color: Colors.lightGreen,
                            size: 30.0,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width* 0.65,
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            child: const Text(
                              "Password must have min 8 character, Have 1 capital and 1 number.", 
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color(0xFF212121)
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                  //End of text entry section.

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: ElevatedButton(
                  
                      child: const Text('Submit'),
                      onPressed: () {
                        
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      ),
                    )
                  ),

                ]
              )
            )
          )
        ),
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

class MapsPage extends StatefulWidget {
  MapsPage({Key key, this.pass_carguidename, this.pass_coordinate_lan, this.pass_coordinate_lng}) : super(key: key);

  final String pass_carguidename;
  final double pass_coordinate_lan;
  final double pass_coordinate_lng;

  @override
  _MapsPageState createState() => _MapsPageState();
}
class _MapsPageState extends State<MapsPage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-6.913698347245817, 107.60835377374151), //Bandung
    zoom: 12, 
  );
  GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(     
      appBar: AppBar(
        iconTheme: 
          IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
          title: Text("${widget.pass_carguidename}", 
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
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
        markers: {
          if (_origin != null) _origin,
          Marker(
            markerId: const MarkerId('destination'),
            infoWindow: const InfoWindow(title: 'Destination'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            position: LatLng(widget.pass_coordinate_lan, widget.pass_coordinate_lng),
          )
        },
        onLongPress: _addMarker,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1F9F2F),
        foregroundColor: Colors.white,
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: Icon(Icons.center_focus_strong),
      )
    );
  }
  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Your Location'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
        // Reset destination
        _destination = null;
      });
    } 
  }
}

class ContactPage extends StatefulWidget {
  ContactPage({Key key, this.pass_username}) : super(key: key);
  final String pass_username;

  @override
  _ContactPageState createState() => _ContactPageState();
}
class _ContactPageState extends State<ContactPage> {
  var _contact = messageModel();
  var _carServices = carServices();

  List<messageModel> _contactList = <messageModel>[];
  
  @override
  void initState(){
    super.initState();
    getAllSocial();
  }

  getAllSocial() async {
    _contactList = <messageModel>[];
    var contact = await _carServices.readContact();

    contact.forEach((contact){
      if(contact['username'] == widget.pass_username){
      setState((){
        var messageModels = messageModel();
        messageModels.idSocial = contact['idSocial'];
        messageModels.garage_guide = contact['garage_guide'];
        messageModels.username = contact['username'];
        _contactList.add(messageModels);
      });
    
      }
    });
  
  }
  

  @override
  Widget build(BuildContext context){
    return Scaffold(     
      drawer: NavDrawer(pass_username: widget.pass_username),
      appBar: AppBar(
        iconTheme: 
        IconThemeData(
          color: Color(0xFF4169E1),
          size: 35.0,
        ),
        
        actions: [
          Container(   
            width: MediaQuery.of(context).size.width*0.5, 
            transform: Matrix4.translationValues(-70.0, 5.0, 0.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal:5),
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
          IconButton(
            icon: Image.asset('assets/images/User.jpg'),
            iconSize: 50,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage(pass_username: widget.pass_username)),
              );
            },
          )
        ],//error image blur so badly and not round yet

        //Transparent setting.
        backgroundColor: Color(0x44FFFFFF),
        elevation: 0,
      ),
      body:  SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Flexible(
              child : ListView.builder(
                shrinkWrap: true,   
                itemCount : _contactList.length,
                itemBuilder: (context, index){
                  
                  return InkWell(
                    child: Card(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                        child: Row(
                          children: [ 
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  'assets/images/garage/garage_${_contactList[index].garage_guide}.jpg', width: 50),
                              ),
                            ),
                            Expanded(                 
                              child: Column (
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      text: TextSpan(                     
                                        text: _contactList[index].garage_guide,
                                        style: TextStyle(
                                          color: Color(0xFF212121),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        )
                                      ),                              
                                    ),
                                  ),
                                  // RichText(
                                  //   text: TextSpan(                     
                                  //     text: '${_contactList[index].body}...',
                                  //     style: TextStyle(
                                  //       color: Color.fromARGB(255, 128, 128, 128),
                                  //       fontWeight: FontWeight.w400,
                                  //       fontSize: 14,
                                  //     )
                                  //   ),                              
                                  // )
                                ]
                              )
                            ),
                            // Align(
                            //   alignment: Alignment.topRight,
                            //   child: Container(
                            //     margin: const EdgeInsets.symmetric(vertical: 5.0),
                            //     child: Text(
                            //       DateFormat('yyyy-MM-dd kk:mm').format(_contactList[index].datetime).toString(), 
                            //       style: TextStyle(
                            //         fontWeight: FontWeight.w500,
                            //         fontSize: 12,
                            //         color: Color(0xFF808080)
                            //       ),
                            //     ),
                            //   )
                            // ), 
                          ]
                        )    
                      )
                    ),
                    onTap: () { 
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatPage(pass_garage_guide: _contactList[index].garage_guide, pass_username: widget.pass_username)),
                      );
                    },                   
                  );
              
                }
              )
            )
            
          ],
        ) 
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1F9F2F),
        foregroundColor: Colors.white,
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => ),
          // );
        },
        child: Icon(Icons.send),
      )
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({key, this.pass_garage_guide, this.pass_username}) : super(key: key);
  final String pass_garage_guide;
  final String pass_username;

  @override

  _ChatPage createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  var _message = messageModel();
  var _carServices = carServices();
  final _messageTextCtrl = TextEditingController();
  var type;

  List<messageModel> _messageList = <messageModel>[];
  
  @override
  void initState(){
    super.initState();
    getAllMessage();
  }

  //Get all message for car & guide
  getAllMessage() async {
    _messageList = <messageModel>[];
    var messages = await _carServices.readMessage();

    messages.forEach((message){
      if(((message['sender'] == widget.pass_username)&&(message['receiver'] == widget.pass_garage_guide))||((message['sender'] == widget.pass_garage_guide)&&(message['receiver'] == widget.pass_username))){
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
          IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
          title: Text(widget.pass_garage_guide, 
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
                context,
                MaterialPageRoute(builder: (context) => NavBar(pass_usernameNav: widget.pass_username)),
              );
            },
          )
        ],
        //Transparent setting.
        backgroundColor: Color(0x44FFFFFF),
        elevation: 0,
      ),

      //Body.
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            //Text.
            Flexible(
              child: ListView.builder(
                itemCount : _messageList.length,
                itemBuilder: (context, index){
                  if(_messageList[index].sender == widget.pass_username){
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
                            child: Text(
                              _messageList[index].body,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical:2),
                            child: Text(DateFormat('yyyy-MM-dd kk:mm').format(_messageList[index].datetime).toString(),
                              style: const TextStyle(color: Colors.grey, fontSize:14))
                          )
                        )
                      ]
                    );
                  } else if (_messageList[index].receiver == widget.pass_username){
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
                            child: Text(
                              _messageList[index].body,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical:2),
                            child: Text(DateFormat('yyyy-MM-dd kk:mm').format(_messageList[index].datetime).toString(),
                              style: const TextStyle(color: Colors.grey, fontSize:14))
                          )
                        )
                      ]
                    );
                  }
                  //End of card.
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
                      onPressed: () async{
                        var dt = DateTime.now();

                        // String
                        var dtStr = dt.toIso8601String();
                        dt = DateTime.tryParse(dtStr);
                        _message.sender = widget.pass_username;
                        _message.receiver = widget.pass_garage_guide;
                        _message.type = type;
                        _message.body = _messageTextCtrl.text;
                        _message.imageURL = 'null'; //for now
                        _message.datetime = dt;

                        var result = await _carServices.sendMessage(_message);
                        print(result);
                        if(result != null){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChatPage(pass_garage_guide: widget.pass_garage_guide, pass_username: widget.pass_username)),
                          );
                        } else {

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
      )
    );
  }
}

//Drop down location or city.
class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key key}) : super(key: key);
  
  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String dropdownValue = 'Transfer Mandiri';

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
        color: const Color(0xFF4169E1),
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>["Transfer Mandiri", "Transfer BNI", "Transfer BRI", "Link Aja", "Ovo", "Dana"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}