import 'package:flutter/material.dart';
import 'package:lightproject/resource/texts_stype.dart';
import 'package:lightproject/view/shopping/shopping_categories_item_filter.dart';

class ShoppingCategoriesItemBrandWidget extends StatefulWidget {
  const ShoppingCategoriesItemBrandWidget({Key? key}) : super(key: key);

  @override
  _ShoppingCategoriesItemBrandWidgetState createState() =>
      _ShoppingCategoriesItemBrandWidgetState();
}

class _ShoppingCategoriesItemBrandWidgetState
    extends State<ShoppingCategoriesItemBrandWidget> {
  List<CheckBoxItem> _checkbox = [];
  @override
  void initState() {
    // TODO: implement initState
    _checkbox.add(CheckBoxItem(true, "Adidas", ""));
    _checkbox.add(CheckBoxItem(true, "Adidas Originals", ""));
    _checkbox.add(CheckBoxItem(false, "Blend", ""));
    _checkbox.add(CheckBoxItem(true, "Boutique Moschino", ""));
    _checkbox.add(CheckBoxItem(false, "Champion", ""));
    _checkbox.add(CheckBoxItem(false, "Diesel", ""));
    _checkbox.add(CheckBoxItem(false, "Jack & Jones", ""));
    _checkbox.add(CheckBoxItem(true, "Naf Naf", ""));
    _checkbox.add(CheckBoxItem(false, "Red Valentino", ""));
    _checkbox.add(CheckBoxItem(true, "s.Oliver", ""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {
            ShoppingCategoriesItemFilterInhirited.of(context)!
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
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Brand",
          style: TextsStyle.titleAppBar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Form(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      border: InputBorder.none,
                      focusColor: Colors.red),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _checkbox
                  .map(
                    (e) => CheckboxListTile(
                      value: e.active,
                      onChanged: (v) {
                        e.active = v!;
                        this.setState(() {});
                      },
                      title: Text(
                        e.title,
                        style: TextStyle(
                            color:
                                e.active == true ? Colors.red : Colors.black),
                      ),
                      checkColor: Colors.white,
                      activeColor: Colors.red,
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class CheckBoxItem {
  late bool active;
  late String title;
  late String value;
  CheckBoxItem(
    this.active,
    this.title,
    this.value,
  );
}
