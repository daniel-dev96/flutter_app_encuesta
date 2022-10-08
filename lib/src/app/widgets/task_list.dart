import 'package:flutter_app_encuesta/src/app/constant.dart';
import 'package:flutter_app_encuesta/src/app//models/task_data.dart';
import 'package:flutter_app_encuesta/src/app//widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int countSurveys = 3;
    return(
      countSurveys == 0 ?
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
            taskTittle: 'task name',
            taskSubTitle: 'subtitle',
            isChecked: false,
            checkBoxCallBack: (checkBoxState) {
              // taskData.upDateTask(task);
            },
            ontap: () {
              // taskData.alertMethod(context, task);
            },
            onTextTap: () {
            //  taskData.dialogInfo(context, task);
            },
          );
        },
        itemCount: 3,
      )
    );
  }

}
