// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class StudentInfoScreen extends StatefulWidget {
  @override
  _StudentInfoScreenState createState() => _StudentInfoScreenState();
}

class _StudentInfoScreenState extends State<StudentInfoScreen> {
  // Define variables and controllers for the form fields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool hasLaptop = false;
  String selectedDepartment = "CS";
  bool accommodationRequest = false;
  final TextEditingController accommodationController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (formKey.currentState!.validate()) {
      // Form is valid, display the submitted information
      String username = usernameController.text;
      String laptopStatus = hasLaptop ? "You have a Laptop" : "You don't have a Laptop";
      String department = "You are a $selectedDepartment student at UCSC";
      String accommodationText = accommodationRequest ? accommodationController.text : "";

      String message = "Your username is $username\n$laptopStatus\n$department\n$accommodationText";

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.face),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Username cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
                validator: (value) {
                  if (value!.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text('Do you have a Laptop?'),
                  Checkbox(
                    value: hasLaptop,
                    onChanged: (value) {
                      setState(() {
                        hasLaptop = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              DropdownButton<String>(
                value: selectedDepartment,
                onChanged: (value) {
                  setState(() {
                    selectedDepartment = value!;
                  });
                },
                items: ['CS', 'IS'].map((String department) {
                  return DropdownMenuItem<String>(
                    value: department,
                    child: Text(department),
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: accommodationRequest,
                    onChanged: (value) {
                      setState(() {
                        accommodationRequest = value!;
                      });
                    },
                  ),
                  Text('Do you have any specific accommodation requests?'),
                ],
              ),
              SizedBox(height: 16.0),
              if (accommodationRequest)
                TextFormField(
                  controller: accommodationController,
                  decoration: InputDecoration(
                    hintText: 'Accommodation Needs',
                    labelText: 'Accommodation Needs',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Clear form fields
                  usernameController.clear();
                  passwordController.clear();
                  setState(() {
                    hasLaptop = false;
                    selectedDepartment = "CS";
                    accommodationRequest = false;
                  });
                },
                child: Text('Clear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
