import 'package:flutter/material.dart';
import 'package:lightproject/widgets/itemproduct_horizontal_sale.dart';

class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  _BagPageState createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: size.height / 4,
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
                width: size.width ,
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
            children: List.generate(5, (index) => ItemProductHorizontalSale()),
          ),
        )
      ],
    );
  }
}
