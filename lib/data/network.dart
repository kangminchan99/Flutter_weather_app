import 'package:http/http.dart' as http;
// JSON parsing을 위해 import
import 'dart:convert';

class NetWork {
  // 클래스에서 인스턴스가 생성될 때 생성자를 통해 url입력받기
  final String url;
  final String url2;
  NetWork(this.url, this.url2);

  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url));

    //open weather map으로 부터 데이터를 가져올 때 문제가 생길 경우를 대비하기 위해 if문으로 statuscode가
    //200일 경우 날씨 데이터를 출력하고, 그렇지 않고 문제 발생시 해당 statuscode출력
    if (response.statusCode == 200) {
      // 전달 된 jsonData를 효율적으로 사용하기 위해 String타입의 jsonData라는 변수에 담아준다.
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }

  Future<dynamic> getAirData() async {
    http.Response response = await http.get(Uri.parse(url2));

    //open weather map으로 부터 데이터를 가져올 때 문제가 생길 경우를 대비하기 위해 if문으로 statuscode가
    //200일 경우 날씨 데이터를 출력하고, 그렇지 않고 문제 발생시 해당 statuscode출력
    if (response.statusCode == 200) {
      // 전달 된 jsonData를 효율적으로 사용하기 위해 String타입의 jsonData라는 변수에 담아준다.
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}
