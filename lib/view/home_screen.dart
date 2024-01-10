import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_buddy/view/add_todo_screen.dart';

class HomeScreen extends StatefulWidget{
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState()=> _HomeScreeState();
}

class _HomeScreeState extends State<HomeScreen>{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTodoScreen()));
          }, child: Text('Add To do'))
        ],),
      ),
    );
  }
}