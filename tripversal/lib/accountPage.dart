import 'package:flutter/material.dart';
import 'package:tripversal/main.dart';
import 'package:tripversal/models/userModel.dart';
import 'package:tripversal/services/userServices.dart';
import 'package:tripversal/widgets/sideNav.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key, this.passUsername}) : super(key: key);
  final String passUsername;

  @override

  _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  //Text field contoller.
  final _idCardCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  //MVC.
  List<userModel> _userList = <userModel>[];
  final _user = userModel();
  final _userServices = userServices();
  
  //Get data method.
  @override
  void initState(){
    super.initState();
    getAllUserData();
  }

  getAllUserData() async {
    _userList = <userModel>[];
    var users = await _userServices.readUser();

    users.forEach((user){
      if(user['fullname'] == widget.passUsername){
      setState((){
        var userModels = userModel();
        userModels.idUser = user['id_user'];
        userModels.fullname = user['fullname'];
        userModels.idCard = user['id_card'].toString();
        userModels.password = user['password'];
        userModels.email = user['email'];
        userModels.phone = user['phone'];
        _userList.add(userModels);
      });
    }});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        iconTheme: 
          const IconThemeData(
            color: Color(0xFF4169E1),
            size: 35.0,
          ),
        title: const Text("Account", 
          style: TextStyle(
            color: Color(0xFF4169E1),
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Color(0xFF4169E1)),
            iconSize: 40,
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
        backgroundColor: const Color(0x44FFFFFF),
        elevation: 0,
      ),

      body: ListView.builder(
        itemCount : _userList.length,
        itemBuilder: (context, index){

        return Container(
          transform: Matrix4.translationValues(0.0, -10.0, 0.0),
          child: Flexible(
            child : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: 140,
                    margin: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80), 
                      child: Image.asset('assets/images/User.jpg'),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80), 
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3)
                        )
                      ],
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
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                          ),
                      
                          hintText: _userList[index].fullname,
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
                      child: TextField(
                        controller: _idCardCtrl,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                          ),
                      
                          hintText: _userList[index].idCard,
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
                      child: TextField(
                        controller: _passwordCtrl,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                          ),
                          hintText: _userList[index].password,
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
                      child: TextField(
                        controller: _emailCtrl,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                          ),
                      
                          hintText: _userList[index].email,
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
                      child: TextField(
                        controller: _phoneCtrl,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                          ),
                      
                          hintText: _userList[index].phone,
                        ),
                      ),
                    ),
                  ),
                  //End of text entry section.

                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                        child: const Icon(
                          Icons.info,
                          color: Color(0xFF4169E1),
                          size: 30.0,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 300,
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: const Text(
                            "Password must have min 8 character, Have 1 capital and 1 number.", 
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Color(0xFF4169E1)
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),

                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Respond to button press
                          },
                          icon: const Icon(Icons.photo, size: 20),
                          label: const Text("Change Photo"),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF4169E1), 
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            _user.idUser = _userList[index].idUser;
                            _user.fullname = _userList[index].fullname;

                            //Textfield validation.
                            if(_idCardCtrl.text.isEmpty){
                              _user.idCard = _userList[index].idCard;
                            } else {
                              _user.idCard = _idCardCtrl.text;
                            }
                            if(_passwordCtrl.text.isEmpty){
                              _user.password = _userList[index].password;
                            } else {
                              _user.password = _passwordCtrl.text;
                            }
                            if(_emailCtrl.text.isEmpty){
                              _user.email = _userList[index].email;
                            } else {
                              _user.email = _emailCtrl.text;
                            }
                            if(_phoneCtrl.text.isEmpty){
                              _user.phone = _userList[index].phone;
                            } else {
                              _user.phone = _phoneCtrl.text;
                            }
                            
                            //Input requirement.
                            if((_user.password.length > 6)&&(_user.idCard.length == 16)&&(_user.phone.length > 9)&&(_user.phone.length < 14)){
                              var result = await _userServices.editAccount(_user);
                              if(result.toString() != '[]'){
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
                                            const Text('Update Account failed. please try again'),
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
                          label: const Text("Save Changes"),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF13B402), 
                          ),
                        ),
                      ),
                    ]
                  )

                ]
              )
            )
          )
        );
     })
    );
  }
}