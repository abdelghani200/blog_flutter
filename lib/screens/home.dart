
// ignore_for_file: library_private_types_in_public_api

import 'package:blog_flutter/screens/post_screen.dart';
import 'package:blog_flutter/screens/profile.dart';
import 'package:blog_flutter/services/user_service.dart';
import 'package:flutter/material.dart';

import 'login.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: (){
              logout().then((value) => {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Login()), (route) => false)
              });
            },
          )
        ],
      ),
      body: currentIndex == 0 ? const PostScreen() : const Profile(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        elevation: 10.0,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
          currentIndex: currentIndex,
          onTap: (val){
            setState(() {
              currentIndex = val;
            });
          },
        ),
        ),
    );
  }
}