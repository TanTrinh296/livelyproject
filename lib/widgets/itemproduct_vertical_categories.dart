import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lightproject/resource/texts_stype.dart';

class ItemProductVerticalCategories extends StatefulWidget {
  const ItemProductVerticalCategories({Key? key}) : super(key: key);

  @override
  _ItemProductVerticalState createState() => _ItemProductVerticalState();
}

class _ItemProductVerticalState extends State<ItemProductVerticalCategories> {
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
                          Text(
                            "Shirt",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "LIME",
                            style: TextStyle(color: Colors.black45),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: "32\$",
                                    style: TextsStyle.lyrics
                                        .copyWith(color: Colors.black)),
                              ),
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
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 1,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_border)),
                ],
              ))
        ],
      ),
    );
  }
}
