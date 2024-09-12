import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/blocs/weather_bloc.dart';
import 'package:weather_app/widgets/custom_container.dart';
import 'package:weather_app/widgets/new_text_widget.dart';
import 'package:weather_app/widgets/row_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const CustomContainer(
                alignmentDirectional: AlignmentDirectional(8, -0.3),
                height: 300,
                weight: 300,
                color: Colors.deepPurple,
                boxShape: BoxShape.circle,
              ),
              const CustomContainer(
                alignmentDirectional: AlignmentDirectional(-8, -0.3),
                height: 300,
                weight: 300,
                color: Colors.deepPurple,
                boxShape: BoxShape.circle,
              ),
              const Positioned(
                top: 10,
                child: CustomContainer(
                  alignmentDirectional: AlignmentDirectional(0, 1.5),
                  height: 250,
                  weight: 300,
                  color: Colors.orange,
                  boxShape: BoxShape.rectangle,
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherSuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '📍 ${state.weather.areaName}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Good Morning',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          getWeatherIcon(state.weather.weatherConditionCode!),
                          NewTextWidget(
                            text:
                                '${state.weather.temperature!.celsius!.round()}°C',
                            fontSize: 55,
                          ),
                          NewTextWidget(
                            text: state.weather.weatherMain!.toUpperCase(),
                            fontSize: 25,
                          ),
                          NewTextWidget(
                            text: DateFormat('EEEE dd •')
                                .add_jm()
                                .format(state.weather.date!),
                            fontSize: 18,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RowWidget(
                                text: 'Sunrise',
                                imagePath: 'assets/11.png',
                                time: DateFormat()
                                    .add_jm()
                                    .format(state.weather.sunrise!),
                              ),
                              RowWidget(
                                text: 'Sunset',
                                imagePath: 'assets/12.png',
                                time: DateFormat()
                                    .add_jm()
                                    .format(state.weather.sunset!),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RowWidget(
                                text: 'Temp max',
                                imagePath: 'assets/13.png',
                                time:
                                    '${state.weather.tempMax!.celsius!.round()} °C',
                              ),
                              RowWidget(
                                text: 'Temp min',
                                imagePath: 'assets/14.png',
                                time:
                                    '${state.weather.tempMin!.celsius!.round()} °C',
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  } else {
                    return const SnackBar(
                        content: Text('Weather data loading failed'));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('assets/1.png');
      case >= 300 && < 400:
        return Image.asset('assets/2.png');
      case >= 500 && < 600:
        return Image.asset('assets/3.png');
      case >= 600 && < 700:
        return Image.asset('assets/4.png');
      case >= 700 && < 800:
        return Image.asset('assets/5.png');
      case == 800:
        return Image.asset('assets/6.png');
      case > 800 && <= 804:
        return Image.asset('assets/7.png');
      default:
        return Image.asset('assets/7.png');
    }
  }
}
