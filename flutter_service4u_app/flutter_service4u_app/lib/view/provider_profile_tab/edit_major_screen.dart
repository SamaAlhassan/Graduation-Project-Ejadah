import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class EditMajorScreen extends StatefulWidget {
  const EditMajorScreen({Key? key}) : super(key: key);

  @override
  State<EditMajorScreen> createState() => _EditMajorScreenState();
}

class _EditMajorScreenState extends State<EditMajorScreen> {
  final List<String> specializations = [
    'Plumber',
    'HVAC Technician',
    'Electrician',
  ];

  String? selectedMajor; // To store the selected major
  bool isLoading = false;
  String? uploadedFilePath;

  @override
  void initState() {
    super.initState();
    _loadMajor();
  }

  // Load the existing major from SharedPreferences
  void _loadMajor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String existingMajor = prefs.getString('user_major') ?? '';
    setState(() {
      selectedMajor = existingMajor.isNotEmpty ? existingMajor : null;
    });
  }

  // Save the selected major and uploaded file to SharedPreferences
  Future<void> _saveSpecializations() async {
    setState(() {
      isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_major', selectedMajor ?? '');
    await prefs.setString('uploaded_file', uploadedFilePath ?? '');

    setState(() {
      isLoading = false;
    });

    Get.snackbar('Success', 'Major updated successfully.');
    Get.back(result: true); // Notify that the major was updated
  }

  // Method to handle file upload
  void _showFileUploadDialog() async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        uploadedFilePath = file.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Major'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Your Major:',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              selectedMajor ?? 'No Major Set',
              style: TextStyle(fontSize: 18.sp, color: selectedMajor == null ? Colors.grey : Colors.black),
            ),
            SizedBox(height: 20.h),
            Text('Select Major (choose one):', style: TextStyle(fontSize: 18.sp)),
            SizedBox(height: 20.h),
            ...specializations.map((specialization) {
              return RadioListTile<String>(
                title: Text(specialization),
                value: specialization,
                groupValue: selectedMajor,
                onChanged: (String? value) {
                  setState(() {
                    selectedMajor = value; // Update the selected major
                  });
                },
              );
            }).toList(),
            SizedBox(height: 20.h),
            Text('Upload a file or image (required):', style: TextStyle(fontSize: 18.sp)),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: _showFileUploadDialog,
              child: Text('Choose File/Image'),
            ),
            SizedBox(height: 20.h),
            if (uploadedFilePath != null)
              Text('Uploaded file: $uploadedFilePath', style: TextStyle(color: Colors.green)),
            SizedBox(height: 20.h),
            if (isLoading) CircularProgressIndicator(),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: uploadedFilePath != null && selectedMajor != null ? _saveSpecializations : null,
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}