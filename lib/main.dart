import 'package:flutter/material.dart';
import 'package:mausam_k_haal/Activties/home.dart';
import 'package:mausam_k_haal/Activties/Location.dart';
import 'package:mausam_k_haal/Activties/Loading.dart';
import 'package:http/http.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
    routes: {
        "/" : (context)=> home(),
      // "/home": (context)=> home(),
      "/loading":(context)=>Loading(),
      "/location":(context)=>Location(),
    },
  ),);
}
