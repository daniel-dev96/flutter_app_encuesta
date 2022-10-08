import 'package:flutter/cupertino.dart';
import 'package:flutter_app_encuesta/src/app/constant.dart';
import 'package:flutter_app_encuesta/src/app/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewField extends StatefulWidget {
  @override
  State<AddNewField> createState() => AddNewFieldState ();
}

class AddNewFieldState  extends State<AddNewField> {
  final _taskNameFormKey = GlobalKey<FormState>(debugLabel: 'taskDesState');
  final _taskDesFormKey = GlobalKey<FormState>(debugLabel: 'taskNameState');
  final _taskNameController = TextEditingController();
  final _taskDesController = TextEditingController();
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff737373),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Agregar nuevo campo",
              textAlign: TextAlign.center,
              style: GoogleFonts.mcLaren(
                textStyle: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
            Form(
              key: _taskNameFormKey,
              child: TextFormField(
                controller: _taskNameController,
                decoration: kTextformFieldDecoration.copyWith(
                    hintText: 'Escriba el nombre del campo.'),
                autofocus: true,
                textAlign: TextAlign.left,
                style: GoogleFonts.mcLaren(
                  textStyle: kTextFormFeildstyel,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your task name';
                  }
                  return null;
                },
              ),
            ),
            Form(
              key: _taskDesFormKey,
              child: TextFormField(
                controller: _taskDesController,
                decoration: kTextformFieldDecoration.copyWith(
                    hintText: 'Escriba el título del campo.'),
                autofocus: true,
                textAlign: TextAlign.left,
                style: GoogleFonts.mcLaren(
                  textStyle: kTextFormFeildstyel,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your task descriptions.';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20.0,),
            Divider(color: Color(0x29000000),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Es campo requerido?",
                  style: GoogleFonts.mcLaren(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                CupertinoSwitch(
                  value: true,
                  onChanged: (value) {
                    // setState(() {
                    //   _switchValue = value;
                    // });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(color: Color(0x29000000),),
            Text(
              "Elija el tipo de campo.",
              style: GoogleFonts.mcLaren(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                ),
              ),
            ),
             SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Color(0x29000000),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xFFDCDCDC), width: 2),
                    // boxShadow: [BoxShadow(color: Color(0xFFDCDCDC), blurRadius: 5, spreadRadius: 1)],
                  ),
                  child:  Column(
                    children: [
                      ToggleButtons(
                        // list of booleans
                        isSelected: isSelected,
                        // text color of selected toggle
                        selectedColor: Colors.white,
                        // text color of not selected toggle
                        color: Colors.blue,
                        // fill color of selected toggle
                        fillColor: Colors.lightBlue.shade900,
                        // when pressed, splash color is seen
                        splashColor: Colors.red,
                        // long press to identify highlight color
                        highlightColor: Colors.orange,
                        // if consistency is needed for all text style
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                        // border properties for each toggle
                        renderBorder: true,
                        borderColor: Colors.black,
                        borderWidth: 1.5,
                        borderRadius: BorderRadius.circular(10),
                        selectedBorderColor: Colors.pink,
                      // add widgets for which the users need to toggle
                        children: [ 
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text('Texto', style: TextStyle(fontSize: 18)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text('Número', style: TextStyle(fontSize: 18)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text('Fecha', style: TextStyle(fontSize: 18)),
                          ),
                        ],
                      // to select or deselect when pressed
                        onPressed: (int newIndex) { }
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (_taskNameFormKey.currentState!.validate()) {
                  if (_taskDesFormKey.currentState!.validate()) {
                    // Provider.of<TaskData>(context, listen: false).addTask(
                    //   _taskNameController.text,
                    //   _taskDesController.text,
                    //   TaskData().formattedDate,
                    // );
                    Navigator.pop(context);
                  }
                } else {
                  return null;
                }
              },
              child: Text(
                "Agregar",
                style: GoogleFonts.mcLaren(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
