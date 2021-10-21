import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onixtest/import_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherBloc _bloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherOk) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: state.weather.city,
                    ),
                    onSubmitted: (text) {
                      _bloc.add(GetByCityWeatherEvent(text));
                      Navigator.pop(context);
                    },
                  ),
                  Text((state.weather.isCelsius()) ? "℃" : "℉",
                      style: const TextStyle(fontSize: 33)),
                  Switch(
                    value: state.weather.isCelsius(),
                    onChanged: (value) {
                      if (state.weather.isCelsius()) {
                        _bloc.add(FahrenheitEvent());
                      } else {
                        _bloc.add(CelsiusEvent());
                      }
                    },
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
