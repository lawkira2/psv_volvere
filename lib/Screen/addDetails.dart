import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:psv_volvere/Model/cardmodel.dart';
import 'package:psv_volvere/utility/constants.dart';

import 'homepage.dart';

class AddDetails extends StatefulWidget {
  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  Color primarycolor = Color.fromRGBO(0, 50, 156, 1);
  int selected = 0;
  List state = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Lakshadweep",
    "Puducherry"
  ];

  var name = TextEditingController();
  var address = TextEditingController();
  var dob = TextEditingController();
  void changeColor(Color color) => setState(() => currentcolor = color);

  Color currentcolor = Color.fromRGBO(0, 50, 156, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: primarycolor),
        title: Text(
          'Detail Form',
          style: TextStyle(
            color: primarycolor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Material(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Text(
                        'Name',
                        style: ktext,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: name,
                        decoration:
                            kTextFieldDecoration.copyWith(counterText: ' '),
                      ),
                      Text(
                        'Address',
                        style: ktext,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: address,
                        decoration:
                            kTextFieldDecoration.copyWith(counterText: ' '),
                      ),
                      Text(
                        'State',
                        style: ktext,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black)),
                        child: DropdownButton(
                            isExpanded: true,
                            value: selected,
                            disabledHint: Text(state[selected]),
                            onChanged: (value) {
                              setState(() {
                                selected = value;
                              });
                            },
                            underline: SizedBox(),
                            items: state
                                .map((e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: state.indexOf(e),
                                    ))
                                .toList()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Date of Birth',
                        style: ktext,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      DateTimeField(
                        format: DateFormat.yMMMd(),
                        controller: dob,
                        decoration:
                            kTextFieldDecoration.copyWith(counterText: ' '),
                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2022));
                          if (date != null) {
                            final time = TimeOfDay.fromDateTime(DateTime.now());
                            return DateTimeField.combine(date, time);
                          } else {
                            return currentValue;
                          }
                        },
                      ),
                      Text(
                        'Favorite color',
                        style: ktext,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RaisedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                titlePadding: const EdgeInsets.all(0.0),
                                contentPadding: const EdgeInsets.all(0.0),
                                actions: [
                                  FlatButton(
                                    child: Text('Done'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                content: SingleChildScrollView(
                                  child: SlidePicker(
                                    pickerColor: currentcolor,
                                    onColorChanged: changeColor,
                                    paletteType: PaletteType.rgb,
                                    enableAlpha: false,
                                    displayThumbColor: true,
                                    showLabel: false,
                                    showIndicator: true,
                                    indicatorBorderRadius:
                                        const BorderRadius.vertical(
                                      top: const Radius.circular(25.0),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'Pick Color',
                          style: ktext.copyWith(
                              color: currentcolor == Colors.white
                                  ? Colors.black
                                  : Colors.white),
                        ),
                        color: currentcolor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        width: 200,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            if (name.text != '' && name.text != null) {
                              CardList.add(card(
                                  color: currentcolor,
                                  address: address.text,
                                  date: dob.text,
                                  name: name.text,
                                  state: state[selected]));
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (route) => false);
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Name field is Required');
                            }
                          },
                          child: Text(
                            'Submit',
                            style: ktext.copyWith(color: Colors.white),
                          ),
                          color: primarycolor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
