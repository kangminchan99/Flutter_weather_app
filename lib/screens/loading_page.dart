import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/data/my_location.dart';
import 'package:weather/data/network.dart';
import 'package:weather/screens/weather_screen.dart';

const apikey = 'b6b1d4430ac7fd67b65f39b8c83c57b3';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late double latitude3;
  late double longitude3;

  // 3.LodingPage 로 넘어오면서 initState메서드가 호출되고 getLocation()를 호출
  //로딩이라는 StatefulWidget위젯이 생성되는 순간, 딱 한번만 호출되는 메서드
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  // 4.getLocation 클래스 내에서 MyLocation클래스를 사용하여 MyLocation 인스턴스를 생성하고,
  // MyLocation안에있는 getMyCurrentLocation을 호출한다.
  Future<void> getLocation() async {
    // my_location.dart파일의 getMyCurrentLocation()가져오기
    MyLocation myLocation = MyLocation();
    // getMyCurrentLocation메서드의 실행이 끝나서 위도와 경도값이 리턴될때까지 기다려야 하므로 await키워드를 사용한다.
    // await키워드는 반드시 Future의 값이 리턴 될 때까지 기다려야 하므로 기다려야 하는 Future의 값은 당연히
    // getMyCurrentLocation메서드 안에서이다.
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    NetWork network = NetWork(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longitude3&appid=$apikey');

    // parsing된 json데이터를 출력해주기 위해 var타입의 weatherdata라는 변수에다 network.getJsonData()를 넣어준다.
    // getJsonData는 Future<dynamic>타입으로 await키워드를 넣어준다.
    var weatherData = await network.getJsonData();
    print(weatherData);

    var airData = await network.getAirData();
    print(airData);
    // WeatherScreen으로 페이지 이동 시 parseWeatherData에 weatherData를 전달
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WeatherScreen(
                  parseWeatherData: weatherData,
                  parseAirPollution: airData,
                )));
  }

  // 인터넷에서 데이터 불러오기
  // void fetchData() async {

  //     // json데이터의 타입은 미리 예측을 할 수 없기 때문에, jsonDecode의 메소드 타입은
  //     // dynamic이다 그렇기 때문에 jsonDecode의 데이터 값을 변수로 받아오기 위해서는
  //     // var 키워드를 사용해야 한다.
  //     var myJson = parsingData['weather'][0]['description'];
  //     print(myJson);

  //     var wind = parsingData(jsonData)['wind']['speed'];
  //     print(wind);

  //     var id = parsingData(jsonData)['id'];
  //     print(id);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.black,
          size: 80,
        ),
      ),
    );
  }
}
