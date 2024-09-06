import 'package:flutter/material.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/search.dart';
import 'package:weather_app/widgets/weather_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                    return const Search();
                  }),
                );
              },
              icon: const Icon(Icons.search_rounded),
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 44, 110, 224),
        ),
        body: const NoWeather(),
      ),
    );
  }
}
