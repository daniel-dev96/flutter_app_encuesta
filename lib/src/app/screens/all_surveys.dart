import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_app_encuesta/src/app/constant.dart';
import 'package:flutter_app_encuesta/src/app/models/task_data.dart';
import 'package:flutter_app_encuesta/src/app/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/dialog_body_widget.dart';

class AllSurveys extends StatelessWidget {
  const AllSurveys({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int cantSurveys = 0;
    var appBar = AppBar(
      backgroundColor: Colors.lightBlueAccent,
      elevation: 0.0,
      title: Text(
        'Listado',
        style: GoogleFonts.mcLaren(),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Center(
              child: Text(
            "0 Encuestas",
            textAlign: TextAlign.left,
            style: GoogleFonts.mcLaren(
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: cantSurveys == 0 ?
            Center(
              child: Text(
                "Tu lista de encuestas esta vacia!",
                style: GoogleFonts.mcLaren(
                  textStyle: kTextEmtystyle,
                ),
              ),
            )
          :
          ListView.builder(
            itemBuilder: (context, index) {
              return TaskTile(
                isChecked: false,
                taskTittle: "Name task",
                taskSubTitle: "Sub title",
                formatedDate: "07/10/2022",
                checkBoxCallBack: (checkboxState) {
                  // taskData.upDateTask(task);
                },
                // ontap: () => { taskData.alertMethod(context, task) },
                // onTextTap: () => taskData.dialogInfo(context, task),
              );
            },
            itemCount: 0,
          )
    );
  }

  void alertMethod(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      headerAnimationLoop: false,
      animType: AnimType.SCALE,
      showCloseIcon: true,
      closeIcon: Icon(Icons.close, color: Colors.lightBlueAccent
      ),
      btnCancelText: 'No',
      btnOkText: 'Yes',
      btnOkColor: Colors.lightBlueAccent,
      btnCancelColor: Colors.red[300],
      body: DialogBodyWidget(
        dialogTitle: "Delete Tassk?",
        dialogDesc: "Are you sure want to delete this task from the list?",
      ),
      btnCancelOnPress: () {},
      onDissmissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
      },
      btnOkOnPress: () {
        // _tasks.remove(task);
        // notifyListeners();
      },
      buttonsTextStyle: GoogleFonts.mcLaren(
        textStyle: KDialogButtonTextStyle,
      ),
    ).show();
  }

  void dialogInfo(BuildContext context) {
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      dialogType: DialogType.NO_HEADER,
  
      customHeader: Image.asset(
        'assets/logo.png',
        height: 78,
        width: 80,
        fit: BoxFit.cover,
      ),
      body: DialogBodyWidget(
        // dialogTitle: task.name,
        // dialogDesc: task.subname,
      ),
      btnOkOnPress: () {
        debugPrint('OnClcik');
      },
      btnOkColor: Colors.lightBlueAccent,
      btnOkIcon: Icons.check_circle,
       buttonsTextStyle: GoogleFonts.mcLaren(
        textStyle: KDialogButtonTextStyle,
      ),
    ).show();
  }
}

