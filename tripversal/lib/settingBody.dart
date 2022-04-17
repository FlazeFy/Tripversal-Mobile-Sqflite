import 'package:flutter/material.dart';
 
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}
 
class _State extends State<Setting> {
  bool isSwitch1 = true;
  bool isSwitch2 = false;
  bool isSwitch3 = false;
  bool isSwitch4 = false;
 
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment : Alignment.topLeft,
      child: ListView(
        children: <Widget>[
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                  child: const Text(
                    "Notification", 
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Switch(
                  value: isSwitch1,
                  onChanged: (value) {
                    setState(() {
                      isSwitch1 = value;
                      print(isSwitch1);
                    });
                  },
                  activeTrackColor: const Color.fromARGB(255, 65, 172, 225),
                  activeColor: const Color(0xFF4169E1),
                ),
              )
            ]
          ),

          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                  child: const Text(
                    "Vibration", 
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 100.0),
                child: Switch(
                  value: isSwitch2,
                  onChanged: (value) {
                    setState(() {
                      isSwitch2 = value;
                      print(isSwitch2);
                    });
                  },
                  activeTrackColor: const Color.fromARGB(255, 65, 172, 225),
                  activeColor: const Color(0xFF4169E1),
                ),
              )
            ]
          ),

          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                  child: const Text(
                    "Dark Mode", 
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 85.0),
                child: Switch(
                  value: isSwitch3,
                  onChanged: (value) {
                    setState(() {
                      isSwitch3 = value;
                      print(isSwitch3);
                    });
                  },
                  activeTrackColor: const Color.fromARGB(255, 65, 172, 225),
                  activeColor: const Color(0xFF4169E1),
                ),
              )
            ]
          ),
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                  child: const Text(
                    "Remember Me", 
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 58.0),
                child: Switch(
                  value: isSwitch4,
                  onChanged: (value) {
                    setState(() {
                      isSwitch4 = value;
                      print(isSwitch4);
                    });
                  },
                  activeTrackColor: const Color.fromARGB(255, 65, 172, 225),
                  activeColor: const Color(0xFF4169E1),
                ),
              )
            ]
          ),

        ]
      )
    );
  }
}