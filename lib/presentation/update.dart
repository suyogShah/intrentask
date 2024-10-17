import 'dart:io';
import 'package:eventregistration/presentation/profile.dart';
import 'package:eventregistration/presentation/resgistrationform.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  File? _image;
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Stack(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.35,
                      height: screenWidth * 0.35,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: _image != null
                            ? Image.file(_image!, fit: BoxFit.cover)
                            : Image.asset(
                                'assets/arjit.png',
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          radius: 20,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'name',
                        decoration: InputDecoration(labelText: 'Name'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(errorText: 'Name is required'),
                          FormBuilderValidators.maxLength(50, errorText: 'Name must be less than 50 characters'),
                        ]),
                        initialValue: "Suyog Shah",
                      ),
                      SizedBox(height: 16.0),
                      FormBuilderTextField(
                        name: 'email',
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(errorText: 'Email is required'),
                          FormBuilderValidators.email(errorText: 'Invalid email format'),
                        ]),
                        initialValue: "Suyogshah@gmail.com",
                      ),
                      SizedBox(height: 16.0),
                      FormBuilderTextField(
                        name: 'phone',
                        decoration: InputDecoration(labelText: 'Phone Number'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(errorText: 'Phone number is required'),
                          FormBuilderValidators.numeric(errorText: 'Only numeric values are allowed'),
                          FormBuilderValidators.maxLength(10, errorText: 'Phone number must be 10 digits long'),
                        ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      final formData = _formKey.currentState?.value;
                      print('Saved changes: $formData');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Changes saved successfully!')),
                        );
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fix the errors in red.')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: screenWidth * 0.25,
                    ),
                  ),
                  child: Text(
                    'Save Changes',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 50),
               
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
