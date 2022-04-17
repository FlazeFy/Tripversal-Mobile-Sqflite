import 'package:flutter/material.dart';

class forgetPass extends StatelessWidget {
  const forgetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
