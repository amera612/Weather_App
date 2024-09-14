import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_info_cubit/get_info_cubit.dart';
import 'package:weather_app/cubits/get_info_cubit/get_info_states.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/search.dart';
import 'package:weather_app/widgets/weather_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const SearchPage();
                  }),
                );
              },
              icon: const Icon(Icons.search_rounded),
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 44, 110, 224),
        ),

        // integrate && lisent to cubit🫵🏻🫵🏻🫵🏻
        body: BlocBuilder<GetInfoCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return const NoWeather();
            } else if (state is LoadedWeatherState) {
              return const WeatherInfo();
            } else {
              return const Text('sorry! there is an error try again');
            }
          },
        ),
      ),
    );
  }
}
