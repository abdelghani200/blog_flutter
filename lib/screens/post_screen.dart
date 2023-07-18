
// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});


  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen>{
  @override
  Widget build(BuildContext context){
    return Container(
      child:  const Center(child: Text('Posts'),),
    );
  }
}