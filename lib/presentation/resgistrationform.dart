import 'package:eventregistration/presentation/confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<String> eventTypes = ['Conference', 'Workshop', 'Webinar', 'Meetup'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Registration',style: TextStyle(color: Colors.blueGrey),)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'name',
                 style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black)),
                decoration: InputDecoration(labelText: 'Name'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'Name is required'),
                  FormBuilderValidators.maxLength(50, errorText: 'Name must be less than 50 characters'),
                ]),
              ),
              SizedBox(height: 16.0),

              FormBuilderTextField(
                name: 'email',
                 style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black)),
                decoration: InputDecoration(labelText: 'Email'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'Email is required'),
                  FormBuilderValidators.email(errorText: 'Invalid email format'),
                ]),
              ),
              SizedBox(height: 16.0),

              FormBuilderTextField(
                name: 'phone',
                 style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black)),
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'Phone number is required'),
                  FormBuilderValidators.numeric(errorText: 'Only numeric values are allowed'),
                  FormBuilderValidators.maxLength(10, errorText: 'Phone number must be 10 digits long'),
                ]),
              ),
              SizedBox(height: 16.0),

              FormBuilderDateTimePicker(
                name: 'event_date',
                style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black)),
                inputType: InputType.date,
                decoration: InputDecoration(labelText: 'Event Date'),
                validator: FormBuilderValidators.required(errorText: 'Event date is required'),
              ),
              SizedBox(height: 16.0),

              FormBuilderDropdown(
                name: 'event_type',
                 style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black)),
                decoration: InputDecoration(labelText: 'Event Type'),
                items: eventTypes
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                validator: FormBuilderValidators.required(errorText: 'Please select an event type'),
              ),
              SizedBox(height: 16.0),

              FormBuilderTextField(
                name: 'comments',
                 style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black)),
                decoration: InputDecoration(labelText: 'Comments'),
                maxLines: 3,
                validator: FormBuilderValidators.maxLength(250, errorText: 'Comments must be less than 250 characters'),
              ),
              SizedBox(height: 16.0),

             ElevatedButton(
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.zero, // Remove default padding for custom styling
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0), // Softer, rounded corners
    ),
    elevation: 5, // Add shadow for depth
  ),
  onPressed: () {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final formData = _formKey.currentState?.value;
      print(formData);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmationPage(formData: formData!),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fix the errors in red.')),
      );
    }
  },
  child: Ink(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blueGrey, Colors.teal], 
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(30.0), 
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 15.0), 
      child: Text(
        'Submit',
        style: TextStyle(
          fontSize: 18, 
          fontWeight: FontWeight.bold, 
          color: Colors.white, 
        ),
      ),
    ),
  ),
),
            ],
          ),
        ),
      ),
    );
  }
}
