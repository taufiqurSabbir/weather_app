import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/RestApi.dart';
import 'dart:convert';

import 'package:weather_app/Style/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherFetch('Rangpur');
  }


  // Map<String,dynamic>weathermap={
  //   'weather_name':'',
  // 'description':'',
  // 'name':'',
  // 'temp_min':'',
  // 'temp_max':''
  // };

  void weatherFetch(String location) async {
    weatherdata(location);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    print(weatherdata('Dhaka'));
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Weather'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [colordeepPurple, colordeepPurple, color2nd])),
        child: Padding(
          padding: const EdgeInsets.only(top: 90.0),
          child: Column(
            children: [
              Text(
                '',
                style: TextStyle(color: Colors.white, fontSize: 38),
              ),
              Text(
                'Updated: 3:38 pm',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/sun.png'),
                  Text(
                    '7',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Column(
                    children: [
                      Text(
                        'Max:10',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Min:10',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Sunny',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
