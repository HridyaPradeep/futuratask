import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:futuramachinetest/User.dart';
import 'package:futuramachinetest/registration.dart';

import 'apicall.dart';
// import 'package:futuramachinetest/userss.dart';

class Design5 extends StatefulWidget {
  const Design5({super.key});

  @override
  State<Design5> createState() => _Design5State();
}

class _Design5State extends State<Design5> {

  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();


  Logg({required email,required password})async{
    try{
      final store=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if(store.user!=null){
        if(FirebaseAuth.instance.currentUser!.uid=="Tk5VmT82RuRLeEADnlap8UpVqDq1");

        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
          return CallApi();
        },));

      }
      else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CallApi(),));
      }
    }
    on FirebaseAuthException catch(error){
      Fluttertoast.showToast(msg: "${error.code}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 1,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.orange.shade900,
              Colors.orange.shade800,
              Colors.orange.shade400,
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 33),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                    Text(
                      "welcomeback",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200))),
                              child: TextField(
                                controller: emailcontroller,
                                decoration: InputDecoration(
                                    hintText: "Email or phone number",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200))),
                              child: TextField(
                                controller: passwordcontroller,
                                decoration: InputDecoration(

                                    hintText: "password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            "Foregot password?",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: (){
                          Logg(email: emailcontroller.text, password: passwordcontroller.text);
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.orange.shade900),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            "continue with socialmedia",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(20)),child:  Center(
                              child: Text(
                                "Facebook",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            ),),SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(20)),child:  Center(
                              child: Text(
                                "Github",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
