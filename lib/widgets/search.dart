import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

WeatherModel weatherModel;

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 44, 110, 224),
          title: const Text('Search a city'),
          // leading: IconButton(
          //   icon: const Icon(
          //     Icons.arrow_back_ios_new,
          //   ),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onFieldSubmitted: (value) async {
                //  value = value[0].toUpperCase +value.substring(1).toLowerCase;

                weatherModel =
                    await WeatherService(Dio()).getWeatherInfo(cityName: value);
                Navigator.of(context).pop;
                log(weatherModel.cityName);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 15,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.black)),
                hintText: 'City Name is',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
                labelText: 'Search',
                suffixIcon: const Icon(Icons.search_rounded),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
      ),
    );
  }
}
