import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';


//import 'dart:io';

void main()=> runApp(
    MaterialApp(
      title: "Weather app",
      home: Home(),

    )
);

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState (){
    return _Homestate();
  }

}
class _Homestate extends State<Home> {
  var temp ;
  var desc;
  var humidity;
  var windSpeed;
  var city;
 var feel;
  var u;
  var country;
  var min;
  var max;
  var country1;
  var min1;
  var max1;

  Future getWeather() async{
    http.Response response = await http.get("https://api.openweathermap.org/data/2.5/find?lat=37.56658&lon=126.9&cnt=5&appid=6f0f43b52dabe5fe0f73191526a3c65e");
    var results=jsonDecode(response.body);

    setState(() {

      this.temp=[results["list"][0]["main"]["temp"]
      ,results["list"][2]["main"]["temp"],
      results["list"][1]["main"]["temp"],
      results["list"][3]["main"]["temp"],
      results["list"][4]["main"]["temp"]

      ];

      this.humidity=[
        results["list"][0]["main"]["humidity"],
        results["list"][1]["main"]["humidity"],
        results["list"][2]["main"]["humidity"],
        results["list"][3]["main"]["humidity"],
        results["list"][4]["main"]["humidity"],
      ];
      this.windSpeed=[
        results["list"][0]["wind"]["speed"],
        results["list"][1]["wind"]["speed"],
        results["list"][2]["wind"]["speed"],
        results["list"][3]["wind"]["speed"],
        results["list"][4]["wind"]["speed"],

      ];
      this.city=[
        results['list'][0]['name'],
        results['list'][1]['name'],
        results['list'][2]['name'],
        results['list'][3]['name'],
        results['list'][4]['name'],
      ];
      this.country=[
        results["list"][0]["sys"]["country"],
        results["list"][1]["sys"]["country"],
        results["list"][2]["sys"]["country"],
        results["list"][3]["sys"]["country"],
        results["list"][4]["sys"]["country"],
      ];
      this.min=[
      results["list"][0]["main"]["temp_min"],
      results["list"][1]["main"]["temp_min"],
      results["list"][2]["main"]["temp_min"],
      results["list"][3]["main"]["temp_min"],
      results["list"][4]["main"]["temp_min"],
      ];
      this.max=[
        results["list"][0]["main"]["temp_max"],
        results["list"][1]["main"]["temp_max"],
        results["list"][2]["main"]["temp_max"],
        results["list"][3]["main"]["temp_max"],
        results["list"][4]["main"]["temp_max"],
      ];

      this.desc=[
        results["list"][0]["weather"][0]["description"],
        results["list"][1]["weather"][0]["description"],
        results["list"][2]["weather"][0]["description"],
        results["list"][3]["weather"][0]["description"],
        results["list"][4]["weather"][0]["description"],

      ];
      this.feel=[
        results["list"][0]["main"]["feels_like"],
        results["list"][1]["main"]["feels_like"],
        results["list"][2]["main"]["feels_like"],
        results["list"][3]["main"]["feels_like"],
        results["list"][4]["main"]["feels_like"],
      ];


    });

  }

  @override
  void initState(){
    super.initState();

    this.getWeather();

  }
  void searchbar(){

  }
  @override
  Widget build (BuildContext Context){

    switch (desc[0].toString()) {
      case 'haze':
        this.u='https://images.unsplash.com/photo-1423209086112-cf2c8acd502f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGhhemV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';
        break;
      case 'clouds':
        this.u='https://images.unsplash.com/photo-1527708676371-14f9a9503c95?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xvdWR5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';
        break;
      case 'mist':
        this.u='https://images.unsplash.com/photo-1485236715568-ddc5ee6ca227?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWlzdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';
        break;
      case "clear sky":
        this.u='https://images.unsplash.com/photo-1523913950023-c47b5ae5b164?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2xlYXIlMjBza3l8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';
        break;
      case "rain":
        this.u='https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFpbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';
        break;case "smoke":
        this.u='https://images.unsplash.com/photo-1625135966225-a01cb9fd9969?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c21va2UlMjB3ZWF0aGVyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';
        break;
      default:
        this.u='https://images.unsplash.com/photo-1600377927594-ceae8f8981a6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dGh1bmRlcnN0b3JtfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';
        break;
    }




      return Scaffold(
        //backgroundColor: Colors.transparent,


        body:  SingleChildScrollView(



            child: Container(
                width: MediaQuery.of(context).size.width*1,
                height: MediaQuery.of(context).size.height*1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(u),
                  fit: BoxFit.cover,
                ),
              ),
              child:SingleChildScrollView(
              child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                    // Image.network("https://images.unsplash.com/photo-1485846234645-a62644f84728?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bW92aWV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",width: 210,height: 200,
                    // ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Icon(Icons.add),
                      Text(city[0].toString(),style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Icon(Icons.more_vert,size: 30,),

                    ],
                  ),
                ),
                    Container(
                      height: 450,



                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,


                        children: [


                          Column(
                            children: [

                              Text(city[0],style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.w900)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(feel[0]!=null ? feel[0].toString() + "\u00B0" +"f": "Loading",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w600,),),
                                  //Icon(Icons.thermostat_outlined,size: 40,),
                                ],
                              ),
                              Text(desc[0]!=null ? desc[0].toString()  : "Loading",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600,),),
                             // Text("Cloudy",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 20,)),
                              ]),])),
                              Container(
                                height: 100,
                              ),
                              Container(
                                color: Colors.white30,
                                width: MediaQuery.of(context).size.width*0.8,
                                height: MediaQuery.of(context).size.height*0.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                      children: [
                                        Text("Humidity:      ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.0,)),
                                        //Text("53",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 20,)),
                                        Text( humidity[0]!=null ? humidity[0].toString()  : "Loading",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.0,)),
                                      ],
                                    ), Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                      children: [
                                        Text("wind speed:   ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.0,)),
                                       // Text("4",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 20,)),
                                        Text( windSpeed[0]!=null ? windSpeed[0].toString()  : "Loading",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.0,)),
                                      ],
                                    ), Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                      children: [
                                        Text("Country:     ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.0,)),
                                        Text( country[0]!=null ? country[0].toString()  : "Loading",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.0,)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                      children: [
                                        Text("Temperature max:" ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.0,)),
                                        Text( max[0]!=null ?  max[0].toString()+ "\u00B0" +"f": "Loading" ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.0,)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                      children: [
                                        Text("Temperature min:" ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.0,)),
                                        Text( min[0]!=null ? min[0].toString() + "\u00B0" +"f" : "Loading",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.0,)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0,top: 10),

                  child: Column(

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("near by city",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15,)),
                          TextButton(onPressed: (){}, child: Text("more detail>>",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15,)))

                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 6.0, right: 6.0,top: 0),

                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(

                                height: 400,


                                child: ListView.builder(
                                    itemCount: 4,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context,index){
                                      return (
                                          Container(
                                            margin: const EdgeInsets.only(left: 5.0, right: 5.0,top: 0),

                                            width: MediaQuery.of(context).size.width*0.800,
                                           color: Colors.white30,
                                            child: Column(
                                              children: [
                                                Container(

                                                    margin: EdgeInsets.all(1),
                                                    padding: EdgeInsets.all(50),
                                                    width: MediaQuery.of(context).size.width*0.900,
                                                    height: MediaQuery.of(context).size.height*0.550,
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [

                                                            Column(
                                                              children: [
                                                                Text(city[index+1],style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w900,)),
                                                                Text(""),


                                                                Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [

                                                                    Text(feel[index+1]!=null ? feel[index+1].toString() + "\u00B0" +"f": "Loading",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600,),),
                                                                    //Icon(Icons.thermostat_outlined,size: 40,),
                                                                  ],
                                                                ),
                                                                Text(desc[index+1]!=null ? desc[index+1].toString()  : "Loading",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600,),),
                                                                // Text("Cloudy",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 20,)),

                                                                Container(
                                                                  height:100,
                                                                  width: 200,
                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [


                                                                      Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                                                        children: [
                                                                          Text("Humidity:      ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 15.0,)),
                                                                          //Text("53",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 20,)),
                                                                          Text( humidity[index+1]!=null ? humidity[index+1].toString()  : "Loading"),
                                                                        ],
                                                                      ), Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                                                        children: [
                                                                          Text("wind speed:   ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 15.0,)),
                                                                          // Text("4",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 20,)),
                                                                          Text( windSpeed[index+1]!=null ? windSpeed[index+1].toString()  : "Loading"),
                                                                        ],
                                                                      ), Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                                                        children: [
                                                                          Text("Country:        ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 15.0,)),
                                                                          Text( country[index+1]!=null ? country[index+1].toString()  : "Loading"),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                                                        children: [
                                                                          Text("temperature max:" ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 15.0,)),
                                                                          Text( max[index+1]!=null ? max[index+1].toString()  + "\u00B0" +"f": "Loading" ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                                                        children: [
                                                                          Text("temperature min:" ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 15.0,)),
                                                                          Text( min[index+1]!=null ? min[index+1].toString()  + "\u00B0" +"f": "Loading"),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),

                                                              ],
                                                            ),

                                                          ],
                                                        ),


                                                      ],
                                                      //Text(""),alignment: Alignment.bottomCenter,),
                                                    ))
                                              ],
                                            ),
                                          )

                                      );

                                    }),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],


                  ),
                ),




              ],
              )))
        ),

      );





  }
}