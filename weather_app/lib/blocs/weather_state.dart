part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
}

final class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

final class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

final class WeatherError extends WeatherState {
  final String message;

  WeatherError({required this.message});

  @override
  List<Object> get props => [message];
}

final class WeatherSuccess extends WeatherState {
  final Weather weather;

  WeatherSuccess({required this.weather});

  @override
  List<Object> get props => [weather];
}
