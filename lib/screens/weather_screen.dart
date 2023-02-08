import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      // 바디를 앱바 뒤의 위치까지 확장시켜 앱바를 숨기기
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('weather'),
        // 앱바 색상 사라지게 하기
        backgroundColor: Colors.transparent,
        // 음양 없애기
        elevation: 0,
        // 좌측 아이콘은 leading을 사용하고 우측 아이콘은 actions를 사용한다.
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.near_me),
          iconSize: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.location_searching),
            iconSize: 30,
          )
        ],
      ),
      body: Container(
        // Stack은 쌓아 올린다는 의미
        child: Stack(
          children: [
            Image.asset(
              'assets/image/background.jpg',
              fit: BoxFit.cover,
              // // 배경 꽉 채워주기
              // width: double.infinity,
              // height: double.infinity,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Seoul',
                    // style: GoogleFonts.lato(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
