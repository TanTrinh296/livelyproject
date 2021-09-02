import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lightproject/resource/icons_data.dart';

class ForgotPassWordScreen extends StatefulWidget {
  const ForgotPassWordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPassWordScreenState createState() => _ForgotPassWordScreenState();
}

class _ForgotPassWordScreenState extends State<ForgotPassWordScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        shadowColor: Colors.transparent,
        leading: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height - 100,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Forgot password",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Please, enter your email address. You will receive a link to create a new password via email",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 25,
                              offset:
                                  Offset(3, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(5),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Email",
                                border: InputBorder.none,
                                focusColor: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              child: RaisedButton(
                                color: Colors.red,
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Text(
                                  "SEND",
                                  style: TextStyle(color: Colors.white),
                                ),
                                visualDensity: VisualDensity.comfortable,
                                elevation: 0,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
