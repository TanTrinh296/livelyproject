import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lightproject/resource/colors_data.dart';
import 'package:lightproject/resource/colors_tabbar_home.dart';
import 'package:lightproject/resource/icons_data.dart';
import 'package:lightproject/view/home/homepage/bagpage.dart';
import 'package:lightproject/view/home/homepage/favoritepage.dart';
import 'package:lightproject/view/home/homepage/homepage.dart';
import 'package:lightproject/view/home/homepage/profilepage.dart';
import 'package:lightproject/view/home/homepage/shoppingpage.dart';
import 'package:preload_page_view/preload_page_view.dart';

class HomeInheritedWidget extends InheritedWidget {
  final PreloadPageController pageController;
  HomeInheritedWidget({required this.pageController, required Widget child})
      : super(child: child);
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static HomeInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomeInheritedWidget>();
  }
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageScreen> {
  PreloadPageController _pageController =
      new PreloadPageController(initialPage: 0);
  int _currentIndex = 0;
  final List _listBNBar = [
    [IconsData.ic_home, "Home"],
    [IconsData.ic_cart, "Shopping"],
    [IconsData.ic_product, "Bag"],
    [IconsData.ic_cart, "Favorites"],
    [IconsData.ic_person, "Profile"]
  ];
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        // extendBody: true,
        body: HomeInheritedWidget(
          pageController: _pageController,
          child: PreloadPageView(
            controller: _pageController,
            preloadPagesCount: 4,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              HomePage(),
              ShoppingPage(),
              BagPage(),
              FavoritesPage(),
              ProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          child: Container(
            // height: 60,
            // decoration: BoxDecoration(
            //     // boxShadow: [
            //     //   BoxShadow(
            //     //       color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            //     // ],
            //     color: Colors.white,
            //     borderRadius: BorderRadius.only(
            //       topRight: Radius.circular(10),
            //       topLeft: Radius.circular(10),
            //     )),
            child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  _pageController.animateToPage(index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                  _currentIndex = index;
                });
              },
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    _listBNBar[0][0],
                    color: _currentIndex == 0
                        ? ColorsTabbarHome.selectedBottom
                        : ColorsTabbarHome.unselectTitle,
                  ),
                  label: _listBNBar[0][1],
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    _listBNBar[1][0],
                    color: _currentIndex == 1
                        ? ColorsTabbarHome.selectedBottom
                        : ColorsTabbarHome.unselectTitle,
                  ),
                  label: _listBNBar[1][1],
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: _currentIndex == 2
                        ? ColorsTabbarHome.selectedBottom
                        : ColorsTabbarHome.unselectTitle,
                  ),
                  label: _listBNBar[2][1],
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    color: _currentIndex == 3
                        ? ColorsTabbarHome.selectedBottom
                        : ColorsTabbarHome.unselectTitle,
                  ),
                  label: _listBNBar[3][1],
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    _listBNBar[4][0],
                    color: _currentIndex == 4
                        ? ColorsTabbarHome.selectedBottom
                        : ColorsTabbarHome.unselectTitle,
                  ),
                  label: _listBNBar[4][1],
                ),
              ],
            ),
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: FloatingShoppingCart(),
      ),
    );
  }
}
