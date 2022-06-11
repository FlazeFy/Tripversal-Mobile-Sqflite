import 'package:flutter/material.dart';
import '../main.dart';

class NavDrawer extends StatelessWidget {
  var pass_username;
  NavDrawer({Key key, this.pass_username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
            DrawerHeader(
            child: Text(
              pass_username,
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