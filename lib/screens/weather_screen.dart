import 'package:flutter/material.dart';
import 'loading_page.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({required this.parseWeatherData, super.key});
  final parseWeatherData;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    // // json데이터의 타입은 미리 예측을 할 수 없기 때문에, jsonDecode의 메소드 타입은
    // // dynamic이다 그렇기 때문에 jsonDecode의 데이터 값을 변수로 받아오기 위해서는
    // // var 키워드를 사용해야 한다.
    // var myJson = weatherData['weather'][0]['description'];
    // print(myJson);

    double temp2 = weatherData['main']['temp'];
    temp = temp2.round();

    cityName = weatherData['name'];
    print(temp);
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$cityName'),
          SizedBox(
            height: 10,
          ),
          Text('$temp')
        ],
      )),
    );
  }
}
