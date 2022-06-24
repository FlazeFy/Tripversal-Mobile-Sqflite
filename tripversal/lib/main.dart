import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tripversal/bookCarPage.dart';
import 'package:tripversal/bookGuidePage.dart';
import 'package:tripversal/loginBody.dart';
import 'package:tripversal/mapsPage.dart';
import 'package:tripversal/models/carModel.dart';
import 'package:tripversal/models/guideModel.dart';
import 'package:tripversal/models/messageModel.dart';
import 'package:tripversal/models/onGoingModel.dart';
import 'package:tripversal/models/resvModel.dart';
import 'package:tripversal/models/waitingModel.dart';
import 'package:tripversal/services/guideServices.dart';
import 'package:tripversal/services/resvServices.dart';
import 'package:tripversal/services/userServices.dart';
import 'package:tripversal/services/carServices.dart';
import 'package:tripversal/widgets/sideNav.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'createAccBody.dart';
import 'package:flutter/services.dart';
import 'package:tripversal/accountPage.dart';
import 'package:tripversal/chatPage.dart';
import 'package:get/get.dart';

//Global variabel.
String passUsername;
int passIdUser;
DateTime dateStart;
DateTime dateEnd;
String paymentMethod = "Transfer Mandiri";
String activeTheme = "Light";

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}
void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);

  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   
   return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kelompok 4 - SE-43-03',
      darkTheme: ThemeData.dark(),
      home: const LoginPage(),
    );
  }
}
class NavBar extends StatefulWidget {
  const NavBar({Key key}) : super(key: key);
  
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  final _userServices = userServices();

  //Get data method.
  @override
  void initState(){
    super.initState();
    getAllUserData();
  }

  getAllUserData() async {
    var users = await _userServices.readUser();

    users.forEach((user){
      if(user['fullname'] == passUsername){
      setState((){
        passIdUser = user['id_user'];
      });
    }});
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      RentACarPage(passUsername: passUsername),
      TourGuidePage(passUsername: passUsername),
      MyResPage(passUsername: passUsername),
      ContactPage(pass_username: passUsername),
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
          selectedItemColor: const Color(0xFF4169E1),
          unselectedItemColor: const Color(0xFF414141),
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
  const RentACarPage({Key key, this.passUsername}) : super(key: key);

  final String passUsername;

  @override

  _RentACarPage createState() => _RentACarPage();
}

class _RentACarPage extends State<RentACarPage> {
  //Intial variable.
  String categorySearch = 'City Car';

  //MVC.
  final _carServices = carServices();
  List<carModel> _carList = <carModel>[];
  List<carModel> _garageList = <carModel>[];
  
  //Get data.
  @override
  void initState(){
    super.initState();
    getAllCityCarData();
    getGarageData();
  }
  getGarageData() async {
    _garageList = <carModel>[];
    var garage = await _carServices.readGarage();

    garage.forEach((garage){
      setState((){
        var garageModels = carModel();
        garageModels.idgarage = garage['id_garage'];
        garageModels.garage_name = garage['garage_name'];
        _garageList.add(garageModels);
      });
    });
  }
  
  getAllCityCarData() async {
    _carList = <carModel>[];
    var cars = await _carServices.readCar();

    cars.forEach((car){
      if(car['type'] == 'City Car'){
        setState((){
          var carModels = carModel();
          carModels.idCar = car['id_car'];
          carModels.carname = car['carname'];
          carModels.plate = car['plate'];
          carModels.location = car['location'];
          carModels.price = car['price'];
          carModels.rating = car['rating'];
          carModels.driver = car['driver'];
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
          carModels.carname = car['carname'];
          carModels.plate = car['plate'];
          carModels.location = car['location'];
          carModels.price = car['price'];
          carModels.rating = car['rating'];
          carModels.driver = car['driver'];
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
          carModels.carname = car['carname'];
          carModels.plate = car['plate'];
          carModels.location = car['location'];
          carModels.price = car['price'];
          carModels.rating = car['rating'];
          carModels.driver = car['driver'];
          _carList.add(carModels);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF4169E1),
          size: 35.0,
        ),
        actions: [
          Container(   
            width: MediaQuery.of(context).size.width*0.5, 
            transform: Matrix4.translationValues(-70.0, 5.0, 0.0),
            child: const TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal:5),
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
                MaterialPageRoute(builder: (context) => AccountPage(passUsername: widget.passUsername)),
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
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                transform: Matrix4.translationValues(0.0, 5.0, 0.0),
                child: const Text(
                  "Location", 
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: Color(0xFF808080)
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                    child: const MyStatefulWidget(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                          child: const Text(
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
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              //Button item.
                              //Button / Container color must changed when selected.
                              Container(
                                width: 85,
                                margin: const EdgeInsets.symmetric(horizontal: 3.0),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(const Color(0xFF4183D7)),
                                    padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Icon(
                                          Icons.car_rental,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
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
                                    //Get data method.
                                    getAllCityCarData();
                                    setState(() {});
                                  },
                                ),
                              ),
                              Container(
                                width: 85,
                                margin: const EdgeInsets.symmetric(horizontal: 3.0),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(const Color(0xFF4183D7)),
                                    padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Icon(
                                          Icons.airport_shuttle,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
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
                                    //Get data method.
                                    getAllMinibusData();
                                    setState(() {});
                                  },
                                ),
                              ),
                              Container(
                                width: 85,
                                margin: const EdgeInsets.symmetric(horizontal: 3.0),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(const Color(0xFF4183D7)),
                                    padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Icon(
                                          Icons.motorcycle,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Text(
                                          "Other",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    //Get data method.
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
                ],
              ),
            ),

            Container(
              transform: Matrix4.translationValues(0.0, -10.0, 0.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                leading: IconButton(
                  iconSize: 30,
                  icon: const Icon(Icons.warehouse,
                  color: Color(0xFF808080)),
                  onPressed: () {},
                ),
                title: const Text('View Garage'),
                subtitle: const Text('see available car in specific garage', 
                  style: TextStyle(
                    color: Color(0xFF808080),
                  ),
                ),
                children: <Widget>[
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount : _garageList.length,
                      itemBuilder: (context, index){
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => GaragePage(pass_garage: _garageList[index].garage_name, pass_username: widget.passUsername),
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
                          child:Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 2),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(65),
                                    child: Image.asset('assets/images/garage/garage_${_garageList[index].garage_name}.jpg', width:65, height:65),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(65), 
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
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(                     
                                    _garageList[index].garage_name,
                                    style: const TextStyle(
                                      color: Color(0xFF4183D7),
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),             
                                ),
                              ],
                            ),
                          ),
                        );

                      }
                    )
                  )
                  
                ],
              ),
            ),

            Container(
              transform: Matrix4.translationValues(0.0, -5.0, 0.0),
              child: Text("Showing ${_carList.length.toString()} result...",
                style: const TextStyle(
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
                            padding: const EdgeInsets.all(10),
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
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Driver", 
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14,
                                            color: Color(0xFF4169E1)
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                          child: Text(
                                            _carList[index].driver, 
                                            style: const TextStyle(
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
                                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                                  alignment: Alignment.topLeft,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        const WidgetSpan(
                                          child: Icon(Icons.car_rental,   
                                            size: 20,
                                            color: Color(0xFF4169E1),
                                          ),
                                        ),
                                        TextSpan(
                                          text: _carList[index].carname, 
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                          )
                                        ),
                                      ],
                                    ),
                                  )
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        const WidgetSpan(
                                          child: Icon(Icons.location_on, 
                                            size: 20,
                                            color: Color(0xFF4169E1),
                                          ),
                                        ),
                                        TextSpan(
                                          text: _carList[index].location, 
                                          style: const TextStyle(
                                            color: Color(0xFF808080),
                                            fontWeight: FontWeight.w700,
                                          )
                                        ),
                                      ],
                                    ),
                                  )
                                ),

                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        // flex: 5, //if expanded
                                        alignment: Alignment.topLeft,
                                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: "Rp. ",
                                                style: TextStyle(
                                                  color: Color(0xFF808080),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                )
                                              ),
                                              TextSpan(
                                                text: _carList[index].price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                )
                                              ),
                                              const TextSpan(
                                                text: " / Day",
                                                style: TextStyle(
                                                  color: Color(0xFF808080),
                                                  fontSize: 16,
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
                                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            const WidgetSpan(
                                              child: Icon(Icons.star, 
                                                size: 20,
                                                color: Color(0xFF4169E1),
                                              ),
                                            ),
                                            TextSpan(
                                              text: _carList[index].rating.toString(), 
                                              style: const TextStyle(
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
                                            pageBuilder: (c, a1, a2) => BookCarPage(passIdCar: _carList[index].idCar, passUsername: widget.passUsername),
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
                                      icon: const Icon(Icons.arrow_forward, size: 18),
                                      label: const Text("Book now"),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF1F9F2F)),
                                      ),
                                    ),
                                    const SizedBox(width: 8,),
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
                  margin: const EdgeInsets.all(5),
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

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: 
          const IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: const Text("About", 
        style: TextStyle(
          color: Color(0xFF4169E1),
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
      
      //Transparent setting.
      backgroundColor: const Color(0x44FFFFFF),
      elevation: 0,
    ),

      body: Center(
        child: Column(
          children: [
            const Align(
              child: Icon(
                Icons.travel_explore,
                color: Color(0xFF4169E1),
                size: 100.0,
              ),     
            ),
            //Bug fontfamily not working.
            const Align(
              child: Text('tripversal',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  fontFamily: 'FuturaMediumBT',
                  color: Color(0xFF4169E1)
                ),
              ),
            ),
            const Text('-The joy of trip-',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontSize: 15,
                fontFamily: 'FuturaMediumBT',
                color: Color(0xFF4169E1)
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: const Text('Tripversal is an application that will help you travel around Indonesia. With Tripversal you can rent a various of vehicle like citycar, minibus, motorcycle, even a bus. Not only that, you can also rent a tour guide with various spoken language. Our vehicle and guide are trusted and will help you through the day. So dont hesitate and book now to get a trip that will never be forgotten.',
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
  const TourGuidePage({Key key, this.passUsername}) : super(key: key);
  final String passUsername;

  @override

  _TourGuidePage createState() => _TourGuidePage();
}

class _TourGuidePage extends State<TourGuidePage> {
  //Initial value
  bool value = false;
  bool value1 = true;
  bool value2 = false;
  bool value3 = false;

  //MVC.
  final _guideServices = guideServices();
  List<guideModel> _guideList = <guideModel>[];
  
  //Get data method.
  @override
  void initState(){
    super.initState();
    getAllGuideDataID();
  }

  getAllGuideDataID() async {
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
        _guideList.add(guideModels);
      });
    });
  }
  getAllGuideDataEN() async {
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
        _guideList.add(guideModels);
      });
    });
  }
  getAllGuideDataES() async {
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
        _guideList.add(guideModels);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        iconTheme: 
          const IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
        ),
      
        actions: [
          Container(   
            width: MediaQuery.of(context).size.width*0.5, 
            transform: Matrix4.translationValues(-70.0, 5.0, 0.0),
            child: const TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal:5),
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
                MaterialPageRoute(builder: (context) => AccountPage(passUsername: widget.passUsername)),
              );
            },
          )
        ],
        backgroundColor: const Color(0x44FFFFFF),
        elevation: 0,
      ),

      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                transform: Matrix4.translationValues(0.0, 5.0, 0.0),
                child: const Text(
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
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                    child: const MyStatefulWidget(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                          child: const Text(
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
                                        value: value1,
                                        onChanged: (bool value1) {
                                          getAllGuideDataID();
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
                                    color: const Color(0xFF4169E1),
                                  ),
                                ),
                                
                                //Language-2
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Row(
                                    children:  [
                                      Checkbox(
                                        value: value2,
                                        onChanged: (bool value2) {
                                          getAllGuideDataEN();
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
                                    color: const Color(0xFF4169E1),
                                  ),
                                ),

                                //Language-3
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Row(
                                    children:  [
                                      Checkbox(
                                        value: value3,
                                        onChanged: (bool value3) {
                                          getAllGuideDataES();
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
                                    color: const Color(0xFF4169E1),
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
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                //transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                child: const Text(
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
                style: const TextStyle(
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
                      child:SizedBox(
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
                                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                                      alignment: Alignment.topLeft,
                                      child: Row (
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                const WidgetSpan(
                                                  child: Icon(Icons.person, 
                                                    size: 20,
                                                    color: Color(0xFF4169E1),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: _guideList[index].name,
                                                  style: const TextStyle(
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
                                                  const WidgetSpan(
                                                    child: Icon(Icons.star, 
                                                      size: 20,
                                                      color: Color(0xFF4169E1),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: _guideList[index].rating.toString(),
                                                    style: const TextStyle(
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
                                            const WidgetSpan(
                                              child: Icon(Icons.message, 
                                                size: 20,
                                                color: Color(0xFF4169E1),
                                              ),
                                            ),
                                            TextSpan(
                                              text: _guideList[index].language,
                                              style: const TextStyle(
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
                                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            // flex: 5, //if expanded
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.symmetric(horizontal: 25.0),
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  const TextSpan(
                                                    text: "Rp. ",
                                                    style: TextStyle(
                                                      color: Color(0xFF808080),
                                                      fontSize: 21,
                                                      fontWeight: FontWeight.w700,
                                                    )
                                                  ),
                                                  TextSpan(
                                                    text: _guideList[index].price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w700,
                                                    )
                                                  ),
                                                  const TextSpan(
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
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (c, a1, a2) => BookGuidePage(passIdGuide: _guideList[index].idGuide, passUsername: widget.passUsername),
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
                                  icon: const Icon(Icons.arrow_forward, size: 25),
                                  color: Colors.white,
                                )
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFF1F9F2F),
                              ),
                            )
                          ],
                        ),
                      ),
                      elevation: 8,
                      margin: const EdgeInsets.all(6),
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
  const MyResPage({Key key, this.passUsername}) : super(key: key);
  final String passUsername;

  @override

  _MyResPage createState() => _MyResPage();
}

class _MyResPage extends State<MyResPage> {
  final _resvServices = resvServices();
  final _userServices = userServices();

  List<resvModel> _historyList = <resvModel>[];
  List<onGoingModel> _onGoingList = <onGoingModel>[];
  List<waitingModel> _waitingList = <waitingModel>[];
  
  @override
  void initState(){
    super.initState();
    getAllWaitingData();
    getAllWaitingDataGuide();
    getAllHistoryData();
    getAllOnGoingData();
    getAllUserData();
  }
  getAllUserData() async {
    var users = await _userServices.readUser();

    users.forEach((user){
      if(user['fullname'] == widget.passUsername){
      setState((){
        passIdUser = user['id_user'];
      });
    }});
  }

  getAllWaitingData() async {
    _waitingList = <waitingModel>[];
    var waiting = await _resvServices.readWaiting();

    waiting.forEach((waiting){
      if(waiting['type'] == 'Car Rental'){
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
      }
    });
  }
  getAllWaitingDataGuide() async {
    _waitingList = <waitingModel>[];
    var waiting = await _resvServices.readWaitingTG();

    waiting.forEach((waiting){
      if(waiting['type'] == 'Tour Guide'){
      setState((){
        var waitingModels = waitingModel();
        waitingModels.idWaiting = waiting['id_waiting'];
        waitingModels.idUser = waiting['id_user'];
        waitingModels.idCarGuide = waiting['id_car_guide'];
        waitingModels.type = waiting['type'];
        waitingModels.price = waiting['price'];
        waitingModels.status = waiting['status'];
        waitingModels.carname = waiting['name'];
        waitingModels.dateStart= DateTime.tryParse(waiting['dateStart']);
        waitingModels.dateEnd= DateTime.tryParse(waiting['dateEnd']);

        _waitingList.add(waitingModels);
      });
      }
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
      drawer: const NavDrawer(),
      appBar: AppBar(
        iconTheme: 
          const IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
      
      actions: [
        Container(   
          width: MediaQuery.of(context).size.width*0.5, 
          transform: Matrix4.translationValues(-70.0, 5.0, 0.0),
          child: const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal:5),
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
              MaterialPageRoute(builder: (context) => AccountPage(passUsername: widget.passUsername)),
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
                                                  style: const TextStyle(
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
                                                      const TextSpan(
                                                        text: "Rp.",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        )
                                                      ),
                                                      TextSpan(
                                                        text: " ${_waitingList[index].price.toString()}",
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 22,
                                                          fontWeight: FontWeight.bold
                                                        )
                                                      ),
                                                      const TextSpan(
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
                                      //
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
                      margin: const EdgeInsets.symmetric(horizontal: 5), 
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
                                    title: Text(_onGoingList[index].type, style: const TextStyle(fontWeight: FontWeight.w800)),
                                    subtitle: Text(
                                      "${_onGoingList[index].desc} ~ end on ${DateFormat('yyyy-MM-dd – kk:mm').format(_onGoingList[index].dateEnd).toString()}",
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(vertical : 3), 
                                    child: Image.asset('assets/images/D 1670 VZB.jpg', width: 180),
                                  ),
                                  const Align(
                                    
                                  ),
                                  Row(
                                  children:[ 
                                    Container(
                                      height: 40,
                                      width: 90, 
                                      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical : 10), 
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
                                    SizedBox(
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
                                        SizedBox(
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
                                        const SizedBox(width:5),
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
                                                                    style: const TextStyle(
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
                                                                    style: const TextStyle(
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
                                                        style: const TextStyle(
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
                                                        style: const TextStyle(
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
                                                            style: const TextStyle(
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
                                                            style: const TextStyle(
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
        color: const Color(0xFF4169E1),
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
  const ForgetPage({Key key, this.passUsernameNav}) : super(key: key);
  final String passUsernameNav;

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
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                          ),
                      
                          hintText: passUsername,
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

class ContactPage extends StatefulWidget {
  const ContactPage({Key key, this.pass_username}) : super(key: key);
  final String pass_username;

  @override
  _ContactPageState createState() => _ContactPageState();
}
class _ContactPageState extends State<ContactPage> {
  //final _contact = messageModel();
  final _carServices = carServices();

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
      drawer: const NavDrawer(),
      appBar: AppBar(
        iconTheme: 
        const IconThemeData(
          color: Color(0xFF4169E1),
          size: 35.0,
        ),
        
        actions: [
          Container(   
            width: MediaQuery.of(context).size.width*0.5, 
            transform: Matrix4.translationValues(-70.0, 5.0, 0.0),
            child: const TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal:5),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                ),
                border: OutlineInputBorder(),
                hintText: 'search by garage or guide...',
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
                MaterialPageRoute(builder: (context) => AccountPage(passUsername: widget.pass_username)),
              );
            },
          )
        ],

        //Transparent setting.
        backgroundColor: const Color(0x44FFFFFF),
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
                                        style: const TextStyle(
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
                        MaterialPageRoute(builder: (context) => ChatPage(passGarageGuide: _contactList[index].garage_guide, passUsername: widget.pass_username)),
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
        backgroundColor: const Color(0xFF1F9F2F),
        foregroundColor: Colors.white,
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => ),
          // );
        },
        child: const Icon(Icons.send),
      )
    );
  }
}

class GaragePage extends StatefulWidget {
  const GaragePage({Key key, this.pass_garage, this.pass_username}) : super(key: key);

  final String pass_garage;
  final String pass_username;

  @override

  _GaragePage createState() => _GaragePage();
}

class _GaragePage extends State<GaragePage> {
  final _carServices = carServices();
  var garagename; var coordinate_lat_g; var coordinate_lng_g;
  int idCarGuide; var price; var driver; int countRev = 0;

  List<carModel> _carList = <carModel>[];
  List<carModel> _garageList = <carModel>[];
  
  @override
  void initState(){
    super.initState();
    getGarageData();
    getAllCarData();
  }
  getAllCarData() async {
    _carList = <carModel>[];
    var cars = await _carServices.readCar();

    cars.forEach((car){
      if(car['garage_name'] == widget.pass_garage){
        setState((){
          var carModels = carModel();
          carModels.idCar = car['id_car'];
          carModels.plate = car['plate'];
          carModels.type = car['type'];
          carModels.carname = car['carname'];
          carModels.location = car['location'];
          carModels.price = car['price'];
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
  getGarageData() async {
    _garageList = <carModel>[];
    var garage = await _carServices.readGarage();

    garage.forEach((garage){
      if(garage['garage_name'] == widget.pass_garage){
        setState((){
          var garageModels = carModel();
          garageModels.idgarage = garage['id_garage'];
          garageModels.garage_name = garage['garage_name'];
          garagename = garage['garage_name'];
          garageModels.garage_phone = garage['garage_phone'];
          garageModels.garage_location = garage['garage_location'];
          garageModels.garage_email = garage['garage_email'];
          garageModels.desc = garage['garage_desc'];
          garageModels.coordinate_lan_g = garage['garage_lat'];
          coordinate_lat_g = garage['garage_lat'];
          garageModels.coordinate_lng_g = garage['garage_lng'];
          coordinate_lng_g = garage['garage_lng'];
          _garageList.add(garageModels);
        });
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        iconTheme: 
          const IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: const Text("Book Car", 
        style: TextStyle(
          color: Color(0xFF4169E1),
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
      
      actions: [
        IconButton(
          icon: const Icon(Icons.map, color: Color(0xFF4169E1)),
          iconSize: 40,
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => MapsPage(passCarguidename: garagename, passCoordinateLan: double.tryParse(coordinate_lat_g), passCoordinateLng: double.tryParse(coordinate_lng_g)),
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
        ),
        IconButton(
          icon: const Icon(Icons.home, color: Color(0xFF4169E1)),
          iconSize: 40,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      //Transparent setting.
      backgroundColor: const Color(0x44FFFFFF),
      elevation: 0,
    ),

      body: ListView.builder(
        itemCount : _garageList.length,
        itemBuilder: (context, index){
            return Container(
            height: MediaQuery.of(context).size.height,
            transform: Matrix4.translationValues(0.0, 0.0, 0.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 160,
                      margin: const EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80), 
                        child: Image.asset('assets/images/garage/garage_${_garageList[index].garage_name}.jpg'),
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
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [           
                          Text(
                            _garageList[index].garage_name, 
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Color(0xFF212121)
                            ),
                          ),
                          const SizedBox(height:10),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Vehicle", 
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xFF808080)
                                    ),
                                  ),
                                  const Text(
                                    "2", 
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Color(0xFF414141)
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width:15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Driver", 
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xFF808080)
                                    ),
                                  ),
                                  const Text(
                                    "2", 
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Color(0xFF414141)
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width:15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Trip", 
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xFF808080)
                                    ),
                                  ),
                                  const Text(
                                    "2", 
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Color(0xFF414141)
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (c, a1, a2) => ChatPage(passGarageGuide: _garageList[index].garage_name, passUsername: widget.pass_username),
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
                            icon: const Icon(Icons.chat, size: 18),
                            label: const Text("Chat Now"),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF1F9F2F)),
                            ),
                          ),
                        ],
                      )
                    )
                  ],
                ),   
                Row(
                  children: <Widget>[
                    Expanded(
                     child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        color: Colors.grey,
                        thickness: 1.5,
                        height: 5,
                      )),
                    ),       
                    const Text(
                      "About Us", 
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF414141)
                      ),
                    ),    
                    Expanded(
                     child: new Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        color: Colors.grey,
                        thickness: 1.5,
                        height: 5,
                      )),
                    ),
                  ]
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    _garageList[index].desc, 
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                     child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        color: Colors.grey,
                        thickness: 1.5,
                        height: 5,
                      )),
                    ),       
                    const Text(
                      "Other Vehicle", 
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF414141)
                      ),
                    ),    
                    Expanded(
                     child: new Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        color: Colors.grey,
                        thickness: 1.5,
                        height: 5,
                      )),
                    ),
                  ]
                ),
                Flexible(
                  child: SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount : _carList.length,
                      itemBuilder: (context, index){
                        return Card(
                          child:Container(
                            padding: const EdgeInsets.all(10),
                            width: 160,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    child: Text(                     
                                      _carList[index].carname,
                                      style: const TextStyle(
                                        color: Color(0xFF4183D7),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),   
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child:Image.asset("assets/images/${ _carList[index].plate}.jpg", width: 150, height: 90),
                                  ),
                                ),
                                Container(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: "Rp. ",
                                          style: TextStyle(
                                            color: Color(0xFF808080),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          )
                                        ),
                                        TextSpan(
                                          text: _carList[index].price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          )
                                        ),
                                        const TextSpan(
                                          text: " / Day",
                                          style: TextStyle(
                                            color: Color(0xFF808080),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          )
                                        ),
                                      ],
                                    ),
                                  )
                                ),
                                   
                                const SizedBox(height: 5,),
                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children:[
                                      const Text(
                                        "Driver", 
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14,
                                          color: Color(0xFF4169E1)
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                        child: Text(
                                          _carList[index].driver, 
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                            color: Color(0xFF808080)
                                          ),
                                        ),
                                      ),
                                    ] 
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (c, a1, a2) => BookCarPage(passIdCar: _carList[index].idCar, passUsername: widget.pass_username),
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
                                  icon: const Icon(Icons.arrow_forward, size: 18),
                                  label: const Text("Book now"),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF1F9F2F)),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white, 
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 10.0, // soften the shadow
                                  spreadRadius: 0.0, //extend the shadow
                                  offset: const Offset(
                                    5.0, // Move to right 10  horizontally
                                    5.0, // Move to bottom 10 Vertically
                                  ),
                                )
                              ],
                            ),
                          )
                        );
                      }
                    )
                  )
                )
                
              ]
            ),
          );
          
          
        }
      ),
    );
  }
}