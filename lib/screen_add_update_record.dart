import 'dart:typed_data';

import 'package:database_hive_app/data_hive/data_objects.dart';
import 'package:database_hive_app/data_hive/general_box.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScreenAddUpdateRecord extends StatefulWidget {
  final DataObejcts? dataObejcts;
  const ScreenAddUpdateRecord({super.key, this.dataObejcts});

  @override
  State<ScreenAddUpdateRecord> createState() => _ScreenAddUpdateRecordState();
}

class _ScreenAddUpdateRecordState extends State<ScreenAddUpdateRecord> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();

  List<String> _selectedFilterChips = [];
  List<String> _hobbies = ["Cricket", "Football", "Hockey", "Badminton"];

  Uint8List? _imageBytes;

  ImagePicker imagePicker = ImagePicker();

  Future<void> pickImage(bool isCamera) async {
    var image = await imagePicker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (image != null) {
      _imageBytes = await image.readAsBytes();

      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.dataObejcts != null) {
      controllerName.text = widget.dataObejcts!.name.toString();
      controllerAddress.text = widget.dataObejcts!.address.toString();
      _imageBytes = widget.dataObejcts!.profileImage;
      _selectedFilterChips = widget.dataObejcts!.hobbies;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.dataObejcts != null ? "Update Record" : "Add Record"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: controllerName,
              decoration:
                  InputDecoration(hintText: "Enter Name", label: Text("Name")),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controllerAddress,
              decoration: InputDecoration(
                hintText: "Enter Address",
                label: Text("Address"),
              ),
            ),
            SizedBox(height: 10),
            //todo chips for hobbies
            TextButton.icon(
                onPressed: () {
                  pickImage(false);
                },
                label: Text("Upload Image"),
                icon: Icon(Icons.image)),
            SizedBox(height: 10),
            if (_imageBytes != null)
              ClipRect(
                child: Image.memory(_imageBytes!),
              ),

            // Choice Chips

            // Filter Chips
            Text("Filter Chips (Multiple Select):",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8.0,
              children: _hobbies.map((hobby) {
                return FilterChip(
                  label: Text(hobby),
                  selected: _selectedFilterChips.contains(hobby),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedFilterChips.add(hobby);
                      } else {
                        _selectedFilterChips.remove(hobby);
                      }
                    });
                  },
                );
              }).toList(),
            ),

            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  DataObejcts dataObejcts = DataObejcts();

                  if (widget.dataObejcts != null) {
                    dataObejcts.key = widget.dataObejcts!.key;
                    dataObejcts.name = controllerName.text.toString();
                    dataObejcts.address = controllerAddress.text.toString();
                    dataObejcts.profileImage = _imageBytes;
                    dataObejcts.hobbies = _selectedFilterChips;

                    //todo update record
                  } else {
                    dataObejcts.key = GeneralBox.getUniqueKey();
                    dataObejcts.name = controllerName.text.toString();
                    dataObejcts.address = controllerAddress.text.toString();
                    dataObejcts.profileImage = _imageBytes;
                    dataObejcts.hobbies = _selectedFilterChips;
                    // todo add record
                  }
                  bool isAddedUpdate =
                      GeneralBox.addUpdateDataObejcts(dataObejcts);
                  if (isAddedUpdate) {
                    print("Record Successfully");

                    Navigator.pop(context);
                  } else {
                    print("Record Failed");
                  }
                },
                child: Text(widget.dataObejcts != null
                    ? "Update Record"
                    : "Add Record"))
          ],
        ),
      ),
    );
  }
}
