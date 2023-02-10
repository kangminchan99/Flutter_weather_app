import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
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
  var date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    // json데이터의 타입은 미리 예측을 할 수 없기 때문에, jsonDecode의 메소드 타입은
    // dynamic이다 그렇기 때문에 jsonDecode의 데이터 값을 변수로 받아오기 위해서는
    // var 키워드를 사용해야 한다.
    // var myJson = weatherData['weather'][0]['description'];
    // print(myJson);

    double temp2 = weatherData['main']['temp'];
    temp = temp2.round();

    cityName = weatherData['name'];
    print(temp);
    print(cityName);
  }

  // 현재시간 불러오기
  // String 타입은 반드시 리턴값이 있어야한다.
  String getSystemTime() {
    var now = DateTime.now();
    // a - 오전/오후 표현
    return DateFormat('h:mm a').format(now);
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
      body: Stack(
        children: [
          Image.asset(
            'image/background.jpg',
            fit: BoxFit.cover,
            // 배경 꽉 채워주기
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              // 컬럼이 하단부에 위치하도록 spaceBetween를 사용해준다.
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Expanded - 확보할 수 있는 공간을 최대한으로 늘려주는 역할
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 150,
                          ),
                          Text(
                            'Seoul',
                            style: GoogleFonts.lato(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Row(
                            children: [
                              // Bilder위젯은 반드시 위젯을 리턴해 줘야 한다.
                              TimerBuilder.periodic(
                                const Duration(minutes: 1),
                                builder: (context) {
                                  print(getSystemTime());
                                  return Text(
                                    getSystemTime(),
                                    style: GoogleFonts.lato(
                                        fontSize: 16, color: Colors.white),
                                  );
                                },
                              ),
                              Text(
                                DateFormat(' - EEEE d MMM, yyy').format(date),
                                style: GoogleFonts.lato(
                                    fontSize: 16, color: Colors.white),
                              ),
                              // Text(
                              //   DateFormat('d MMM, yyy').format(
                              //     date,
                              //   ),
                              //   style:
                              //       GoogleFonts.lato(fontSize: 16, color: Colors.white),
                              // )
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // 기온과 함께 유니코드 넣어주기
                            '18\u2103',
                            style: GoogleFonts.lato(
                                fontSize: 85,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('svg/climacon-sun.svg'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'clear sky',
                                style: GoogleFonts.lato(
                                    fontSize: 16, color: Colors.white),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Divider(
                      height: 15,
                      thickness: 2,
                      color: Colors.white,
                    ),
                    Row(
                      // 3개의 컬럼에 동일한 간격을 주기위해 MainAxisAlignment.spaceBetween 사용
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'AQI(대기질 지수)',
                              style: GoogleFonts.lato(
                                  fontSize: 14, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'image/bad.png',
                              width: 37,
                              height: 35,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '매우 나쁨',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '미세먼지',
                              style: GoogleFonts.lato(
                                  fontSize: 14, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '174.75',
                              style: GoogleFonts.lato(
                                  fontSize: 24, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'µg/m³',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '초미세먼지',
                              style: GoogleFonts.lato(
                                  fontSize: 14, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '84.03',
                              style: GoogleFonts.lato(
                                  fontSize: 24, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'µg/m³',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
