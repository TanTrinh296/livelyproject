import 'package:flutter/material.dart';
import 'package:lightproject/resource/colors_data.dart';
import 'package:lightproject/resource/texts_stype.dart';
import 'package:lightproject/view/home/homepage/shoppingpage.dart';

class ShoppingCategoriesScreen extends StatefulWidget {
  const ShoppingCategoriesScreen({Key? key}) : super(key: key);

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingCategoriesScreen>
    with TickerProviderStateMixin {
  List<String> _listFilter = ["Women", "Men", "Kids"];
  List<String> _listItem = ["New", "Clothes", "Shoes", "Accessories"];
  TabController? _tabBarController;
  @override
  void initState() {
    // TODO: implement initState
    _tabBarController = TabController(length: _listFilter.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Categories",
          style: TextsStyle.titleAppBar,
        ),
        actions: [
          IconButton(
              onPressed: () {
                ShoppingPageInhiritedWidget.of(context)!.pageController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
              },
              icon: Icon(
                Icons.search,
                color: ColorsData.appBarIcon,
              ))
        ],
      ),
      body: TabBarView(
        controller: _tabBarController,
        children: List.generate(
          3,
          (index) => ListView(
            children: [
              Container(
                color: Colors.white,
                child: TabBar(
                    controller: _tabBarController!,
                    tabs: _listFilter
                        .map((e) => Tab(
                              text: e,
                            ))
                        .toList()),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: size.width / 4,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Colors.red.shade700,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("SUMMER SALES",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                )),
                            Text("Up to 50% off",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: _listItem
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                        height: size.width / 4,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: LayoutBuilder(builder:
                                            (BuildContext context,
                                                BoxConstraints constraints) {
                                          return Row(
                                            children: [
                                              Container(
                                                height: constraints.maxHeight,
                                                width: constraints.maxWidth / 2,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(e,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: constraints.maxHeight,
                                                width: constraints.maxWidth / 2,
                                                child: Image.network(
                                                  "https://www.apetogentleman.com/wp-content/uploads/2020/01/hoodies-wear-4.jpg",
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            ],
                                          );
                                        })),
                                  ),
                                ))
                            .toList())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
