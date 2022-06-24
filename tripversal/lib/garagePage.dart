import 'package:flutter/material.dart';
import 'package:tripversal/bookCarPage.dart';
import 'package:tripversal/chatPage.dart';
import 'package:tripversal/mapsPage.dart';
import 'package:tripversal/models/carModel.dart';
import 'package:tripversal/models/onGoingModel.dart';
import 'package:tripversal/services/carServices.dart';
import 'package:tripversal/services/resvServices.dart';
import 'package:tripversal/widgets/sideNav.dart';

class GaragePage extends StatefulWidget {
  const GaragePage({Key key, this.passGarage, this.passUsername}) : super(key: key);

  final String passGarage;
  final String passUsername;

  @override
  _GaragePage createState() => _GaragePage();
}

class _GaragePage extends State<GaragePage> {
  //Initial variable
  var garageName = ""; 
  var coordinateLatG = ""; 
  var coordinateLngG = "";
  int idCarGuide; 
  var price = ""; 
  var driver = ""; 
  int driver2 = 0;
  int countRev = 0;
  int vehicle = 0;
  int trip = 0;
  int idGarage = 0;

  //MVC.
  final _carServices = carServices();
  final _resvServices = resvServices();
  List<carModel> _carList = <carModel>[];
  List<carModel> _garageList = <carModel>[];
  List<onGoingModel> _onGoingList = <onGoingModel>[];

  //Get data method.
  @override
  void initState(){
    super.initState();
    getGarageData();
    getAllCarData();
    getAllHistoryData();
    getAllOnGoingData();
  }

  getAllCarData() async {
    _carList = <carModel>[];
    var cars = await _carServices.readCar();

    cars.forEach((car){
      if(car['garage_name'] == widget.passGarage){
        vehicle++;
        if(car['driver'] != 'none'){
          driver2++;
        }
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
      if(garage['garage_name'] == widget.passGarage){
        setState((){
          var garageModels = carModel();
          garageModels.idgarage = garage['id_garage'];
          idGarage = garage['id_garage'];
          garageModels.garage_name = garage['garage_name'];
          garageName = garage['garage_name'];
          garageModels.garage_phone = garage['garage_phone'];
          garageModels.garage_location = garage['garage_location'];
          garageModels.garage_email = garage['garage_email'];
          garageModels.desc = garage['garage_desc'];
          garageModels.coordinate_lan_g = garage['garage_lat'];
          coordinateLatG = garage['garage_lat'];
          garageModels.coordinate_lng_g = garage['garage_lng'];
          coordinateLngG = garage['garage_lng'];
          _garageList.add(garageModels);
        });
      }
    });
  }
  
  getAllHistoryData() async {
    var history = await _resvServices.readHistoryInGarage();

    history.forEach((history){
      if(history['id_garage'] == idGarage){
        trip++;
      }
    });
  }

  getAllOnGoingData() async {
    _onGoingList = <onGoingModel>[];
    var ongoing = await _resvServices.readOnGoingGarage();

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
                  pageBuilder: (c, a1, a2) => MapsPage(passCarguidename: garageName, passCoordinateLan: double.tryParse(coordinateLatG), passCoordinateLng: double.tryParse(coordinateLngG)),
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
                                  Text(
                                    vehicle.toString(), 
                                    style: const TextStyle(
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
                                  Text(
                                    driver2.toString(), 
                                    style: const TextStyle(
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
                                  Text(
                                    trip.toString(), 
                                    style: const TextStyle(
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
                                  pageBuilder: (c, a1, a2) => ChatPage(passGarageGuide: _garageList[index].garage_name, passUsername: widget.passUsername),
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
                     child: Container(
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
                     child: Container(
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
                     child: Container(
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
                     child: Container(
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
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child:Image.asset("assets/images/${ _carList[index].plate}.jpg", width: 150, height: 90),
                                  ),
                                ),
                                RichText(
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