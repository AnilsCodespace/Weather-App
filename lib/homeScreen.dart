import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'constants.dart' as k;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoaded = false;
  late num temp;
  late num pressure;
  late num hue;
  late num cover;
  late String city;

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff03a9f4),
          Color(0xff4caf50),
          Color(0xff9c27b0)
        ], begin: Alignment.bottomLeft, end: FractionalOffset.topRight)),
        child: Visibility(
          visible: isLoaded,
          child: Column(
          ),replacement: Center(
          child: ,
        ),
        ),
      ),
    ));
  }

  getCurrentLocation() async {
    var p = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
        forceAndroidLocationManager: true);
    if (p != null) {
      print('Lat:${p.latitude},Long:${p.longitude}');
      getCurrentCityWeather(p);
    } else {
      print("Data Unavailable");
    }
  }

  getCurrentCityWeather(Position position) async {
    var client = http.Client();
    var uri =
        "${k.domain}lat=${position.latitude}&lon=${position.longitude}&appid=${k.apiKey}";
    var url = Uri.parse(uri);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }
}
