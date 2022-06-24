import 'package:flutter/material.dart';
import 'package:tripversal/main.dart';
import 'package:tripversal/models/userModel.dart';
import 'package:tripversal/services/userServices.dart';

class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);

  //Text field contoller.
  var usernameCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  //MVC.
  final _user = userModel();
  final _userservices = userServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Title.
            const Text('tripversal',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
                fontFamily: 'FuturaMediumBT',
                color: Color(0xFF4169E1)
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
          
            //Username section.
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
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
                margin: const EdgeInsets.symmetric(),
                height: 35,
                child: TextField(
                  controller: usernameCtrl,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                    ),
                  ),
                ),
              ),
            ),

            //Password section.
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
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
                margin: const EdgeInsets.symmetric(),
                height: 35,
                child: TextField(
                  obscureText: true,
                  controller: passwordCtrl,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                    ),
                  ),
                ),
              ),
            ),

            //Button validation section.
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  _user.fullname = usernameCtrl.text;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgetPage(passUsernameNav: _user.fullname)),
                  );
                },
                child: const Text('Forgot Password',
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  )
                ),
                style: TextButton.styleFrom(
                  primary: const Color(0xFF4169E1),
                ),
              ),
            ),
            
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width* 0.9,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(          
                child: const Text('Login'),
                onPressed: () async{
                  //Get controller as text.
                  _user.fullname = usernameCtrl.text;
                  _user.password = passwordCtrl.text;

                  //Check Textfield is empty.
                  if((_user.fullname.isNotEmpty)&&(_user.password.isNotEmpty)){
                    //Validation.
                    var result = await _userservices.loginAccount(_user);
                    if(result.toString() != '[]'){
                      passUsername = _user.fullname;
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => const NavBar(),
                        ),
                      );
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
                                  const Text('Incorrect username or password!'),
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
                                const Text('Username and password cannot be left empty!'),
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
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF4169E1)),
                ),
              )
            ),
            Row(
              children: <Widget>[
                const Text('Does not have account?', style: TextStyle(fontSize: 14)),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      color: Color(0xFF4169E1),
                    )
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CreateAccPage()),
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: const Text(
                  "V1.0", 
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF808080)
                  ),
                ),
              ),
            ),
          ]
        )
      
    );
  }
}
