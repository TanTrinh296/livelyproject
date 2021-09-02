import 'package:flutter/material.dart';
import 'package:lightproject/resource/colors_data.dart';
import 'package:lightproject/resource/texts_stype.dart';
import 'package:lightproject/view/shopping/shopping_categories_item_screen.dart';
import 'package:lightproject/view/shopping/shopping_categories_screen.dart';
import 'package:lightproject/view/shopping/shopping_search_categorires_screen.dart';
import 'package:preload_page_view/preload_page_view.dart';

class ShoppingPageInhiritedWidget extends InheritedWidget {
  final PreloadPageController pageController;
  ShoppingPageInhiritedWidget(
      {required this.pageController, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static ShoppingPageInhiritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ShoppingPageInhiritedWidget>();
  }
}

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  TabController? _tabBarController;
  PreloadPageController _pageController =
      new PreloadPageController(initialPage: 0);
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ShoppingPageInhiritedWidget(
        pageController: _pageController,
        child: PreloadPageView(
          controller: _pageController,
          preloadPagesCount: 3,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            ShoppingCategoriesScreen(),
            ShoppingSearchCategoriesScreen(),
            ShoppingCategoriesItemScreen(),
          ],
        ),
      ),
    );
  }
}
