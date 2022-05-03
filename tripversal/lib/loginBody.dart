import 'package:flutter/material.dart';
import 'package:tripversal/main.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 100.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: const [
                Text('tripversal',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                    fontFamily: 'FuturaMediumBT',
                    color: Color(0xFF4169E1)
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
                )
              ]
            ),

            //Username section.
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
                child: const TextField(
                  // controller: usernameCtrl,
                  decoration: InputDecoration(
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
                margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
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
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                height: 35,
                child: const TextField(
                  obscureText: true,
                  // controller: passwordCtrl,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                    ),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgetPage()),
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
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                
                child: const Text('Login'),
                onPressed: () {
                  // print(nameController.text);
                  // print(passwordController.text);
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => const NavBar(),
                    ),
                  );
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
                margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
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
          ],
        )
      )
    );
  }
}
