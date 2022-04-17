import 'package:flutter/material.dart';
import 'package:tripversal/widgets/checkBox.dart';

class createAcc extends StatelessWidget {
  const createAcc({Key? key}) : super(key: key);

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
                Container(
                  width: 120,
                  margin: const EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80), 
                    child: Image.asset('assets/images/Default.png'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80), 
                    color: const Color(0xFF4169E1)
                  ),
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

                //ID Card section.
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
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
                  padding: EdgeInsets.all(4.0),
                  decoration: new BoxDecoration(
                    color: Colors.lightGreen.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10), 
                  ),  
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                        child: Icon(
                          Icons.info,
                          color: Colors.lightGreen,
                          size: 30.0,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width* 0.65,
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
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

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                              // Respond to button press
                          },
                          icon: const Icon(Icons.photo, size: 20),
                          label: const Text("Upload Photo"),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF4169E1), 
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                              // Respond to button press
                          },
                          icon: const Icon(Icons.save, size: 20),
                          label: const Text("Next"),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF13B402), 
                          ),
                        ),
                      ),
                    ]
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
