import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
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
    super.initState();
    weatherFuntion('London');
    setState(() {});
  }

  final TextEditingController locationcon = TextEditingController();

  bool inProgress = false;
  final time = DateFormat('hh:mm a').format(DateTime.now());

  List<weather> weatherdata = [];

  void weatherFuntion(String location) async {
    inProgress = true;
    const apiKey = "605325732f78f3467dd9c132b1dac803";
    final apiURL =
        "https://api.openweathermap.org/data/2.5/weather?units=metric&q=$location&appid=$apiKey";

    Response response = await get(Uri.parse(apiURL));
    final Map<String, dynamic> decode = jsonDecode(response.body);

    if (response.statusCode == 200) {
      weatherdata.add(weather.fromJson(decode));

    } else {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Warning'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('City Not find'),
            TextField(
              controller: locationcon,
              decoration: InputDecoration(
                filled: true,

                // fillColor: Color(0xFFF8FAFF),
                prefixIcon: Icon(Icons.search),
                label: Text('Search Location'),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(20))),
        ),

            ],
          ),
          actions: [
            TextButton(onPressed: (){
              weatherFuntion(locationcon.text);
              setState(() {
              });
              Navigator.pop(context);
            }, child: Text('Add'))
          ],
        );
      });
    }
    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Weather'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text('Add City'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Enter City name'),
                    TextField(
                      controller: locationcon,
                      decoration: InputDecoration(
                          filled: true,

                          // fillColor: Color(0xFFF8FAFF),
                          prefixIcon: Icon(Icons.search),
                          label: Text('Search Location'),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(20))),
                    ),

                  ],
                ),
                actions: [
                  TextButton(onPressed: (){
                    weatherdata.clear();
                    weatherFuntion(locationcon.text);
                    setState(() {});
                    locationcon.clear();
                    Navigator.pop(context);
                  }, child: Text('Add'))
                ],
              );
            });
          }, icon: Icon(Icons.add))
        ],
      ),
      body: inProgress
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [colordeepPurple, colordeepPurple, color2nd])),
              child: Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                  child: ListView.builder(
                      itemCount: weatherdata.length,
                      itemBuilder: (BuildContext context, index) {
                        return Column(
                          children: [
                            Text(
                              weatherdata[index].name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 38),
                            ),
                            Text(
                              'Updated At: ${time}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                  "http://openweathermap.org/img/w/" +
                                      weatherdata[index].icon +
                                      ".png", fit: BoxFit.cover, height: 100,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.image),
                                ),
                                Text(
                                  '${weatherdata[index].temp.ceil().toString()}\u00b0',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontFamily: 'OpenSans'),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Max: ${weatherdata[index].high.ceil().toString()}\u00b0',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Min: ${weatherdata[index].low.ceil().toString()}\u00b0',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              weatherdata[index].description.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontFamily: 'OpenSans'),
                            ),
                          ],
                        );
                      })),
            ),
    );
  }
}
