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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Text(
              'CRUD Operation',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: crudProvider.firstNameController,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'FirstName',
                hintText: 'Enter  first name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.r),
                ),
              ),
            ),

            SizedBox(height: 30.sp),
            TextField(
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

            SizedBox(height: 30.h),
            GestureDetector(
              onTap: () async {
                await crudProvider.createData(context);
              },
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12.r),
                ),

                child:
                    crudProvider.isloading
                        ? Center(child: CircularProgressIndicator())
                        : Center(
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
              ),
            ),

            Divider(),
            Expanded(
              child: StreamBuilder(
                stream: crudProvider.readData(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                    child: Text(
                    'data error',
                    style: TextStyle(color: Colors.red),
                    ),
                    );
                  } else if (snapshot.hasData) {
                    final datas = snapshot.data!.docs;
                    if (datas.isEmpty) {
                    return Center(
                    child: Text(
                    'no data found',
                    style: TextStyle(color: Colors.red),
                    ),
                    );
                    }
                    return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index];
                    return Card(
                    child: ListTile(
                    title: Text(
                    data['firstName'].toString(),
                    style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                    data['lastName'].toString(),
                    style: TextStyle(color: Colors.black),
                    ),
                    trailing: Row(
                    children: [
                    GestureDetector(
                    onTap: () {
                    crudProvider.updateDialoge(
                    context,
                    data.id,
                    );
                    },
                    child: Icon(Icons.edit, color: Colors.blue),
                    ),
                    SizedBox(width: 10.w),
                    GestureDetector(
                    onTap: () {
                    crudProvider.deleteData(data.id, context);
                    },
                    child: Icon(Icons.delete, color: Colors.red),
                    ),
                    ],
                    ),
                    ),
                    );
                    }
                    );

                  }
 return Container(); // Add a default return statement
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
