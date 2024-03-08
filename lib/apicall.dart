import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


import 'Modelclass.dart';
import 'details.dart';


class CallApi extends StatelessWidget {
  const CallApi({super.key});

  Future<EmployApi> loadData() async {
    Response res = await get(
        Uri.parse("https://dummy.restapiexample.com/api/v1/employees"));
    if (res.statusCode == 200) {
      var body = EmployApi.fromMap(jsonDecode(res.body));
      return body;
    } else {
      return throw Exception(res.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data.length,
              itemBuilder: (context, index) {
                var data = snapshot.data!.data[index];

                return ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DetailsScreen(
                            userData: data,
                          );
                        },
                      ));
                    },
                    title: Text(data.employeeName),
                    subtitle: Text(data.employeeSalary.toString()));
              },
            );
          } else {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
        },
      ),
    );
  }
}