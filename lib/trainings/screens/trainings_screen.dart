import 'package:flutter/material.dart';
import 'package:sport_app/trainings/screens/diary_screen.dart';
import 'package:sport_app/trainings/screens/trainings_list_screen.dart';

class TrainingsScreen extends StatelessWidget {
  const TrainingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Diary',
              ),
              Tab(
                text: 'Trainings',
              ),
            ],
          ),
        body: TabBarView(
          children: <Widget>[
            DiaryScreen(),
            TrainingsListScreen(),
          ],
        ),
      ),
    );
  }
}
