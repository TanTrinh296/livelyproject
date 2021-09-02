import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lightproject/widgets/itemproduct_horizontal_new.dart';
import 'package:lightproject/widgets/itemproduct_horizontal_sale.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamController<bool> _showTitleAppBar = StreamController<bool>.broadcast();
  bool _showheader = true;
  @override
  void dispose() {
    _showTitleAppBar.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<bool>(
                stream: _showTitleAppBar.stream,
                initialData: true,
                builder: (context, snapshot) {
                  return Visibility(
                    visible: !snapshot.data!,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: size.height / 4,
                              width: size.width,
                              child: Image.network(
                                "https://channel.mediacdn.vn/2020/5/21/photo-1-15900531756651519205399.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              left: 10,
                              bottom: 20,
                              child: Container(
                                width: size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Street clothes",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sale",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Text("View all")
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Super summer sale",
                                  style: TextStyle(color: Colors.black38),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: size.width / 1.2,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                                5, (index) => ItemProductHorizontalSale()),
                          ),
                        )
                      ],
                    ),
                  );
                }),
            StreamBuilder<bool>(
                stream: _showTitleAppBar.stream,
                initialData: true,
                builder: (context, snapshot) {
                  return Visibility(
                    visible: snapshot.data!,
                    child: Stack(
                      children: [
                        Container(
                          height: size.height / 3 * 2,
                          width: size.width,
                          child: Image.network(
                            "https://image-us.eva.vn/upload/2-2021/images/2021-06-16/1623809884-922-cungd-thoi-trang-1-1623809684-428-width600height901-1623809884-width600height901.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 20,
                          child: Container(
                            width: size.width / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Fashion sale",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: size.width / 3,
                                  child: RaisedButton(
                                    color: Colors.red,
                                    onPressed: () {
                                      // _showheader = !_showheader;
                                      // setState(() {});
                                      _showTitleAppBar.add(false);
                                      // Navigator.of(context).pushNamed("/home");
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Text(
                                      "Check",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    visualDensity: VisualDensity.comfortable,
                                    elevation: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text("View all")
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "You're never seen it before!",
                      style: TextStyle(color: Colors.black38),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: size.width / 1.2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    List.generate(5, (index) => ItemProductHorizontalNew()),
              ),
            ),
            //current child
            Container(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: size.height / 2,
                        width: size.width,
                        child: Image.network(
                          "https://ablersite.org/wp-content/uploads/2020/09/top-fashion-blogger-noi-tieng-hien-nay-3.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 20,
                        child: Text("New collection",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  Container(
                    height: size.height / 2,
                    width: size.width,
                    child: Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: size.width / 2,
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        height: constraints.maxHeight / 2,
                                        width: constraints.maxWidth,
                                      ),
                                      Container(
                                        // width: double.infinity,
                                        // height: double.infinity,
                                        child: Text("Summer Sale",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        color: Colors.blue,
                                        height: constraints.maxHeight / 2,
                                        width: constraints.maxWidth,
                                        child: Image.network(
                                          "https://i.pinimg.com/originals/45/ed/41/45ed41abec5389e2915fd1d80acdcbe4.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        // width: double.infinity,
                                        // height: double.infinity,
                                        child: Text("Black",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: double.infinity,
                              width: size.width / 2,
                              child: Image.network(
                                "https://www.apetogentleman.com/wp-content/uploads/2020/01/hoodies-wear-4.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: size.width / 2,
                              // height: double.infinity,
                              child: Text("Men's hoodies",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
