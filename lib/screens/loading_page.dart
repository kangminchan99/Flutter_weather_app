import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
// JSON parsing을 위해 import
import 'dart:convert';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  //로딩이라는 StatefulWidget위젯이 생성되는 순간, 딱 한번만 호출되는 메서드
  @override
  void initState() {
    super.initState();
    getLocation();
    fetchData();
  }

  Future<void> getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
    } catch (e) {
      print('There was a problem with the internet connection.');
    }
  }

  // 인터넷에서 데이터 불러오기
  void fetchData() async {
    http.Response response = await http.get(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1'));

    //open weather map으로 부터 데이터를 가져올 때 문제가 생길 경우를 대비하기 위해 if문으로 statuscode가
    //200일 경우 날씨 데이터를 출력하고, 그렇지 않고 문제 발생시 해당 statuscode출력
    if (response.statusCode == 200) {
      // 전달 된 jsonData를 효율적으로 사용하기 위해 String타입의 jsonData라는 변수에 담아준다.
      String jsonData = response.body;

      // json데이터의 타입은 미리 예측을 할 수 없기 때문에, jsonDecode의 메소드 타입은
      // dynamic이다 그렇기 때문에 jsonDecode의 데이터 값을 변수로 받아오기 위해서는
      // var 키워드를 사용해야 한다.
      var myJson = jsonDecode(jsonData)['weather'][0]['description'];
      print(myJson);

      var wind = jsonDecode(jsonData)['wind']['speed'];
      print(wind);

      var id = jsonDecode(jsonData)['id'];
      print(id);
    }
    // uri 링크에서 제공하는 데이터와 같은 데이터를 가져오는 것을 볼 수 있다.
    // response.statusCode가 200이면 ok라는 뜻임.
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: null,
          child: Text(
            'Get my location',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
