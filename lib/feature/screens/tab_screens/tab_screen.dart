import 'package:flutter/material.dart';

import '../all_task_screen/add_task_screen.dart';
import 'complete_task_screen.dart';
import 'favorite_task_screen.dart';
import '../my_drawer.dart';
import 'pending_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const id = 'tab_screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': PendingScreen(), 'title': 'Pending Tasks'},
    {'pageName': CompletedScreen(), 'title': 'Completed Tasks'},
    {'pageName': FavoriteScreen(), 'title': 'Favorite Tasks'},
  ];

  var _selectPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddTaskScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectPageIndex]['title']),
        actions: [
          IconButton(
              onPressed: () {
                _addTask(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectPageIndex]['pageName'],
      floatingActionButton: _selectPageIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                _addTask(context);
              },
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectPageIndex,
        onTap: (index) {
          setState(() {
            _selectPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle_outlined),
            label: 'Pending Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completed Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite Tasks',
          )
        ],
      ),
    );
  }
}
