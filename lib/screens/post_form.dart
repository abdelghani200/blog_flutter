// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace

import 'dart:io';

import 'package:blog_flutter/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostForm extends StatefulWidget {
  const PostForm({super.key});

  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _bodyController = TextEditingController();
  bool _isLoading = false;
  File? _image;
  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Post'),
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      image: _image == null ? null : DecorationImage(
                        image: FileImage(_image ?? File('')),
                        fit: BoxFit.cover,
                      )
                    ),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.image,
                            size: 50, color: Colors.black38),
                        onPressed: () {
                          getImage();
                        },
                      ),
                    ),
                  ),
                  Form(
                      child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      controller: _bodyController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 9,
                      validator: (val) =>
                          val!.isEmpty ? 'Post body is required' : null,
                      decoration: const InputDecoration(
                        hintText: 'Post Body...',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black38)),
                      ),
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: kTextButton('Post', () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = !_isLoading;
                        });
                      }
                    }),
                  )
                ],
              ));
  }
}
