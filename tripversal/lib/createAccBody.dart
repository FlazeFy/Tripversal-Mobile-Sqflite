import 'package:flutter/material.dart';
import 'package:tripversal/main.dart';
import 'package:tripversal/models/userModel.dart';
import 'package:tripversal/services/userServices.dart';
import 'package:tripversal/widgets/checkBox.dart';

class CreateAcc extends StatelessWidget {
  //const createAcc({Key? key}) : super(key: key);
  var _fullnameCtrl = TextEditingController();
  var _idCardCtrl = TextEditingController();
  var _passwordCtrl = TextEditingController();
  var _emailCtrl = TextEditingController();
  var _phoneCtrl = TextEditingController();

  var _user = userModel();
  var _userservices = userServices();

  CreateAcc({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Flexible(
          child : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 120,
                    transform: Matrix4.translationValues(0.0, 30.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80), 
                      child: Image.asset('assets/images/Default.png'),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80), 
                      color: const Color(0xFF4169E1)
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    transform: Matrix4.translationValues(0.0, 30.0, 0.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                          // Respond to button press
                      },
                      icon: const Icon(Icons.photo, size: 20),
                      label: const Text("Select Image"),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF4169E1), 
                      ),
                    ),
                  )
                ),

                //Full name section.
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
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
                    
                        hintText: '',
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
                      //coba
                      _user.fullname = _fullnameCtrl.text;
                      _user.idCard = _idCardCtrl.text;
                      _user.password = _passwordCtrl.text;
                      _user.email = _emailCtrl.text;
                      _user.phone = _phoneCtrl.text;

                      //_userservices.createAccount(_user);
                      //ERROR!!! User still can create account with no data
                      
                      if((_user.fullname.isNotEmpty)&&(_user.fullname.length < 20)&&(_user.password.length > 6)&&(_user.email.isNotEmpty)&&(_user.phone.length > 9)){
                        var result = await _userservices.createAccount(_user);
                        print(result);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NavBar(pass_usernameNav: _user.fullname)),
                        );
                      } else {
                        print('Create Account Failed');
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
      ),
    );
  }
}
