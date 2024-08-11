import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/worldtime.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations=[
  WorldTime( url: 'Asia/Kathmandu', location: 'Kathmandu', flag: 'nepal.png'),
  WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.png'),
    WorldTime(url:'America/Mendoza',location: 'Mendoza',flag:'argentina.png' ),
    WorldTime(url: 'Australia/Sydney', location:'Sydney', flag: 'australia.png'),
    WorldTime(url: 'America/New_York', location: 'New-York', flag:'usa.png'),
  ];

void updateTime(index) async{
  WorldTime instance=locations[index];
  await instance.getTime();
  //navigate to home screen
  Navigator.pop(context,{
    'location':instance.location,
    'time': instance.time,
    'flag': instance.flag,
    'isDayTime': instance.isDayTime,
  });

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Choose the location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
      itemBuilder: (context,index){
           return Card(
           child: ListTile(
           onTap: (){
             updateTime(index);
           },
    title: Text(locations[index].location),
             leading:  CircleAvatar(
               backgroundImage:AssetImage('images/${locations[index].flag}') ,
             ),
           ),
           );
    }
    )
    );
  }
}
