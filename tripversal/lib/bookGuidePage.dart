import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tripversal/chatPage.dart';
import 'package:tripversal/models/guideModel.dart';
import 'package:tripversal/models/reviewModel.dart';
import 'package:tripversal/orderPage.dart';
import 'package:tripversal/services/guideServices.dart';
import 'package:tripversal/widgets/sideNav.dart';

class BookGuidePage extends StatefulWidget {
  const BookGuidePage({Key key, this.passIdGuide, this.passUsername}) : super(key: key);

  final int passIdGuide;
  final String passUsername;

  @override

  _BookGuidePage createState() => _BookGuidePage();
}

class _BookGuidePage extends State<BookGuidePage> {
  //Initial variable for outside widget build.
  var guideName =""; 
  int price = 0; 
  int countRev = 0;

  //MVC.
  final _guideServices = guideServices();
  List<guideModel> _guideList = <guideModel>[];
  List<reviewModel> _reviewList = <reviewModel>[];
  
  //Get data method.
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
      if(guide['id_guide'] == widget.passIdGuide){
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
      if((review['id_car_guide'] == widget.passIdGuide)&&(review['type'] == 'Tour Guide')){
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

  Widget getMessageReview() {
    if(countRev == 0){
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
        child: Column(
          children: [
            ClipRRect(
            child: Image.asset(
              'assets/images/icon/Empty2.png', width: 200),
            ),
            const Text(
              "There's no review for this guide", 
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
        title: const Text("Book Tour Guide", 
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
            Navigator.pop(context);
          },
        )
      ],
      //Transparent setting.
      backgroundColor: const Color(0x44FFFFFF),
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
                          const WidgetSpan(
                            child: Icon(Icons.person, 
                              size: 24,
                              color: Color(0xFF4169E1),
                            ),
                          ),
                          TextSpan(
                            text: _guideList[index].name,
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
                    transform: Matrix4.translationValues(140.0, 0.0, 0.0),
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
                            const TextSpan(
                              text: "Rp.",
                              style: TextStyle(
                                color: Color(0xFF808080),
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                              )
                            ),
                            TextSpan(
                              text: " ${_guideList[index].price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                              style: const TextStyle(
                                color: Color(0xFF4169E1),
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
                            _guideList[index].desc,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 145, 145, 145)
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
                            "Language", 
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
                                      child: Icon(Icons.message, 
                                        size: 20,
                                        color: Color(0xFF808080),
                                      ),
                                    ),
                                    TextSpan(
                                      text: _guideList[index].language,
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
                                              const WidgetSpan(
                                                child: Icon(Icons.call, 
                                                  size: 20,
                                                  color: Color(0xFF808080),
                                                ),
                                              ),
                                              TextSpan(
                                                text: "+62 ${_guideList[index].phone}",
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
                                                text: _guideList[index].address,
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
                                                text: " ${_guideList[index].email}",
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
                                          margin: const EdgeInsets.only(left: 20.0),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: ElevatedButton.icon(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                    pageBuilder: (c, a1, a2) => ChatPage(passGarageGuide: _guideList[index].name, passUsername: widget.passUsername),
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
                                                var contact= "Phone: +62 "+_guideList[index].phone+" Address: "+_guideList[index].address;
                                                Clipboard.setData(ClipboardData(text: contact));         
                                              },
                                              icon: const Icon(Icons.copy, size: 18),
                                              label: const Text("Copy"),
                                            ),
                                          ),
                                        ),
                                      ]
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
                              getMessageReview(),
                              
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
              pageBuilder: (c, a1, a2) => OrderPage(passIdCarGuide: widget.passIdGuide, passCarGuidename: guideName, passPrice: price, type: 'Tour Guide'),
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