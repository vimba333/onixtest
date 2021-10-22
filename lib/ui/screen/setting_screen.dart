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
        backgroundColor: const Color(0xff363f56),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/w2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 55),
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherOk) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(state.weather.unitsFormat,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 33)),
                      Switch(
                        value: state.weather.isCelsius(),
                        activeColor: Colors.white,
                        onChanged: (value) {
                          if (state.weather.isCelsius()) {
                            _bloc.add(FahrenheitEvent());
                          } else {
                            _bloc.add(CelsiusEvent());
                          }
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: TextField(
                          textCapitalization: TextCapitalization.sentences,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: state.weather.city,
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            hintStyle: const TextStyle(color: Colors.white),
                          ),
                          onSubmitted: (text) {
                            _bloc.add(GetByCityWeatherEvent(text));
                            Navigator.pop(context);
                          },
                          style: const TextStyle(
                              color: Colors.white, fontSize: 33),
                        ),
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
        ),
      ),
    );
  }
}
