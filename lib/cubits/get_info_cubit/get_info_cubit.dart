import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_info_cubit/get_info_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetInfoCubit extends Cubit<WeatherState> {
  GetInfoCubit(super.initialState);

  getWeather({required String cityName}) async {
    WeatherModel weatherModel =
        await WeatherService(Dio()).getWeatherInfo(cityName: cityName);
  }
}
