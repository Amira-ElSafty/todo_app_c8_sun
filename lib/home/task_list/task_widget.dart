import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo_app_c8_sun/firebase_utils.dart';
import 'package:flutter_todo_app_c8_sun/list_provider/list_provider.dart';
import 'package:flutter_todo_app_c8_sun/model/task.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  TaskWidget({required this.task});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Slidable(
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          extentRatio: 0.25,
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),

          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
              onPressed: (context) {
                // delete task
                deleteTaskFromFireStore(task).timeout(Duration(milliseconds: 5),onTimeout: (){
                  print ('todo was deleted');
                  provider.getAllTasksFromFireStore();
                });
              },
              backgroundColor: MyThemeData.redColor,
              foregroundColor: MyThemeData.whiteColor,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: MyThemeData.whiteColor,
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              Container(
                color: MyThemeData.primaryLight,
                height: 80,
                width: 4,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      task.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: MyThemeData.primaryLight),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      task.description,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  )
                ],
              )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 21, vertical: 7),
                decoration: BoxDecoration(
                    color: MyThemeData.primaryLight,
                    borderRadius: BorderRadius.circular(15)),
                child: Icon(
                  Icons.check,
                  color: MyThemeData.whiteColor,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
