import 'package:flutter/material.dart';
import 'package:flutter_todo_app_c8_sun/firebase_utils.dart';
import 'package:flutter_todo_app_c8_sun/list_provider/list_provider.dart';
import 'package:flutter_todo_app_c8_sun/model/task.dart';
import 'package:provider/provider.dart';

class AddTaskBottomSheet extends StatefulWidget{
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = '';

  String description = '';

  DateTime selectedDate = DateTime.now();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static String insert = 'Isnert into customer ';

  late ListProvider provider ;

  @override
  Widget build(BuildContext context) {
     provider = Provider.of<ListProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text('Add Task',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Form(
              key: formKey,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                onChanged: (text){
                  title = text ;
                },
                validator: (text){
                  if(text == null || text.isEmpty){
                    return 'Please enter task title';
                  }
                  return null ;
                },
                decoration: InputDecoration(
                  labelText: 'Enter Task Title'
                ),
              ),
              TextFormField(
                onChanged: (text){
                  description = text ;
                },
                validator: (text){
                  if(text == null || text.isEmpty){
                    return 'Please enter task description';   // invalid
                  }
                  return null ;  /// validate
                },
                decoration: InputDecoration(
                  labelText: 'Enter Task Description',
                ),
                minLines: 4,
                maxLines: 4,
              ),
              SizedBox(height: 12,),
              Text('Selected Day',
                  style: Theme.of(context).textTheme.subtitle1
              ),
              InkWell(
                onTap: (){
                  chooseDate();
                },
                child: Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,),
              ),
              SizedBox(height: 12,),
              ElevatedButton(
                  onPressed: (){
                    addTask();
                  },
                  child: Text('Add',
                    style: Theme.of(context).textTheme.headline1,
                  ))
            ],
          )),
        ],
      ),
    );
  }

  void addTask() {
    if(formKey.currentState?.validate() == true){
      /// add task
      Task task = Task(
          title: title,
          description: description,
          date: selectedDate.millisecondsSinceEpoch
      );
      addTaskToFireStore(task).timeout(Duration(milliseconds: 500),onTimeout: (){
        print('todo was added');
        provider.getAllTasksFromFireStore();
        Navigator.pop(context);
      });
    }
  }

  void chooseDate()async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if(chosenDate != null){
      selectedDate = chosenDate ;
      setState(() {

      });
    }
  }
}
