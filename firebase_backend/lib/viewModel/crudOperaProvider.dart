import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Crudoperaprovider with ChangeNotifier {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  bool isloading = false;

  //create data
  Future<void> createData(BuildContext context) async {
    isloading = true;
    notifyListeners();
    try {
      await FirebaseFirestore.instance.collection('Crud Operation').add({
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
      });
      print('Data created successfully');

      Flushbar(
        message: "Data Created Successfully ",
        icon: Icon(Icons.check_circle, color: Colors.white),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.blue,
        margin: EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP, // or BOTTOM
      ).show(context);
      isloading = false;
      notifyListeners();
    } catch (e) {
      print('Error creating data: $e');
      Flushbar(
        message: "Data Created failed to create",
        icon: Icon(Icons.check_circle, color: Colors.white),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP, // or BOTTOM
      ).show(context);
      isloading = false;
      notifyListeners();
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  //read data
  Stream<QuerySnapshot> readData(BuildContext context) {
    return FirebaseFirestore.instance.collection('Crud Operation').snapshots();
  }
}
