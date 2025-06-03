import 'package:firebase_backend/viewModel/crudOperaProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CrudView extends StatefulWidget {
  const CrudView({super.key});

  @override
  State<CrudView> createState() => _CrudViewState();
}

class _CrudViewState extends State<CrudView> {
  @override
  Widget build(BuildContext context) {
    final crudProvider = Provider.of<Crudoperaprovider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Crud Operation')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: crudProvider.firstNameController,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'FirstName',
                hintText: 'Enter  first name',
                prefixIcon: Icon(Icons.email, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.r),
                ),
              ),
            ),
          ),

          SizedBox(height: 30.sp),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: crudProvider.lastNameController,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'LastName',
                hintText: 'Enter last Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.r),
                ),
              ),
            ),
          ),

          SizedBox(height: 30.h),
          GestureDetector(
            onTap: () {
              crudProvider.createData(context);
            },
            child: Container(
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text('Add', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),

          Divider(),
          StreamBuilder(
            stream: crudProvider.readData(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('data error'));
              } else if (!snapshot.hasData) {
                return Center(child: Text('Data not found'));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index];
                    return ListTile(
                      title: Text(data['firstName'].toString()),
                      subtitle: Text(data['lastName'].toString()),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
