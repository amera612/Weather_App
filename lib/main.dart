import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_info_cubit/get_info_cubit.dart';
import 'package:weather_app/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetInfoCubit(),
      child: MaterialApp(
        theme: ThemeData(),
        home: const HomePage(),
      ),
    );
  }
}
