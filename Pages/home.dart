import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 Map data={};
  @override
  Widget build(BuildContext context) {
  final routeData=  ModalRoute.of(context)?.settings.arguments;
    if (routeData is Map) {
      data =data.isNotEmpty?data: routeData;
    } else {
      // Handle the case where the arguments are not a Map
      data = {}; // or provide some default data
    }

    print(data);

    String bgImage;
    if(data['isDayTime']==true){
      bgImage='day.jpg';
    }
    else{
      bgImage='night.jpg';
    }



    Color bgColor=Colors.blue;
    return   Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(

            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage('images/$bgImage',),
fit: BoxFit.cover,
              ),),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,90.0,0,0),
                child: Column(
                  children:  <Widget>[
                   TextButton.icon(onPressed: () async {
                   dynamic result= await  Navigator.pushNamed(context, '/location');
                   setState(() {
                     data={
                       'time':result['time'],
                       'location':result['location'],
                       'isDayTime':result['isDayTime'],
                       'flag':result['flag'],
                     };
                   });
                   },
                       icon: const Icon(Icons.edit_location,
                       color: Colors.grey,),
                       label:const Text('Edit location',
                       style: TextStyle(
                         color: Colors.yellowAccent,
                         fontSize: 30.0,
                         letterSpacing: 2.0
                       ),),),
                    const SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Text(
                  data['location'],
                          style: const  TextStyle(
                            fontSize: 36.0,
                            letterSpacing: 2.0,
                            color: Colors.yellowAccent,
                          ),
                        ),

                          ],
                        ),
                    SizedBox(height: 6.0),
                    Text(
                      data['time'],
                      style: const TextStyle(
                        fontSize: 66.0,
                        color: Colors.yellowAccent,
                      )
                    ),



                      ],
                    ),
              ),
            ),
          ),
        );



  }
}
