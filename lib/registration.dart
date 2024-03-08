import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login.dart';

class Regis extends StatefulWidget {
  const Regis({super.key});

  @override
  State<Regis> createState() => _RegisState();
}

class _RegisState extends State<Regis> {
GlobalKey<FormState>  data=GlobalKey();
  TextEditingController email1ctrl = TextEditingController();
  TextEditingController passwrd1ctrl = TextEditingController();

  Register({required email,required password})async{

    try{
      final data= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,password: password);
      if(data.user!.uid!=null){
        Fluttertoast.showToast(msg: "Registration success");
      }

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return Design5();
      },));
    }
    on FirebaseAuthException catch(error){
      Fluttertoast.showToast(msg: "${error.code}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registration",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(

          key: data,
          child: Column(
            children: [

      SizedBox(
          height: 100,
      ),
      TextFormField(
        validator: (value) {
          if(value==null|| value.isEmpty){
            return "fill fields";
          }
        },
          controller: email1ctrl,
          decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true),
      ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "fill fields";
                  }
                },
                controller: passwrd1ctrl,
                decoration: InputDecoration(
                    hintText: "password",
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    filled: true),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(onPressed: (){
                if(data.currentState!.validate()){
                  print("okk");
                }

                Register(email: email1ctrl.text, password: passwrd1ctrl.text);
              }, child: Text("Register"))
   ] ),
        )));
  }
}
