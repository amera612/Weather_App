import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class LoadedWeatherState extends WeatherState {
  final WeatherModel weatherModel;
  LoadedWeatherState(this.weatherModel);
}

class MissingWeatherState extends WeatherState {
  final String errorMessage;

  MissingWeatherState(this.errorMessage);
}
