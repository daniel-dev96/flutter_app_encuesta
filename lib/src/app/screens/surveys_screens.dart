import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_app_encuesta/src/app/constant.dart';
import 'package:flutter_app_encuesta/src/app/models/task_data.dart';
import 'package:flutter_app_encuesta/src/app/screens/addnewTask.dart';
import 'package:flutter_app_encuesta/src/app/screens/all_surveys.dart';
import 'package:flutter_app_encuesta/src/app/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SurveysScreens extends StatelessWidget {
  final fb = FirebaseDatabase.instance;
  var l;
  var g;
  var k;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('todos');

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          color: Colors.white10,
          height: 50.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            showMaterialModalBottomSheet(
              context: context,
              builder: (context) => AddNewSurvey()
            );
          }),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, bottom: 30.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25.0,
                  child: IconButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AllSurveys())),
                    icon: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Acme Encuestas",
                      style: GoogleFonts.mcLaren(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/logo.png',
                        height: 100,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "0 Encuestas",
                      style: GoogleFonts.mcLaren(
                        textStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      padding: EdgeInsets.all(10),
                      decoration: kDateContainerDecoration,
                      child: Text(
                        TaskData().formattedDate,
                        style: kAlertDescStyle,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: FirebaseAnimatedList(
                query: ref,
                shrinkWrap: true,
                itemBuilder: (context, snapshot, animation, index){
                  var v = snapshot.value.toString();
                  g = v.replaceAll(
                            RegExp("{|}|description_survey: |name_survey: "), ""); // webfun, subscribe
                        g.trim();
                  l = g.split(','); 
                  return GestureDetector(
                    onTap: () {
                      
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => AddNewSurvey()
                      );
                      
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 15.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFB2BABB),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: Colors.indigo[100],
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Color.fromARGB(255, 255, 0, 0),
                            ),
                            onPressed: () {
                              ref.child(snapshot.key!).remove();
                            },
                          ),
                          title: Text(
                            l[1],
                            // 'dd',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            l[0],
                            // 'dd',

                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ),
                  );// [webfun,  subscribe}]
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
