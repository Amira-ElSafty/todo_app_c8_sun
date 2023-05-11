import 'package:flutter/material.dart';
import 'package:flutter_todo_app_c8_sun/home/settings/settings_tab.dart';
import 'package:flutter_todo_app_c8_sun/home/task_list/add_task_bottom_sheet.dart';
import 'package:flutter_todo_app_c8_sun/home/task_list/task_list_tab.dart';

import '../my_theme.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex:selectedIndex ,
          onTap: (index){
            selectedIndex = index ;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/task_list_icon.png')
                ),
              label:'Task List'
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage('assets/images/settings_icon.png')
                ),
                label:'Settings'
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showAddTaskBottomSheet();
        },
        child: Icon(Icons.add,size: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
          side: BorderSide(
            color: MyThemeData.whiteColor,
            width: 4,
          )
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }
  List<Widget> tabs = [TaskListTab(),SettingsTab()];
  void showAddTaskBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context) => AddTaskBottomSheet()
    );
  }
}
