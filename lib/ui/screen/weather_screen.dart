import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onixtest/import_bloc.dart';
import 'package:onixtest/import_model.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherBloc _bloc = BlocProvider.of(context);
    _bloc.add(WeatherInitializationEvent());
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherOk) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(state.weather.city,
                      style: const TextStyle(fontSize: 33)),
                  Text(state.weather.temperature.toString(),
                      style: const TextStyle(fontSize: 64)),
                  TextButton(
                    onPressed: () {
                      if (state.weather.isCelsius()) {
                        _bloc.add(FahrenheitEvent());
                      } else {
                        _bloc.add(CelsiusEvent());
                      }
                    },
                    child: Text((state.weather.isCelsius()) ? "℃" : "℉"),
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

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/setting');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.settings),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
