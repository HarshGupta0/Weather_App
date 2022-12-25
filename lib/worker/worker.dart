import 'package:http/http.dart' as http;
import 'dart:convert';
class worker
{
   String location;
  worker({this.location=''})
  {
    location=this.location;
  }
  String temp="";
  String humidity="";
  String air_speed="";
  String description="";
  String main="";
  Future<void> getdata()  async{
    try{
      var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=b7a989f4df53cb2c5f1ff8845aa0544d');
      http.Response response=await http.get(url);
      Map data=jsonDecode(response.body);
      //getting temp,humidity

      Map temp_data = data['main'];
      Map wind =data['wind'];
      String getair_speed=wind['speed'].toString();
      double gettemp =temp_data['temp']-273.5;
      String gethumidity = temp_data['humidity'].toString();
      // print(temp);

      //getting Description
      List weather_data =data['weather'];
      Map weather_main_data=weather_data[0];
      String getmain_des = weather_main_data['main'];
      String getdesc = weather_main_data['description'];

      // value dena
      temp=gettemp.toString();
      humidity=gethumidity;
      air_speed=getair_speed;
      description=getdesc;
      main=getmain_des;
    }catch(e)
     {
       temp="Error";
       humidity="Error";
       air_speed="Error";
       description="Error";
       main="Error";

     }
  }

}