

// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context){
    return Container(
      child: const Center(child: Text('Profile'),),
    );
  }
}