import 'package:flutter/material.dart';

// import '../models/new_model.dart';
import 'Modelclass.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.userData});

  final Datum userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              decoration:
              BoxDecoration(border: Border.all(color: Colors.black)),
              child: Column(
                children: [
                  Text(userData.employeeName),
                  Text(userData.employeeSalary.toString()),
                  Text(userData.employeeAge.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}