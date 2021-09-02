import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lightproject/models/widget_model/listtle_model.dart';
import 'package:lightproject/models/widget_model/radio_model.dart';
import 'package:lightproject/resource/colors_data.dart';
import 'package:lightproject/resource/icons_data.dart';
import 'package:lightproject/resource/texts_stype.dart';
import 'package:lightproject/view/home/homepage/shoppingpage.dart';
import 'package:lightproject/widgets/bottom_appbar.dart';
import 'package:lightproject/widgets/itemproduct_grid_categories.dart';
import 'package:lightproject/widgets/itemproduct_grid_favories.dart';
import 'package:lightproject/widgets/itemproduct_horizontal_new.dart';
import 'package:lightproject/widgets/itemproduct_vertical_categories.dart';
import 'package:lightproject/widgets/itemproduct_vertical_favories.dart';
import 'package:lightproject/widgets/modalbottom_selectsize.dart';
import 'package:lightproject/widgets/modalbottom_sort.dart';

class ModalBottomSortInhirited extends InheritedWidget {
  final String choseSort;
  ModalBottomSortInhirited({required this.choseSort, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static ModalBottomSortInhirited? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ModalBottomSortInhirited>();
  }
}

class ShoppingCategoriesItemScreen extends StatefulWidget {
  const ShoppingCategoriesItemScreen({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<ShoppingCategoriesItemScreen> {
  ScrollController _scrollController = new ScrollController();
  StreamController<bool> _showTitleAppBar = StreamController<bool>.broadcast();
  StreamController<bool> _showGridView = StreamController<bool>.broadcast();
  GlobalKey _globalKey = GlobalKey();
  bool _checkGridView = false;
  List<String> _listFilters = [
    "T-Shirts",
    "Crop tops",
    "Sleeveless",
    "Blouses",
    "Outerwear",
    "Shirt",
    "Pullover"
  ];
  List<ListTileItem> _listTileItem = [];
  List<RadioModelSize>? _sampleDataCategory = [];
  String _choseSort = "Price lowest to high";
  @override
  void initState() {
    _sampleDataCategory!.add(RadioModelSize(true, 'XS'));
    _sampleDataCategory!.add(RadioModelSize(true, 'S'));
    _sampleDataCategory!.add(RadioModelSize(false, 'M'));
    _sampleDataCategory!.add(RadioModelSize(false, 'L'));
    _sampleDataCategory!.add(RadioModelSize(false, 'XL'));
    _listTileItem.add(ListTileItem(false, "Popular", "Popular"));
    _listTileItem.add(ListTileItem(false, "Newest", "Newest"));
    _listTileItem
        .add(ListTileItem(false, "Customer Review", "Customer Review"));
    _listTileItem.add(
        ListTileItem(true, "Price:lowest to high", "Price lowest to high"));
    _listTileItem.add(
        ListTileItem(false, "Price:highest to low", "Price highest to low"));
    _scrollController.addListener(() {
      if (_scrollController.offset > kToolbarHeight + 15 &&
          _scrollController.offset < kToolbarHeight + 100) {
        _showTitleAppBar.add(false);
      } else if (_scrollController.offset < kToolbarHeight) {
        _showTitleAppBar.add(true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _showGridView.close();
    _scrollController.dispose();
    _showTitleAppBar.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _globalKey,
      extendBody: false,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            forceElevated: true,
            floating: false,
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
            pinned: true,
            snap: false,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: StreamBuilder<bool>(
                stream: _showTitleAppBar.stream,
                initialData: true,
                builder: (context, snapshot) {
                  return Visibility(
                    visible: !snapshot.data!,
                    child: Text(
                      "Women's tops",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  );
                }),
            centerTitle: true,
            // actions: [
            //   IconButton(
            //       onPressed: () {},
            //       icon: Icon(
            //         Icons.search,
            //         color: ColorsData.appBarIcon,
            //       ))
            // ],
            expandedHeight: size.height / 3.5,
            flexibleSpace: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<bool>(
                    stream: _showTitleAppBar.stream,
                    initialData: true,
                    builder: (context, snapshot) {
                      return Visibility(
                        visible: snapshot.data!,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Women's tops",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                      );
                    }),
              ],
            ),
            bottom: PreferredSize(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: size.width,
                        height: 30,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                              _listFilters.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Container(
                                      height: 15,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Center(
                                        child: Text(
                                          _listFilters[index],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed("/categoriesfilter");
                          },
                          child: Container(
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.filter_list)),
                                Text("Filters")
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext buildContext) =>
                                            ModalBottomSortInhirited(
                                              choseSort: _choseSort,
                                              child: ModalBottomSortWidget(
                                                  listTileItem: _listTileItem),
                                            ));
                                  },
                                  icon: Icon(Icons.import_export)),
                              Text(_choseSort)
                            ],
                          ),
                        ),
                        Container(
                          child: IconButton(
                              onPressed: () {
                                this.setState(() {
                                  _checkGridView = !_checkGridView;
                                });
                              },
                              icon: Icon(Icons.list_rounded)),
                        ),
                      ],
                    ),
                  ],
                ),
                preferredSize: Size.fromHeight(75)),
          ),

          _checkGridView == false
              ? SliverList(
                  delegate: SliverChildListDelegate(List.generate(
                      5,
                      (index) => GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext builder) =>
                                    ModalBottomSelectSizeWidget(
                                      sampleDataCategory: _sampleDataCategory,
                                    ));
                          },
                          child: ItemProductVerticalCategories()))))
              : SliverPadding(
                  padding: EdgeInsets.all(15),
                  sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: size.width / 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: size.aspectRatio * 1 / 0.87),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext builder) =>
                                          ModalBottomSelectSizeWidget(
                                            sampleDataCategory:
                                                _sampleDataCategory,
                                          ));
                                },
                                child: ItemProductGridCategoriesWidget()),
                          );
                        },
                        childCount: 10,
                      )),
                )
          // );
          // })
        ],
      ),
    );
  }
}
