import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_encuesta/src/app/constant.dart';
import 'package:flutter_app_encuesta/src/app/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_encuesta/src/app/screens/add-new-field.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_database/firebase_database.dart';

class AddNewSurvey extends StatefulWidget {
  @override
  State<AddNewSurvey> createState() => _AddNewSurveyState();
}

class _AddNewSurveyState extends State<AddNewSurvey> {
  final _taskNameFormKey = GlobalKey<FormState>(debugLabel: 'taskDesState');
  final _taskDesFormKey = GlobalKey<FormState>(debugLabel: 'taskNameState');
  final _taskNameController = TextEditingController();
  final _taskDesController = TextEditingController();

  final fb = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var k = rng.nextInt(10000);

    final ref = fb.ref().child('todos/$k');

    return Scaffold(
      appBar: AppBar(
        title: Text('Encuesta'),
        centerTitle:  true
      ),
      body: Container(
        color: Color(0xff737373),
        child: Container(
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Agregar Encuesta",
                textAlign: TextAlign.center,
                style: GoogleFonts.mcLaren(
                  textStyle: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Form(
                      key: _taskNameFormKey,
                      child: TextFormField(
                        controller: _taskNameController,
                        decoration: kTextformFieldDecoration,
                        autofocus: true,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.mcLaren(
                          textStyle: kTextFormFeildstyel,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor escriba el nombre de la encuesta';
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
                            hintText: 'Escriba la descripción de la encuesta.'),
                        autofocus: true,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.mcLaren(
                          textStyle: kTextFormFeildstyel,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor escriba la descripción de la encuesta.';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoButton(
                    onPressed: () => {
                       showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: AddNewField(),
                          ),
                        ),
                      )
                    },
                    // onPressed: () => Navigator.pushReplacement(
                    //       context, MaterialPageRoute(builder: (context) => MainScreenRestaurants())),
                    padding: EdgeInsets.zero,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Color(0xFF2C3E50), 
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x29000000),
                            offset: Offset(0, 0),
                            blurRadius: 3,
                            spreadRadius: 0
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Agregar Cammpo",
                          style: GoogleFonts.mcLaren(
                          textStyle: TextStyle(
                            color: Color(0xffF8F9FB),
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                          ),
                      ),
                        ),
                      ),
                    )
                  ),

                  SizedBox(height: 10.0,),

                  CupertinoButton(
                    onPressed: ()  {
                      if (_taskNameFormKey.currentState!.validate()) {
                        if (_taskDesFormKey.currentState!.validate()) {
                           ref.set({
                              "name_survey": _taskNameController.text,
                              "description_survey": _taskDesController.text,
                            }).asStream();
                          Navigator.pop(context);
                        }
                      } else {
                        ref.set({
                          "name_survey": _taskNameController.text,
                          "description_survey": _taskDesController.text,
                        }).asStream();
                      }
                    },
                    // onPressed: () => Navigator.pushReplacement(
                    //       context, MaterialPageRoute(builder: (context) => MainScreenRestaurants())),
                    
                    padding: EdgeInsets.zero,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Color(0xFF3498DB), 
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x29000000),
                            offset: Offset(0, 0),
                            blurRadius: 3,
                            spreadRadius: 0
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Agregar",
                          style: GoogleFonts.mcLaren(
                          textStyle: TextStyle(
                            color: Color(0xffF8F9FB),
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                          ),
                      ),
                        ),
                      ),
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
