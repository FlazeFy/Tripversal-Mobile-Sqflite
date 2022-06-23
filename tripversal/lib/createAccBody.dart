import 'package:flutter/material.dart';
import 'package:tripversal/main.dart';
import 'package:tripversal/models/userModel.dart';
import 'package:tripversal/services/userServices.dart';
import 'package:tripversal/widgets/checkBox.dart';

//Global variable.
bool checkedCreateAcc = false;

class CreateAcc extends StatelessWidget {
  //Text field contoller.
  final _fullnameCtrl = TextEditingController();
  final _idCardCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  //MVC.
  final _user = userModel();
  final _user2 = userModel();
  final _userservices = userServices();

  CreateAcc({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Flexible(
        child : SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(top: 80.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50), 
                    child: Image.asset('assets/images/Default.png', width: 50),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), 
                    color: const Color(0xFF4169E1)
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    //
                  },
                  icon: const Icon(Icons.photo, size: 20),
                  label: const Text("Select Image"),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF4169E1), 
                  ),
                )
              ),

              //Full name section.
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                  child: const Text(
                    "Username", 
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
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: 35,
                  child: TextField(
                    controller: _fullnameCtrl,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                      ),
                      hintText: '',
                    ),
                  ),
                ),
              ),

              //ID Card section.
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                  child: const Text(
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
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: 35,
                  child: TextField(
                    controller: _idCardCtrl,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                      ),
                      hintText: '',
                    ),
                  ),
                ),
              ),

              //Password section.
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: const Text(
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
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: 35,
                  child: TextField(
                    obscureText: true,
                    controller: _passwordCtrl,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                      ),
                  
                      hintText: '',
                    ),
                  ),
                ),
              ),

              //Email section.
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
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
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: 35,
                  child: TextField(
                    controller: _emailCtrl,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                      ),
                      hintText: 'contoh@gmail.com',
                    ),
                  ),
                ),
              ),

              //Phone number section.
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                  child: const Text(
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
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: 35,
                  child: TextField(
                    controller: _phoneCtrl,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                      ),
                      hintText: 'ex : 08114819210',
                    ),
                  ),
                ),
              ),
              //End of text entry section.

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Row(
                  children:  [
                    const Align(
                      child: MyStatefulWidget3(),
                    ),  
                    Align(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: const Text(
                          "I agree to the Privacy Policy and the Terms", 
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Color(0xFF4169E1),
                          ),
                        ),
                      ),
                    ),
                  ]       
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
              
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton.icon(
                  onPressed: () async{
                    //Get controller as text.
                    _user.fullname = _fullnameCtrl.text;
                    _user.idCard = _idCardCtrl.text;
                    _user.password = _passwordCtrl.text;
                    _user.email = _emailCtrl.text;
                    _user.phone = _phoneCtrl.text;

                    _user2.fullname = _fullnameCtrl.text;
                    
                    //Input requirement.
                    if((_fullnameCtrl.text.isNotEmpty)&&(_idCardCtrl.text.length == 16)&&(_fullnameCtrl.text.length < 20)&&(_passwordCtrl.text.length > 6)&&(_emailCtrl.text.isNotEmpty)&&(_phoneCtrl.text.length > 9)&&(_phoneCtrl.text.length < 14)){
                      if(checkedCreateAcc == true){
                        
                        //Check available username.
                        var resultLogin = await _userservices.checkAvailableUsername(_user2);
                        if(resultLogin.toString() == '[]'){
                          //Create account.
                          var result = await _userservices.createAccount(_user);
                          if(result.toString() != '[]'){
                            passUsername = _user.fullname;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const NavBar()),
                            );
                          } else {
                            //Database change failed Pop-up.
                            return showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: null,
                                  content: SizedBox(
                                    height: MediaQuery.of(context).size.height* 0.23,
                                    width: MediaQuery.of(context).size.width* 0.8,
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          child: Image.asset(
                                            'assets/images/icon/Failed.png', width: MediaQuery.of(context).size.width* 0.35),
                                        ),
                                        const Text('Create Account failed. please try again'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              }
                            );
                          }
                        } else {
                          //Validation failed Pop-up.
                          return showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: null,
                                content: SizedBox(
                                  height: MediaQuery.of(context).size.height* 0.23,
                                  width: MediaQuery.of(context).size.width* 0.8,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        child: Image.asset(
                                          'assets/images/icon/Failed.png', width: MediaQuery.of(context).size.width* 0.35),
                                      ),
                                      const Text('Username already been taken'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            }
                          );
                        }
                      } else {
                        //Checkbox failed Pop-up.
                        return showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: null,
                              content: SizedBox(
                                height: MediaQuery.of(context).size.height* 0.23,
                                width: MediaQuery.of(context).size.width* 0.8,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      child: Image.asset(
                                        'assets/images/icon/Failed.png', width: MediaQuery.of(context).size.width* 0.35),
                                    ),
                                    const Text('You havent checked the privacy and terms'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          }
                        );
                      }
                    } else {
                      //Textfield check failed Pop-up.
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: null,
                            content: SizedBox(
                              height: MediaQuery.of(context).size.height* 0.23,
                              width: MediaQuery.of(context).size.width* 0.8,
                              child: Column(
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      'assets/images/icon/Failed.png', width: MediaQuery.of(context).size.width* 0.35),
                                  ),
                                  const Text('Your data is empty or not valid!'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        }
                      );
                    }
                  },
                  icon: const Icon(Icons.save, size: 20),
                  label: const Text("Next"),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF13B402), 
                  ),
                ),
              )

            ]
          )
        )
      )
      
    );
  }
}
