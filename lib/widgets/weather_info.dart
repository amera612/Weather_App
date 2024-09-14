import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_info_cubit/get_info_cubit.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});
//🫵🏻🚗 to pass data from cubit by state🚗🫵🏻
  //final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetInfoCubit>(context).weatherModel;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 22, 139, 234),
            Color(0xFFB6DBF9),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at ${weatherModel.date.hour}: ${weatherModel.date.minute}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Image.asset('assets/images/rainy.png'),
                if (weatherModel.image.contains('https:'))
                  Image.network(weatherModel.image)
                else
                  Image.network('https:${weatherModel.image}'),

                Text(
                  weatherModel.temp.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'maxTemp: ${weatherModel.maxTemp.round()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'minTemp: ${weatherModel.minTemp.round()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            weatherModel.weatherCondition,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

// DateTime stringToDateTime(String value) {
//   return DateTime.parse(value);}
