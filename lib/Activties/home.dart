import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:mausam_k_haal/worker/worker.dart';
import 'package:mausam_k_haal/Activties/Loading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();

}

class _homeState extends State<home> {
  void pushing(){
    Future.delayed(Duration(seconds: 2),(){Navigator.pushNamed(context, '/loading');});
  }
  @override
  void initState() {
    // TODO: implement initState
    pushing();
    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(

          body: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Center(child:  Container(
                 margin: EdgeInsets.all(30),
                 height: 290,
                 width:290,
                 child: Image.asset('images/imgw.jfif'),),),
                SpinKitWave(
                  color: Colors.blue.shade300,
                  size: 65.0,
                ),
                SizedBox(height: 30,),
                Text("WEATHER APP",style: TextStyle(color: Colors.grey.shade600,fontSize: 30,),),
                SizedBox(height: 30,),
                Text('MADE BY HARSH'),

              ],
            ),
          ),
        ),
    );
  }
}
