import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getWeatherData(String tenThanhPho) async {
  var thoiTiet5Ngay = [];

  var url = Uri.https('api.openweathermap.org', '/data/2.5/forecast', {
    'q': tenThanhPho,
    'units': 'metric',
    'appid': '7f63eb230577d98f1e53b43c5b9763e8',
    'lang': 'vi'
  });

  var response = await http.get(url);

  if (response.statusCode == 200) {
    String data = response.body;
    var decodeData = jsonDecode(data);
    thoiTiet5Ngay = decodeData['list'].map((forecast) {
      return {
        'time': forecast['dt_txt'],
        'temp': forecast['main']['temp'],
        'humidity': forecast['main']['humidity'],
        'wind_speed': forecast['wind']['speed'],
        'description': forecast['weather'][0]['description']
      };
    }).toList();
  } else {
    thoiTiet5Ngay = [
      {'error': 'Lỗi lấy dữ liệu'}
    ];
  }
  return thoiTiet5Ngay;
}
