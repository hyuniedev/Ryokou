import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _tenThanhPho;
  var _nhietDo;
  var _doAm;
  var _tocDoGio;
  var _moTa;

  void getData() async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': 'tokyo',
      'units': 'metric',
      'appid': 'efcdf5858123d9714d8332a2ea689359',
      'lang': 'vi'
    });

    var response = await http.get(url);

    setState(() {
      if (response.statusCode == 200) {
        String data = response.body;
        var decodeData = jsonDecode(data);

        _tenThanhPho = decodeData['name'];
        _nhietDo = decodeData['main']['temp'];
        _doAm = decodeData['main']['humidity'];
        _tocDoGio = decodeData['wind']['speed'];
        _moTa = decodeData['weather'][0]['description'];
      } else {
        _tenThanhPho = "Loi lay du lieu";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Du lieu thoi tiet'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "$_tenThanhPho",
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            Text(
              "Nhiet do: $_nhietDo do C",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              "Do am: $_doAm%",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              "Toc do gio: $_tocDoGio m/s",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              "Mo ta: $_moTa",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            ElevatedButton(
              onPressed: () => getData(),
              child: const Text(
                "Lay du lieu",
              ),
            )
          ],
        ),
      ),
    );
  }
}
