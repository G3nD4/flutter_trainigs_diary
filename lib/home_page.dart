import 'package:flutter/material.dart';
import 'package:sport_app/stopwatch_screen/stopwatch_screen.dart';
import 'package:sport_app/trainings/screens/trainings_screen.dart';

import 'common_widgets/common_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late final List<Widget> _screens;
  @override
  void initState() {
    _screens = <Widget>[
      const StopwatchScreen(),
      const TrainingsScreen(),
    ];
    super.initState();
  }

  static const List<String> _titles = ['Stopwatch', 'Trainings diary'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: _titles.elementAt(_selectedIndex)),
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined),
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'Trainings diary',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
