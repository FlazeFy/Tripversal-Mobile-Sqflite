import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tripversal/chatPage.dart';
import 'package:tripversal/garagePage.dart';
import 'package:tripversal/mapsPage.dart';
import 'package:tripversal/models/carModel.dart';
import 'package:tripversal/models/reviewModel.dart';
import 'package:tripversal/orderPage.dart';
import 'package:tripversal/services/carServices.dart';
import 'package:tripversal/widgets/sideNav.dart';

class BookCarPage extends StatefulWidget {
  const BookCarPage({Key key, this.passIdCar, this.passUsername}) : super(key: key);

  final int passIdCar;
  final String passUsername;

  @override

  _BookCarPage createState() => _BookCarPage();
}

class _BookCarPage extends State<BookCarPage> {
  //Initial variable for outside widget build.
  var carname = ""; 
  var coordinateLan = ""; 
  var coordinateLng = ""; 
  var garageName = "";
  int idCarGuide = 0; 
  int price = 0; 
  var driver = "";
  int countRev = 0;

  //MVC.
  final _carServices = carServices();
  List<carModel> _carList = <carModel>[];
  List<reviewModel> _reviewList = <reviewModel>[];
  
  //Get data method.
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
      if(car['id_car'] == widget.passIdCar){
        setState((){
          var carModels = carModel();
          carModels.idCar = car['id_car'];
          carModels.plate = car['plate'];
          carModels.type = car['type'];
          carname = car['carname'];
          carModels.location = car['location'];
          price = car['price'];
          carModels.rating = car['rating'];
          driver = car['driver'];
          carModels.seat = car['seat'];
          carModels.tank = car['tank'];
          carModels.distance = car['distance'];
          carModels.desc = car['desc'];
          coordinateLan = car['coordinate_lan'];
          coordinateLng = car['coordinate_lng'];
          carModels.idgarage = car['id_garage'];
          garageName = car['garage_name'];
          carModels.garage_phone = car['garage_phone'];
          carModels.garage_location = car['garage_location'];
          carModels.garage_email = car['garage_email'];
          _carList.add(carModels);
        });
      }
    });
  }

  getAllCarReview() async {
    _reviewList = <reviewModel>[];
    var review = await _carServices.readCarwReview();

    review.forEach((review){
      if((review['id_car_guide'] == widget.passIdCar)&&(review['type'] == 'Car Rental')){
        countRev++;
        setState((){
          var reviewModels = reviewModel();
          reviewModels.idReview = review['id_review'];
          reviewModels.idUser = review['id_user'];
          if(review['fullname'] == widget.passUsername){
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
    if(driver != "none"){
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/$driver.jpg', width: 40),
          ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget getMessageReview() {
    if(countRev == 0){
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical:5),
        child: Column(
          children: [
            ClipRRect(
            child: Image.asset(
              'assets/images/icon/Empty2.png', width: 200),
            ),
            const Text(
              "There's no review for this car", 
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ],
        ),
         
      );
    } else {
      return const SizedBox();
    }
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
                pageBuilder: (c, a1, a2) => MapsPage(passCarguidename: carname, passCoordinateLan: double.tryParse(coordinateLan), passCoordinateLng: double.tryParse(coordinateLng)),
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
          icon: const Icon(Icons.warehouse, color: Color(0xFF4169E1)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GaragePage(passGarage: garageName, passUsername: widget.passUsername)),
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
        itemCount : _carList.length,
        itemBuilder: (context, index){
            return Container(
            height: MediaQuery.of(context).size.height,
            transform: Matrix4.translationValues(0.0, 0.0, 0.0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), 
                    child: Image.asset('assets/images/${_carList[index].plate}.jpg'),
                  ),
                ),
                Row (
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      width: MediaQuery.of(context).size.width*0.55, 
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const WidgetSpan(
                              child: Icon(Icons.car_rental, 
                                size: 24,
                                color: Color(0xFF4169E1),
                              ),
                            ),
                            TextSpan(
                              text: carname,
                              style: const TextStyle(
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
                    )
                  ]
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
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
                          text: price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                          style: const TextStyle(
                            color: Color(0xFF4169E1),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          )
                        ),
                        const TextSpan(
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
                Flexible(            
                  child : SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
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
                              "Description", 
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
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              _carList[index].desc,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          )
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
                              "Specification", 
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
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row (
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      const WidgetSpan(
                                        child: Icon(Icons.person, 
                                          size: 20,
                                          color: Color(0xFF808080),
                                        ),
                                      ),
                                      TextSpan(
                                        text: "${_carList[index].seat.toString()} Seats",
                                        style: const TextStyle(
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
                                      const WidgetSpan(
                                        child: Icon(Icons.speed, 
                                          size: 20,
                                          color: Color(0xFF808080),
                                        ),
                                      ),
                                      TextSpan(
                                        text: "${_carList[index].distance.toString()} Km",
                                        style: const TextStyle(
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
                                      const WidgetSpan(
                                        child: ImageIcon(
                                          AssetImage("assets/images/fuel.png"),
                                          color: Color(0xFF808080),
                                          size: 18,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "${_carList[index].tank.toString()} L",
                                        style: const TextStyle(
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
                                          text: driver,
                                          style: const TextStyle(
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
                              initiallyExpanded: true,
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
                                                const WidgetSpan(
                                                  child: Icon(Icons.call, 
                                                    size: 20,
                                                    color: Color(0xFF808080),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: " ${_carList[index].garage_phone}",
                                                  style: const TextStyle(
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
                                                const WidgetSpan(
                                                  child: Icon(Icons.location_on, 
                                                    size: 20,
                                                    color: Color(0xFF808080),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: " ${_carList[index].garage_location}",
                                                  style: const TextStyle(
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
                                                const WidgetSpan(
                                                  child: Icon(Icons.email, 
                                                    size: 20,
                                                    color: Color(0xFF808080),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: " ${_carList[index].garage_email}",
                                                  style: const TextStyle(
                                                    color: Color(0xFF808080),
                                                    fontSize: 15
                                                  )
                                                ),                              
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children:[
                                          Container(
                                            margin: const EdgeInsets.only(left: 10.0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: ElevatedButton.icon(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                      pageBuilder: (c, a1, a2) => ChatPage(passGarageGuide: garageName, passUsername: widget.passUsername),
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
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(left: 10.0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: ElevatedButton.icon(
                                                onPressed: () {
                                                  var contact= "Phone: +62 "+_carList[index].garage_phone+" Address: "+_carList[index].garage_location;
                                                  Clipboard.setData(ClipboardData(text: contact));         
                                                },
                                                icon: const Icon(Icons.copy, size: 18),
                                                label: const Text("Copy"),
                                              ),
                                            ),
                                          ),
                                        ]
                                      ),
                                      const SizedBox(height: 5)
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
                              initiallyExpanded: true,
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
                                                      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: "~${_reviewList[index].fullname} on ${DateFormat('yyyy-MM-dd – kk:mm').format(_reviewList[index].dateReview).toString()}",
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
                                      ),
                                      elevation: 8,
                                      margin: const EdgeInsets.all(10),
                                    );

                                  }  
                                ),
                                getMessageReview()
                                
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
              pageBuilder: (c, a1, a2) => OrderPage(passIdCarGuide: widget.passIdCar, passCarGuidename: carname, passPrice: price, type: 'Car Rental'),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                final tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero);
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