import 'package:flutter/material.dart';
import  'package:worldtimeapp/Pages/home.dart';
import  'package:worldtimeapp/Pages/loading.dart';
import  'package:worldtimeapp/Pages/choose_location.dart';


void main() {
  runApp( MaterialApp(
    initialRoute: '/',
    routes:{
      '/': (context) => const Loading(),
      '/home': (context)=> const Home(),
      '/location': (context)=> const ChooseLocation(),
    }

  ));}