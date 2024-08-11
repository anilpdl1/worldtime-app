import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Future<void> SetWorldTime() async {
    WorldTime instance=WorldTime(url:'Asia/Kathmandu',location:'Kathmandu',flag: 'nepal.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location':instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDayTime,


    });

  }
@override
void initState(){
  super.initState();
  SetWorldTime();
}
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitRipple(
          color: Colors.white,
          size:200,
        ),

      ),
    );
  }
}
