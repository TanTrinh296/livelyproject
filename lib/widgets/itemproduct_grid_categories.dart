import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lightproject/resource/texts_stype.dart';

class ItemProductGridCategoriesWidget extends StatefulWidget {
  const ItemProductGridCategoriesWidget({Key? key}) : super(key: key);

  @override
  _ItemProductGridWidgetState createState() => _ItemProductGridWidgetState();
}

class _ItemProductGridWidgetState
    extends State<ItemProductGridCategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
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
                                "https://i.pinimg.com/originals/1a/9a/9e/1a9a9e6b7fbc7f65fb30aeaca48b0553.jpg",
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
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(100)),
                                child: Center(
                                  child: Text("-20%",
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                            Text(
                              "LIME",
                              style: TextStyle(color: Colors.black45),
                            ),
                          ],
                        ),
                        Text(
                          "Shirt",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                  ],
                ),
                Positioned(
                    right: 0,
                    top: size.width / 2.4,
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
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border)),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
