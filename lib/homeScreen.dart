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
  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
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
    var uri = "${k.domain}lat=${position.latitude}&lon=${position
        .longitude}&appid=${k.apiKey}";
    var url=Uri.parse(uri);
    var response =await client.get(url);
    if(response.statusCode==200){
      var data= response.body;
      print(data);
    }
else{
  print(response.statusCode);
    }
  }
}
