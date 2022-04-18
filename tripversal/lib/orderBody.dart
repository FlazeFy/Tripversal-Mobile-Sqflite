import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() {
    return _OrderState();
  }
}

class _OrderState extends State<Order> {
  TimeOfDay selectedTime = TimeOfDay.now();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.topCenter,
        child: Flexible(
          child : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ExpansionTile( //Collapse-1 ===========================================
                  title: const Text(
                    "   Customer Detail",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF4169E1)
                    ),
                  ),
                  initiallyExpanded: true,
                  children: <Widget>[                     
                    SingleChildScrollView(               
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: <Widget>[

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
                                color: Color(0xFF212121)
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
                                hintText: 'Rose Monde',
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
                                color: Color(0xFF212121)
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
                            
                                hintText: '08114882001',
                              ),
                            ),
                          ),
                        ),
                        ]
                      )
                    )   
                    
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 4,
                  indent: 0,
                  endIndent: 15,
                  color: Color.fromARGB(255, 185, 185, 185),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                    child: const Text(
                      "Order Detail", 
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF4169E1)
                      ),
                    ),
                  ),
                ),

                //Date section.
                Row(
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                            child: const Text(
                              "Date", 
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Color(0xFF212121)
                              ),
                            ),
                          ),
                        ),
                        Align(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            width: 90,
                            height: 35,
                            child: TextField(
                              onTap: () {
                                _selectDate(context);
                              },
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                                ),             
                                hintText: '16/4/2022',
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),

                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            child: const Text(
                              "Time", 
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Color(0xFF212121)
                              ),
                            ),
                          ),
                        ),
                        Align(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            width: 60,
                            height: 35,
                            child: TextField(
                              onTap: () {
                                _selectTime(context);
                              },
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                                ),        
                                hintText: '12:30',
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ]
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                    child: const Text(
                      "Pick-Up Location", 
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Color(0xFF212121)
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal:15.0, vertical: 3.0),
                        height: 45,
                        width: 50,
                        child: IconButton(
                        onPressed: () {
                            // Respond to button press
                          },
                          icon: const Icon(Icons.location_on, size: 30),
                          color: const Color(0xFF00B0FF),
                          padding: const EdgeInsets.all(0.0)
                        )
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 3.0),
                        height: 35,
                        width: MediaQuery.of(context).size.width* 0.60,
                        child: const TextField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                            ),
                        
                            hintText: 'Bojongsoang',
                          ),
                        ),
                      ),
                    ]
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                    child: const Text(
                      "Note (Optional)", 
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Color(0xFF212121)
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    height: 65,
                    child: TextFormField(
                      minLines: 10,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF4169E1), width: 2.0),
                        ),
                        hintText: 'Please arrive at the location five minutes early.',
                      ),
                    ),
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
                        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                        child: const Icon(
                          Icons.info,
                          color: Colors.green,
                          size: 30.0,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width* 0.65,
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          child: const Text(
                            "Make sure the order detail is right. You can't change it in the future", 
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
                const Divider(
                  height: 20,
                  thickness: 4,
                  indent: 0,
                  endIndent: 15,
                  color: Color.fromARGB(255, 185, 185, 185),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Color(0xFF4169E1), width: 2),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                            child: const Text(
                              "Payment Detail", 
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                                    child: const Text(
                                      "Payment Method", 
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: const PaymentMethod(),
                                  
                                ),
                              ]
                            ),
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                                    child: const Text(
                                      "Price", 
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                    child: const Text(
                                      "Rp. 325.000", 
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                            ),
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                    child: const Text(
                                      "Pick-up addition", 
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                    child: const Text(
                                      "Rp. 20.000", 
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                            ),
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                    child: const Text(
                                      "Tax", 
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                    child: const Text(
                                      "Rp. 5.000", 
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                            ),
                            const Divider(
                              height: 20,
                              thickness: 2,
                              indent: 20,
                              endIndent: 30,
                              color: Color.fromARGB(255, 185, 185, 185),
                            ),
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                    child: const Text(
                                      "Total", 
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                    child: const Text(
                                      "Rp. 800.000", 
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                            ),
                          ]

                        ),
                      ]
                    ),
                  ),
                ),

                const Divider(
                  height: 20,
                  thickness: 4,
                  indent: 0,
                  endIndent: 15,
                  color: Color.fromARGB(255, 185, 185, 185),
                ),
                Column(
                  children: <Widget>[

                    ExpansionTile( //Collapse-2 ===========================================
                      leading: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.price_change,
                        color: Color(0xFF808080)),
                        onPressed: () {},
                      ),
                      title: const Text(
                        "What is pick-up addition?",
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
                                
                              
                            ]
                          )
                        )  
                      ],
                    ),

                    ExpansionTile( //Collapse-3 ===========================================
                      leading: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.price_check,
                        color: Color(0xFF808080)),
                        onPressed: () {},
                      ),
                      title: const Text(
                        "How much the tax is charged?",
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
                                
                              
                            ]
                          )
                        )   
                        
                      ],
                    ),

                  ],
                ),

              ]
            )
          )
        )
      ),
      
    );
  }
  //Time picker
  _selectTime(BuildContext context) async {          
  final TimeOfDay? timeOfDay = await showTimePicker(
    context: context,
    initialTime: selectedTime,
    initialEntryMode: TimePickerEntryMode.dial,
  );
  if(timeOfDay != null && timeOfDay != selectedTime)
    {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}

//Drop down location or city.
class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);
  
  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String dropdownValue = 'Transfer Mandiri';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(
        color: Color(0xFF4169E1),
        fontSize: 15,
      ),
      underline: Container(
        height: 2,
        color: const Color(0xFF4169E1),
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>["Transfer Mandiri", "Transfer BNI", "Transfer BRI", "Link Aja", "Ovo", "Dana"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
