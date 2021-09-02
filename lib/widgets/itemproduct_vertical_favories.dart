import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lightproject/resource/texts_stype.dart';

class ItemProductVertical extends StatefulWidget {
  const ItemProductVertical({Key? key}) : super(key: key);

  @override
  _ItemProductVerticalState createState() => _ItemProductVerticalState();
}

class _ItemProductVerticalState extends State<ItemProductVertical> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.width / 3 + 15,
          ),
          Container(
            width: size.width,
            height: size.width / 3,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Row(
                children: [
                  Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth / 3,
                    color: Colors.black,
                    child: Image.network(
                      "https://i.pinimg.com/originals/1a/9a/9e/1a9a9e6b7fbc7f65fb30aeaca48b0553.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "LIME",
                                style: TextStyle(color: Colors.black45),
                              ),
                              Icon(
                                Icons.close,
                                color: Colors.black45,
                              )
                            ],
                          ),
                          Text(
                            "Shirt",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "Color:", style: TextsStyle.lyrics),
                                TextSpan(
                                    text: "Blue",
                                    style: TextsStyle.lyrics
                                        .copyWith(color: Colors.black))
                              ])),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "Size:", style: TextsStyle.lyrics),
                                TextSpan(
                                    text: "L",
                                    style: TextsStyle.lyrics
                                        .copyWith(color: Colors.black))
                              ])),
                              SizedBox.shrink()
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: "32\$",
                                    style: TextsStyle.lyrics
                                        .copyWith(color: Colors.black)),
                              ),
                              RatingBar.builder(
                                itemSize: 20,
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox.shrink()
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 1,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
