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
          ],
        ),
      ),
    );
  }
}
