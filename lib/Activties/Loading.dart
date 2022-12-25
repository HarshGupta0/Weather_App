import 'package:flutter/material.dart';
import 'package:mausam_k_haal/worker/worker.dart';
String city ="lucknow";
String city2='';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  TextEditingController searchController= new TextEditingController();
  String Temperature = "Loading";
  String des = 'Loading';
  String hum = 'Loading';
  String main = 'Loading';
  String air_speed = 'Loading';
  void startApp() async {
    worker instance = worker(location: city);
    await instance.getdata();
    setState(() {
      Temperature = (instance.temp).substring(0,5);
      des = instance.description;
      hum = instance.humidity;
      main = instance.main;
      air_speed = (instance.air_speed);
// Navigator.pushReplacementNamed(context, '/home',arguments:{
//   "temp_value":Temperature,
//   "hum_value":hum,
//   "air_speed_value":air_speed,
// "des_value":des,
// "main_value":main
// });
    });
    print(instance.temp);
  }
  // String loca='';

  @override
  void initState() {
    // TODO: implement initState
    startApp();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        body: Container(

          height: double.infinity,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bcimg.jfif'),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // Colors.orange.shade200,
                    // Colors.orange.shade100,
                    // Colors.orange.shade50,
                    // Colors.blue.shade900,
                    Colors.blue.shade700,
                    Colors.blue.shade500,
                    Colors.blue.shade300,
                    Colors.blue.shade300,
                    Colors.blue.shade200,
                    Colors.blue.shade200,
                    Colors.blue.shade100,
                    // Colors.blue.shade50,
                    // Colors.purple.shade50,
                    // Colors.purple.shade50,
                    // Colors.black12,
                    // Colors.grey.shade100,
                  ]),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                      height: 60,
                      padding: EdgeInsets.only(right: 5, left: 20),
                      margin: EdgeInsets.only(top: 20, right: 30, left: 30),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          // border:Border(20),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              city2=searchController.text;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Loading2()),
                              );
                              

                            },
                            child: Container(child: Icon(Icons.search,size: 38,),
                            margin: EdgeInsets.fromLTRB(3, 0, 7,0),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: 'search city Ex:-Lucknow',
                                    border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 80,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(
                              top: 20, left: 30, right: 30, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.blue.shade300.withOpacity(.4),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.cloud, size: 35,color: Colors.blue.shade50,),
                                  Text('The weather in $city',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(
                              top: 20, left: 30, right: 30, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.green.shade300.withOpacity(.5),
                              borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Text('TEMPERATURE',style:TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                                SizedBox(height: 25,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.thermostat_rounded, size: 60,color: Colors.blue.shade50,),
                                    Text(' $Temperature   C',
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,),),

                                  ],
                                ),
                                SizedBox(height: 15,),
                                Text('In Celsius',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade50,),),
                              ],
                            ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 160,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(
                              top: 20, left: 30, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade400.withOpacity(.5),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Text('AIR SPEED',style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.speed, size: 35,color: Colors.blue.shade50,),
                                  Text(' $air_speed',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade50,),),
                                ],
                              ),
                              SizedBox(height: 15,),
                              Text('Miles/hr',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade50,),),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(
                              top: 20, left: 10, right: 30, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade400.withOpacity(.5),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Text('FEELS LIKE',style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.air, size: 35,color: Colors.blue.shade50,),
                                  Text(' $main',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade50,),),
                                ],
                              ),
                              SizedBox(height: 15,),
                              Text('Good to go',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade50,),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(
                              top: 20, left: 50, right: 50, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.green.shade300.withOpacity(.4),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Text('HUMIDITY',style:TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.sunny_snowing, size: 40,color: Colors.blue.shade50,),
                                  Text('$hum  %',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade50,),),

                                ],
                              ),
                              SizedBox(height: 15,),
                              Text('Plan Your Day',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade50,),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade400.withOpacity(.4),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text('You are the sky. Everything else – it’s just the weather.. (@^_^@)',style: TextStyle(fontSize: 20,color:Colors.white,),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Powered By Open Wheather API',
                            style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Made By HARSH',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class Loading2 extends StatefulWidget {
  const Loading2({Key? key}) : super(key: key);

  @override
  State<Loading2> createState() => _Loading2State();
}

class _Loading2State extends State<Loading2> {

  // TextEditingController searchController= new TextEditingController();
  String Temperature2 = "Loading";
  String des2 = '"Loading';
  String hum2 = '"Loading';
  String main2 = '"Loading';
  String air_speed2= '"Loading';
  void startApp2() async {
    worker instance2 = worker(location: city2);
    await instance2.getdata();
    setState(() {
      Temperature2 = (instance2.temp).substring(0,5);
      des2= instance2.description;
      hum2 = instance2.humidity;
      main2 = instance2.main;
      air_speed2 = (instance2.air_speed).substring(0,4);
// Navigator.pushReplacementNamed(context, '/home',arguments:{
//   "temp_value":Temperature,
//   "hum_value":hum,
//   "air_speed_value":air_speed,
// "des_value":des,
// "main_value":main
// });
    });
    print(instance2.temp);
  }

  @override
  void initState() {
    // TODO: implement initState
    startApp2();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        body: Container(
          height: double.infinity,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // Colors.orange.shade200,
                    // Colors.orange.shade100,
                    // Colors.orange.shade50,
                    // Colors.blue.shade900,
                    Colors.blue.shade700,
                    Colors.blue.shade500,
                    Colors.blue.shade300,
                    Colors.blue.shade300,
                    Colors.blue.shade200,
                    Colors.blue.shade200,
                    Colors.blue.shade100,
                    // Colors.blue.shade50,
                    // Colors.purple.shade50,
                    // Colors.purple.shade50,
                    // Colors.black12,
                    // Colors.grey.shade100,
                  ]),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // Container(
                  //     height: 60,
                  //     padding: EdgeInsets.only(right: 5, left: 20),
                  //     margin: EdgeInsets.only(top: 20, right: 30, left: 30),
                  //     decoration: BoxDecoration(
                  //         color: Colors.blue.shade50,
                  //         // border:Border(20),
                  //         borderRadius: BorderRadius.circular(30)),
                  //     child: Row(
                  //       children: [
                  //         GestureDetector(
                  //           onTap: (){
                  //             city=searchController.text;
                  //
                  //           },
                  //           child: Container(child: Icon(Icons.search),
                  //             margin: EdgeInsets.fromLTRB(3, 0, 7,0),
                  //           ),
                  //         ),
                  //         Expanded(
                  //           child: TextField(
                  //             decoration: InputDecoration(
                  //               hintText: 'search city Ex:-Lucknow',
                  //               border: InputBorder.none,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     )),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 80,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(
                              top: 20, left: 30, right: 30, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.cloud, size: 30,color: Colors.blue.shade50,),
                                  Text('The weather in $city2',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade100,),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(
                              top: 20, left: 30, right: 30, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Text('TEMPERATURE',style:TextStyle(fontSize: 25,color: Colors.blue.shade700,fontWeight: FontWeight.bold),),
                              SizedBox(height: 25,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.thermostat_rounded, size: 60,color: Colors.blue.shade50,),
                                  Text(' $Temperature2   C',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade100,),),

                                ],
                              ),
                              SizedBox(height: 15,),
                              Text('In Celsius',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade50,),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 160,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(
                              top: 20, left: 30, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Text('AIR SPEED',style:TextStyle(fontSize: 20,color: Colors.blue.shade700,fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.speed, size: 30,color: Colors.blue.shade50,),
                                  Text(' $air_speed2',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade50,),),
                                ],
                              ),
                              SizedBox(height: 15,),
                              Text('Miles/hr',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade50,),),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(
                              top: 20, left: 10, right: 30, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Text('FEELS LIKE',style:TextStyle(fontSize: 20,color: Colors.blue.shade700,fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.air, size: 30,color: Colors.blue.shade50,),
                                  Text(' $main2',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade50,),),
                                ],
                              ),
                              SizedBox(height: 15,),
                              Text('Good to go',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade50,),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(
                              top: 20, left: 50, right: 50, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Text('HUMIDITY',style:TextStyle(fontSize: 20,color: Colors.blue.shade700,fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.sunny_snowing, size: 30,color: Colors.blue.shade50,),
                                  Text('$hum2  %',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade50,),),

                                ],
                              ),
                              SizedBox(height: 15,),
                              Text('Plan Your Day',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade50,),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text('You are the sky. Everything else – it’s just the weather.. (@^_^@)',style: TextStyle(fontSize: 20,color: Colors.blue.shade700,),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
