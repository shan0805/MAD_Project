import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MaterialApp(
    home: EmployeeDashboardPage(),
  ));
}

class EmployeeDashboardPage extends StatefulWidget {
  @override
  _EmployeeDashboardPageState createState() => _EmployeeDashboardPageState();
}

class _EmployeeDashboardPageState extends State<EmployeeDashboardPage> {
  PlatformFile? _selectedFile;

  Future<void> _uploadResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = result.files.first;
      });
      _showSuccessMessage();
    }
  }

  void _showSuccessMessage() {
    String fileName = _selectedFile != null ? _selectedFile!.name : '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success!'),
          content: Text(
              'File "$fileName" uploaded!'), // Include file name in the content
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAD LAB PROJECT'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Resume Ranking System',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: _uploadResume,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.upload),
                      SizedBox(width: 10),
                      Text('Upload Resume'),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Image.asset('assets/images/joblogo.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
