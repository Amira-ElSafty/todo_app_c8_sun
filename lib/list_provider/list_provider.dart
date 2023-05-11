import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_c8_sun/firebase_utils.dart';
import 'package:flutter_todo_app_c8_sun/model/task.dart';

class ListProvider extends ChangeNotifier{
  List<Task> taskList = [];
  DateTime selectedDate = DateTime.now();


  getAllTasksFromFireStore()async{
    /// get all tasks
    QuerySnapshot<Task> querySnapshot = await getTaskCollection().get();
    /// List<Task>   => List<QueryDocumentSnapShot<Task>>
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    /// filter task list (selected date )
    /// (10/5/2023)
    taskList = taskList.where((task){
      DateTime taskDate = DateTime.fromMillisecondsSinceEpoch(task.date);
      if(selectedDate.day == taskDate.day &&
      selectedDate.month == taskDate.month &&
      selectedDate.year == taskDate.year){
        return true ;
      }
      return false ;
    }).toList();

    //// sorting
    taskList.sort((Task task1 , Task task2){
      DateTime date1 = DateTime.fromMillisecondsSinceEpoch(task1.date);
      DateTime date2 = DateTime.fromMillisecondsSinceEpoch(task2.date);
      return date1.compareTo(date2);
    });

    notifyListeners();
  }

  void setNewSelectedDate(DateTime newDate){
    selectedDate = newDate ;
    getAllTasksFromFireStore();
  }




}