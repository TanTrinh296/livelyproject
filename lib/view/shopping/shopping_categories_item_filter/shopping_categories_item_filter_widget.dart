import 'package:flutter/material.dart';
import 'package:lightproject/resource/colors_data.dart';
import 'package:lightproject/resource/texts_stype.dart';

import '../shopping_categories_item_filter.dart';

class ShoppingCategoriesItemFilterWidget extends StatefulWidget {
  const ShoppingCategoriesItemFilterWidget({Key? key}) : super(key: key);

  @override
  _ShoppingCategoriesItemFilterWidgetState createState() =>
      _ShoppingCategoriesItemFilterWidgetState();
}

class _ShoppingCategoriesItemFilterWidgetState
    extends State<ShoppingCategoriesItemFilterWidget> {
  // ignore: deprecated_member_use
  List<RadioModelSize>? sampleDataSize = [];
  List<RadioModelSize>? sampleDataCategory = [];
  List<RadioModelColor> sampleDataColor = [];
  var _selectedRage = RangeValues(100, 200);
  @override
  void initState() {
    // ignore: deprecated_member_use
    sampleDataSize!.add(RadioModelSize(true, 'XS'));
    sampleDataSize!.add(RadioModelSize(true, 'S'));
    sampleDataSize!.add(RadioModelSize(false, 'M'));
    sampleDataSize!.add(RadioModelSize(false, 'L'));
    sampleDataSize!.add(RadioModelSize(false, 'XL'));
    sampleDataCategory!.add(RadioModelSize(true, 'ALL'));
    sampleDataCategory!.add(RadioModelSize(true, 'Women'));
    sampleDataCategory!.add(RadioModelSize(false, 'Men'));
    sampleDataCategory!.add(RadioModelSize(false, 'Boys'));
    sampleDataCategory!.add(RadioModelSize(false, 'Girls'));
    sampleDataColor.add(RadioModelColor(true, Colors.black, "black"));
    sampleDataColor.add(RadioModelColor(false, Colors.grey, "grey"));
    sampleDataColor.add(RadioModelColor(false, Colors.red.shade400, "red"));
    sampleDataColor
        .add(RadioModelColor(false, Colors.deepOrange.shade50, "deeporange"));
    sampleDataColor
        .add(RadioModelColor(false, Colors.orange.shade100, "orange"));
    sampleDataColor.add(RadioModelColor(false, Colors.indigo.shade900, "blue"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Filters",
          style: TextsStyle.titleAppBar,
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  "Price range",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Container(
                height: size.width / 4,
                width: size.width,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$${_selectedRage.start.toInt()}"),
                          Text("\$${_selectedRage.end.toInt()}")
                        ],
                      ),
                    ),
                    RangeSlider(
                        activeColor: Colors.red,
                        values: _selectedRage,
                        min: 0,
                        max: 300,
                        // divisions: 300,
                        onChanged: (RangeValues values) {
                          this.setState(() {
                            _selectedRage = values;
                          });
                        })
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  "Colors",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Container(
                height: size.width / 4,
                width: size.width,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: List.generate(
                            sampleDataColor.length,
                            (index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      // sampleDataColor.forEach((element) => element.isSelected = false);
                                      sampleDataColor[index].isSelected =
                                          !sampleDataColor[index].isSelected;
                                      // colorProduct = sampleDataColor[index].text;
                                    });
                                  },
                                  child: RadioItemColor(sampleDataColor[index]),
                                )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  "Sizes",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Container(
                height: size.width / 4,
                width: size.width,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: List.generate(
                            sampleDataSize!.length,
                            (index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      // sampleDataSize!.forEach((element) =>
                                      //     element.isSelected = false);
                                      sampleDataSize![index].isSelected =
                                          !sampleDataSize![index].isSelected;
                                      // sizeProduct = sampleDataSize![index].buttonText;
                                      // print(sizeProduct);
                                    });
                                  },
                                  child: RadioItemSize(sampleDataSize![index]),
                                )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  "Category",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: size.width,
                height: size.width / 3,
                color: Colors.white,
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  childAspectRatio: 2.2,
                  children: List.generate(
                      sampleDataCategory!.length,
                      (index) => InkWell(
                            onTap: () {
                              setState(() {
                                // sampleDataSize!.forEach((element) =>
                                //     element.isSelected = false);
                                sampleDataCategory![index].isSelected =
                                    !sampleDataCategory![index].isSelected;
                                // sizeProduct = sampleDataSize![index].buttonText;
                                // print(sizeProduct);
                              });
                            },
                            child:
                                RadioItemCategories(sampleDataCategory![index]),
                          )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Brand",
                            style: TextsStyle.title.copyWith(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        Text(
                          "adidas Originals, Jack & Jones, s.Oliver",
                          style: TextsStyle.subTitle,
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        ShoppingCategoriesItemFilterInhirited.of(context)!
                            .pageController
                            .animateToPage(1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RadioItemSize extends StatelessWidget {
  final RadioModelSize _item;
  RadioItemSize(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 40.0,
            width: 40.0,
            child: Center(
              child: Text(_item.buttonText,
                  style: TextStyle(
                      color: _item.isSelected
                          ? Colors.white
                          : ColorsData.textTitle,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
            decoration: BoxDecoration(
              color: _item.isSelected ? Colors.red : Colors.transparent,
              border: Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Colors.red : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioItemCategories extends StatelessWidget {
  final RadioModelSize _item;
  RadioItemCategories(this._item);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 40.0,
            width: size.width/4,
            child: Center(
              child: Text(_item.buttonText,
                  style: TextStyle(
                      color: _item.isSelected
                          ? Colors.white
                          : ColorsData.textTitle,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
            decoration: BoxDecoration(
              color: _item.isSelected ? Colors.red : Colors.transparent,
              border: Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Colors.red : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioModelSize {
  bool isSelected;
  final String buttonText;

  RadioModelSize(this.isSelected, this.buttonText);
}

class RadioItemColor extends StatelessWidget {
  final RadioModelColor _item;
  RadioItemColor(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  color: _item.isSelected ? Colors.transparent : _item.color,
                  border: Border.all(
                      width: 1.0,
                      color:
                          _item.isSelected ? Colors.red : Colors.transparent),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(100)),
                ),
              ),
              Positioned.fill(
                  child: Center(
                child: Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    color: _item.color,
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(100)),
                  ),
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}

class RadioModelColor {
  bool isSelected;
  Color color;
  String text;
  RadioModelColor(this.isSelected, this.color, this.text);
}
