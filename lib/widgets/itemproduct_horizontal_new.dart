import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemProductHorizontalNew extends StatefulWidget {
  const ItemProductHorizontalNew({Key? key}) : super(key: key);

  @override
  _ItemProductHorizontalState createState() => _ItemProductHorizontalState();
}

class _ItemProductHorizontalState extends State<ItemProductHorizontalNew> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Stack(
          children: [
            Container(
              width: size.width / 2.4,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            Container(
                              height: size.width / 2,
                              width: size.width / 2.4,
                              child: Container(
                                child: Image.network(
                                  "https://image-us.eva.vn/upload/2-2021/images/2021-06-16/1623809884-922-cungd-thoi-trang-1-1623809684-428-width600height901-1623809884-width600height901.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                                top: 5,
                                left: 5,
                                child: Container(
                                  width: 50,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Center(
                                    child: Text("NEW",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RatingBar.builder(
                        itemSize: 20,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text(
                        "Dorothy Perkins",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black26),
                      ),
                      Text("Evening Dress",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      RichText(
                        text: TextSpan(
                          text: '12',
                          style: TextStyle(color: Colors.red),
                          children: const <TextSpan>[
                            TextSpan(
                                text: "\$",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      right: 0,
                      top: size.width / 2.2,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 4,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(child: Icon(Icons.favorite_border)),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
