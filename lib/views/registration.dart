import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late double screenHeight, screenWidth, ctrwidth;
  String pathAsset = 'assets/images/3.png';
  var _image;
  File?image;
  final TextEditingController _rgnameEditingController =
      TextEditingController();
  final TextEditingController _rgemailEditingController =
      TextEditingController();
  final TextEditingController _rgphonenoEditingController =
      TextEditingController();
  final TextEditingController _rgaddressEditingController =
      TextEditingController();
  final TextEditingController _rgpassEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    print("dispose was called");
    _rgnameEditingController.dispose();
    _rgemailEditingController.dispose();
    _rgpassEditingController.dispose();
    _rgphonenoEditingController.dispose();
    _rgaddressEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 800) {
      ctrwidth = screenWidth / 1.5;
    }
    if (screenWidth < 800) {
      ctrwidth = screenWidth / 1.1;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Account'),
      ),
      body: SingleChildScrollView(
          child: Center(
              child: SizedBox(
        width: ctrwidth,
        child: Form(
          key: _formKey,
          child: Column(children: [
            const SizedBox(height: 10),
            // Card(
            //   child: GestureDetector(
            //       onTap: () => {_takePictureDialog()},
            //       child: SizedBox(
            //           height: screenHeight / 2.5,
            //           width: screenWidth,
            //           child: _image == null
            //               ? Image.asset(pathAsset)
            //               : Image.file(
            //                   _image,
            //                   fit: BoxFit.cover,
            //                 ))),
            // ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _rgnameEditingController,
              decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: const Icon(Icons.title),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid name';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _rgemailEditingController,
              decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.mail),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _rgpassEditingController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.block),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid password';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: _rgphonenoEditingController,
              decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid phone numeer';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _rgaddressEditingController,
              minLines: 4,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
                  labelText: 'Home Address',
                  alignLabelWithHint: true,
                  prefixIcon: const Padding(
                      padding: EdgeInsets.only(bottom: 80),
                      child: Icon(Icons.description)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: screenWidth,
              height: 50,
              child: ElevatedButton(
                child: const Text("Register"),
                onPressed: () {
                  _insertDialog();
                },
              ),
            ),
            const SizedBox(height: 10),
          ]),
        ),
      ))),
    );
  }

  // _takePictureDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       // return object of type Dialog
  //       return AlertDialog(
  //           title: const Text(
  //             "Select from",
  //           ),
  //           content: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               TextButton.icon(
  //                   onPressed: () => {
  //                         Navigator.of(context).pop(),
  //                         _galleryPicker(),
  //                       },
  //                   icon: const Icon(Icons.browse_gallery),
  //                   label: const Text("Gallery")),
  //               TextButton.icon(
  //                   onPressed: () =>
  //                       {Navigator.of(context).pop(), _cameraPicker()},
  //                   icon: const Icon(Icons.camera_alt),
  //                   label: const Text("Camera")),
  //             ],
  //           ));
  //     },
  //   );
  // }

  // _galleryPicker() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(
  //     source: ImageSource.gallery,
  //     maxHeight: 800,
  //     maxWidth: 800,
  //   );
  //   if (pickedFile != null) {
  //     _image = File(pickedFile.path);
  //     _cropImage();
  //   }
  // }

  // _cameraPicker() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(
  //     source: ImageSource.camera,
  //     maxHeight: 800,
  //     maxWidth: 800,
  //   );
  //   if (pickedFile != null) {
  //     _image = File(pickedFile.path);
  //     _cropImage();
  //   }
  // }
  

  //  Future<void> _cropImage() async {
  //   CroppedFile? croppedFile = await ImageCropper().cropImage(
  //     sourcePath: imageFile.path,
  //     aspectRatioPresets: [
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio16x9
  //     ],
  //     uiSettings: [
  //       AndroidUiSettings(
  //           toolbarTitle: 'Cropper',
  //           toolbarColor: Colors.deepOrange,
  //           toolbarWidgetColor: Colors.white,
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: false),
  //       IOSUiSettings(
  //         title: 'Cropper',
  //       ),
  //     ],
  //   );
    

  void _insertDialog() {
    if (_formKey.currentState!.validate() && _image != null) {
      _formKey.currentState!.save();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: const Text(
              "Register an account",
              style: TextStyle(),
            ),
            content: const Text("Are you sure?", style: TextStyle()),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  "Yes",
                  style: TextStyle(),
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  _regisAccount();
                },
              ),
              TextButton(
                child: const Text(
                  "No",
                  style: TextStyle(),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _regisAccount() {
    String _rgname = _rgnameEditingController.text;
    String _rgemail = _rgemailEditingController.text;
    String _rgpass = _rgpassEditingController.text;
    String _rgphoneNo = _rgphonenoEditingController.text;
    String _rgaddress = _rgaddressEditingController.text;
    // String base64Image = base64Encode(_image!.readAsBytesSync()
    print(_rgname);
    http.post(
        Uri.parse(
            CONSTANTS.server + "/lab3_mb/user_tutor/php/register.php"),
        body: {
          "name": _rgname,
          "email": _rgemail,
          "password": _rgpass,
          "phoneNo": _rgphoneNo,
          "address": _rgaddress,
          // "image": base64Image
        }).then((response) {
      print(response.body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['status'] == 'success') {
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
        Navigator.of(context).pop();
      } else {
        Fluttertoast.showToast(
            msg: data['status'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      }
    });
  }
}
