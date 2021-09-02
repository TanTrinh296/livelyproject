import 'package:flutter/material.dart';
import 'package:lightproject/resource/colors_data.dart';
import 'package:lightproject/resource/texts_stype.dart';
import 'package:lightproject/view/shopping/shopping_categories_item_filter/shopping_categories_item_brand_widget.dart';
import 'package:lightproject/view/shopping/shopping_categories_item_filter/shopping_categories_item_filter_widget.dart';
import 'package:preload_page_view/preload_page_view.dart';

class ShoppingCategoriesItemFilterInhirited extends InheritedWidget {
  final PreloadPageController pageController;
  ShoppingCategoriesItemFilterInhirited(
      {required this.pageController, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static ShoppingCategoriesItemFilterInhirited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<
        ShoppingCategoriesItemFilterInhirited>();
  }
}

class ShoppingCategoriesItemFilter extends StatefulWidget {
  const ShoppingCategoriesItemFilter({Key? key}) : super(key: key);

  @override
  _ShoppingCategoriesItemFilterWidgetState createState() =>
      _ShoppingCategoriesItemFilterWidgetState();
}

class _ShoppingCategoriesItemFilterWidgetState
    extends State<ShoppingCategoriesItemFilter> {
  PreloadPageController _pageController =
      new PreloadPageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ShoppingCategoriesItemFilterInhirited(
          pageController: _pageController,
          child: PreloadPageView(
            controller: _pageController,
            preloadPagesCount: 2,
            children: [
              ShoppingCategoriesItemFilterWidget(),
              ShoppingCategoriesItemBrandWidget()
            ],
          ),
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: OutlineButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Discard"),
                        visualDensity: VisualDensity.comfortable,
                        borderSide: BorderSide(color: Colors.grey),
                        textColor: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Apply"),
                        visualDensity: VisualDensity.comfortable,
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
