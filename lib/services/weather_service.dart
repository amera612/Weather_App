import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '3e5dccdb995145e396a160636240509';
  WeatherService(this.dio);

  Future<WeatherModel> getWeatherInfo({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'there was an error try latter ';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('🤦🏻‍♀️ oops there was an error try later');
    }
  }
}
