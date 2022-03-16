// TODO Implement this library.
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Rose Monde',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF4169E1),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/background1.png')
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.manage_accounts, color: Color(0xFF4169E1)),
            title: Text('Account'),
            textColor: Color(0xFF4169E1),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.app_settings_alt, color: Color(0xFF4169E1)),
            title: Text('Settings'),
            textColor: Color(0xFF4169E1),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.help_center, color: Color(0xFF4169E1)),
            title: Text('Help'),
            textColor: Color(0xFF4169E1),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.info, color: Color(0xFF4169E1)),
            title: Text('About'),
            textColor: Color(0xFF4169E1),
            onTap: () => {Navigator.of(context).pop()},
          ),
          Expanded(
            child: Align(
            alignment: Alignment.bottomLeft,
              child: ListTile(
                tileColor: Color(0xFFe14141),
                leading: Icon(Icons.exit_to_app, color: Colors.white),
                title: Text('Sign-Out'),  
                textColor: Colors.white,
                onTap: () => {Navigator.of(context).pop()},
              ),
           ),
          ),
        ],
      ),
    );
  }
}