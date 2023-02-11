import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/screens/weather_screen.dart';

class Model {
  // 메서드 타입이 위젯인 이유는 각 날씨의 상태를 수치화 하여 그 수치에 맞는 svg이미지를 불러오기 위해
  Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        'svg/climacon-cloud_lightning.svg',
        // ignore: deprecated_member_use
        color: Colors.black,
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'svg/climacon-cloud_snow_alt.svg',
        // ignore: deprecated_member_use
        color: Colors.black,
      );
    } else if (condition == 800) {
      return SvgPicture.asset(
        'svg/climacon-sun.svg',
        // ignore: deprecated_member_use
        color: Colors.black,
      );
    } else if (condition <= 804) {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        // ignore: deprecated_member_use
        color: Colors.black,
      );
    }
    return getWeatherIcon(condition);
  }

  Widget getAirIcon(int index) {
    if (index == 1) {
      return Image.asset(
        'image/good.png',
        width: 37,
        height: 35,
      );
    } else if (index == 2) {
      return Image.asset(
        'image/fair.png',
        width: 37,
        height: 35,
      );
    } else if (index == 3) {
      return Image.asset(
        'image/moderate.png',
        width: 37,
        height: 35,
      );
    } else if (index == 4) {
      return Image.asset(
        'image/poor.png',
        width: 37,
        height: 35,
      );
    } else if (index == 5) {
      return Image.asset(
        'image/bad.png',
        width: 37,
        height: 35,
      );
    }
    return getAirIcon(index);
  }

  Widget getAirCondition(int index) {
    if (index == 1) {
      return const Text(
        '매우좋음',
        style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
      );
    } else if (index == 2) {
      return const Text(
        '좋음',
        style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
      );
    } else if (index == 3) {
      return const Text(
        '보통',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      );
    } else if (index == 4) {
      return const Text(
        '나쁨',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      );
    } else if (index == 5) {
      return const Text(
        '매우나쁨',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      );
    }
    return getAirCondition(index);
  }
}
