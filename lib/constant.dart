
// Url

// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

const baseURL = 'http://192.168.3.78:8000/api';
const loginURL = '$baseURL/login';
const registerURL = '$baseURL/register';
const logoutURL = '$baseURL/logout';
const userURL = '$baseURL/user';
const postsUrl = '$baseURL/posts';
const commentsURL = '$baseURL/comments';

// Errors

const serverError = 'server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'something Went Wrong, try again!';


// --- input decoration
InputDecoration kInputDecoration(String label) {
  return InputDecoration(
      labelText: label,
      contentPadding: const EdgeInsets.all(10),
      border: const OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black))
    );
}

// button

TextButton kTextButton(String label, Function onPressed){
  return TextButton(
    child: Text(label, style: const TextStyle(color: Colors.white),),
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
      padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.symmetric(vertical: 10))
    ),
    onPressed: () => onPressed(),
  );
}

// loginRegisterHint
Row kLoginRegisterHint(String text, String label, Function onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text),
      GestureDetector(
        child: Text(label, style:const TextStyle(color: Colors.blue)),
        onTap: () => onTap()
      )
    ],
  );
}
