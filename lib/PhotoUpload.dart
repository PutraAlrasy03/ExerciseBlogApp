import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadPhotoPage extends StatefulWidget {
  const UploadPhotoPage({Key? key}) : super(key: key);

  @override
  State<UploadPhotoPage> createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  File? sampleImage;
  String? _myValue;
  final formkey = new GlobalKey<FormState>();

  set image(File image) {}

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    this.image = imageTemporary;
  }

  bool validateAndSave() {
    final form = formkey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: Center(
        child: Text('Upload Image'),
      )),
      body: new Center(
        child: sampleImage == null ? Text("Select an Image") : enableUpload(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget enableUpload() {
    return Container(
        // ignore: unnecessary_new
        child: new Form(
            key: formkey,
            child: Column(children: <Widget>[
              Image.file(
                sampleImage!,
                height: 310.0,
                width: 630.0,
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                  decoration: new InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    return value!.isEmpty ? 'Description is required' : null;
                  },
                  onSaved: (value) {
                    _myValue == value!;
                  }),
              SizedBox(
                height: 15.0,
              ),
              RaisedButton(
                elevation: 10.0,
                child: Text("add a new Post"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: validateAndSave,
              )
            ])));
  }
}
