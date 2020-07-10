import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

    double longitude;
    double latitude;
    @override
    void initState(){
       getLocation();
      super.initState();

     // getLocation();
      //getData();
    }
    
     void getLocation() async{

       Location location = Location();
       await location.getLocation();

       latitude = location.latitude;
       longitude = location.longitude;

      var weather = await WeatherModel().getLocationWeather();

       Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(
          locationWeather:weather
        )));

         
      }

   
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body:Center(
        // child: SpinKitDoubleBounce(
        //    color:Colors.white,
        //    size:100.0,
        //  ) 
          
      )
    );
  }
}
