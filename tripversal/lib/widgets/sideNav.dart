import 'package:flutter/material.dart';
import '../main.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
            DrawerHeader(
            child: Text(
              passUsername,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF4169E1),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/background1.png')
              )
            ),
          ),
          ListTile(
            leading: const Icon(Icons.app_settings_alt, color: Color(0xFF4169E1)),
            title: const Text('Settings'),
            textColor: const Color(0xFF4169E1),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => const SettingPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_center, color: Color(0xFF4169E1)),
            title: const Text('Help'),
            textColor: const Color(0xFF4169E1),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => const HelpPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Color(0xFF4169E1)),
            title: const Text('About us'),
            textColor: const Color(0xFF4169E1),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.rule, color: Color(0xFF4169E1)),
            title: const Text('Privacy & Conditions'),
            textColor: const Color(0xFF4169E1),
            onTap: () => {Navigator.of(context).pop()},
          ),
          Expanded(
            child: Align(
            alignment: Alignment.bottomLeft,
              child: ListTile(
                tileColor: const Color(0xFFe14141),
                leading: const Icon(Icons.exit_to_app, color: Colors.white),
                title: const Text('Sign-Out'),  
                textColor: Colors.white,
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
              ),
           ),
          ),
        ],
      ),
    );
  }
}

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  _SettingPage createState() => _SettingPage();
}
 
class _SettingPage extends State<SettingPage> {
  //Initial Variable.
  bool isSwitch1 = true;
  bool isSwitch2 = false;
  bool isSwitch3 = false;
  bool isSwitch4 = false;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: 
          const IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: const Text("Setting", 
        style: TextStyle(
          color: Color(0xFF4169E1),
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
      
      //Transparent setting.
      backgroundColor: const Color(0x44FFFFFF),
      elevation: 0,
    ),

      body: Align(
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
                      });
                      //Change dark/light mode.
                      Get.isDarkMode
                      ? Get.changeTheme(ThemeData.light())
                      : Get.changeTheme(ThemeData.dark());
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
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  const HelpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: 
          const IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: const Text("Help", 
        style: TextStyle(
          color: Color(0xFF4169E1),
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
      
      //Transparent setting.
      backgroundColor: const Color(0x44FFFFFF),
      elevation: 0,
    ),

      body: Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Flexible(            
              child : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    
                    ExpansionTile( //Collapse-1 ===========================================
                      leading: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.car_rental,
                        color: Color(0xFF808080)),
                        onPressed: () {},
                      ),
                      title: const Text(
                        "How to rent a car",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      children: <Widget>[                     
                        SingleChildScrollView(               
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: const <Widget>[
                                //
                            ]
                          )
                        )   
                        
                      ],
                    ),

                    ExpansionTile( //Collapse-2 ===========================================
                      leading: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.person,
                        color: Color(0xFF808080)),
                        onPressed: () {},
                      ),
                      title: const Text(
                        "How to book a tour guide",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      children: <Widget>[
                        SingleChildScrollView(               
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: const <Widget>[
                               // 
                            ]
                          )
                        )  
                      ],
                    ),

                    ExpansionTile( //Collapse-3 ===========================================
                      leading: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.cancel,
                        color: Color(0xFF808080)),
                        onPressed: () {},
                      ),
                      title: const Text(
                        "How to cancel the order",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      children: <Widget>[                     
                        SingleChildScrollView(               
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: const <Widget>[
                              //
                            ]
                          )
                        )   
                        
                      ],
                    ),
                    
                    ExpansionTile( //Collapse-4 ===========================================
                      leading: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.password,
                        color: Color(0xFF808080)),
                        onPressed: () {},
                      ),
                      title: const Text(
                        "How to change password",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      children: <Widget>[                     
                        SingleChildScrollView(               
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: const <Widget>[
                               // 
                            ]
                          )
                        )   
                        
                      ],
                    ),

                    ExpansionTile( //Collapse-4 ===========================================
                      leading: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.timelapse,
                        color: Color(0xFF808080)),
                        onPressed: () {},
                      ),
                      title: const Text(
                        "How to extend the order",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      children: <Widget>[                     
                        SingleChildScrollView(               
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: const <Widget>[
                              //
                            ]
                          )
                        )   
                        
                      ],
                    ),

                  ],
                ),
              )
            )
          )
        )
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: 
          const IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: const Text("About", 
        style: TextStyle(
          color: Color(0xFF4169E1),
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
      
      //Transparent setting.
      backgroundColor: const Color(0x44FFFFFF),
      elevation: 0,
    ),

      body: Center(
        child: Column(
          children: [
            const Align(
              child: Icon(
                Icons.travel_explore,
                color: Color(0xFF4169E1),
                size: 100.0,
              ),     
            ),
            //Bug fontfamily not working.
            const Align(
              child: Text('tripversal',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  fontFamily: 'FuturaMediumBT',
                  color: Color(0xFF4169E1)
                ),
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: const Text('Tripversal is an application that will help you travel around Indonesia. With Tripversal you can rent a various of vehicle like citycar, minibus, motorcycle, even a bus. Not only that, you can also rent a tour guide with various spoken language. Our vehicle and guide are trusted and will help you through the day. So dont hesitate and book now to get a trip that will never be forgotten.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'FuturaMediumBT',
                  color: Color(0xFF808080)
                ),
              ),
            ),
            
          ]
        )
      ),
    );
  }
}

