import 'package:flutter/material.dart';
import 'package:lightproject/resource/colors_data.dart';
import 'package:lightproject/resource/texts_stype.dart';
import 'package:lightproject/view/home/homepage/shoppingpage.dart';

class ShoppingSearchCategoriesScreen extends StatefulWidget {
  const ShoppingSearchCategoriesScreen({Key? key}) : super(key: key);

  @override
  _ShoppingSearchCategoriesScreenState createState() =>
      _ShoppingSearchCategoriesScreenState();
}

class _ShoppingSearchCategoriesScreenState
    extends State<ShoppingSearchCategoriesScreen> {
  List<String> _listCategories = [
    "Tops",
    "Shirts & Sweaters",
    "Cardigans & Sweaters",
    "Knitwear",
    "Blazers",
    "Outerwear",
    "Pants",
    "Jeans",
    "Shorts",
    "Skirts",
    "Dresses"
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ShoppingPageInhiritedWidget.of(context)!
                .pageController
                .animateToPage(0,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0.5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Categories",
          style: TextsStyle.titleAppBar,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: size.width,
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      ShoppingPageInhiritedWidget.of(context)!
                          .pageController
                          .animateToPage(2,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      "VIEW ALL ITEMS",
                      style: TextStyle(color: Colors.white),
                    ),
                    visualDensity: VisualDensity.comfortable,
                    elevation: 0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Choose category",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black26, fontSize: 16),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _listCategories
                        .map((e) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(e,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 20,
                                      )),
                                ),
                                Divider(
                                  color: Colors.black12,
                                  height: 1,
                                )
                              ],
                            ))
                        .toList(),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
