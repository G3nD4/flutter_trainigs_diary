import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/home_page.dart';
import 'package:sport_app/trainings/bloc/trainings_bloc.dart';
import 'package:sport_app/trainings/cubit/dated_trainings_cubit.dart';

void main() {
  runApp(const SportApp());
}

class SportApp extends StatelessWidget {
  const SportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TrainingsBloc>(
          create: (context) => TrainingsBloc(),
        ),
        BlocProvider(
          create: (context) => DatedTrainingsCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Training diary',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            // primary: Colors.white
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
