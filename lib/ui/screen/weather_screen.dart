import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onixtest/import_bloc.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherBloc _bloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                return Text(state.weather.city,
                    style: const TextStyle(fontSize: 33));
              },
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                return Text(state.weather.temp.toString(),
                    style: const TextStyle(fontSize: 64));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bloc.add(GetWeatherEvent('Paris'));
          Navigator.pushNamed(context, '/setting');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.settings),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
