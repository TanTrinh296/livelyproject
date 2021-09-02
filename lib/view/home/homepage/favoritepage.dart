import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lightproject/resource/colors_data.dart';
import 'package:lightproject/resource/icons_data.dart';
import 'package:lightproject/resource/texts_stype.dart';
import 'package:lightproject/widgets/bottom_appbar.dart';
import 'package:lightproject/widgets/itemproduct_grid_favories.dart';
import 'package:lightproject/widgets/itemproduct_horizontal_new.dart';
import 'package:lightproject/widgets/itemproduct_vertical_favories.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  ScrollController _scrollController = new ScrollController();
  StreamController<bool> _showTitleAppBar = StreamController<bool>.broadcast();
  StreamController<bool> _showGridView = StreamController<bool>.broadcast();
  GlobalKey _globalKey = GlobalKey();
  bool _checkGridView = false;
  List<String> _listFilters = [
    "Summer",
    "T-Shirts",
    "Shirts",
    "Hobbies",
    "Jacket",
    "Shorts",
  ];
  @override
  void initState() {
    // TODO: implement initState
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
                      "Favorites",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  );
                }),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: ColorsData.appBarIcon,
                  ))
            ],
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
                            "Favorites",
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
                        Container(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    this.setState(() {
                                      _checkGridView = !_checkGridView;
                                    });
                                  },
                                  icon: Icon(Icons.filter_list)),
                              Text("Filters")
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.import_export)),
                              Text("Price lowest to high")
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
          // StreamBuilder<bool>(
          //     stream: _showGridView.stream,
          //     initialData: true,
          //     builder: (context, snapshot) {
          //       return Visibility(
          //         visible: snapshot.data!,
          //         child: SliverGrid(
          //           gridDelegate:
          //               const SliverGridDelegateWithMaxCrossAxisExtent(
          //                   maxCrossAxisExtent: 200.0,
          //                   mainAxisSpacing: 5.0,
          //                   crossAxisSpacing: 5.0,
          //                   childAspectRatio: 0.59),
          //           delegate: SliverChildBuilderDelegate(
          //             (BuildContext context, int index) {
          //               return Padding(
          //                 padding: const EdgeInsets.all(10.0),
          //                 child: ItemProductGridWidget(),
          //               );
          //             },
          //             childCount: 10,
          //           ),
          //         ),
          //       );
          //     }),
          // StreamBuilder<bool>(
          //     stream: _showGridView.stream,
          //     initialData: false,
          //     builder: (context, snapshot) {
          //       return
          //       Visibility(
          //         visible: !snapshot.data!,
          //         child:
          _checkGridView == false
              ? SliverList(
                  delegate: SliverChildListDelegate(
                      List.generate(5, (index) => ItemProductVertical())))
              : SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: size.width / 2,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 20.0,
                          childAspectRatio: size.aspectRatio * 1 / 0.87),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ItemProductGridWidget();
                        },
                        childCount: 10,
                      )),
                ),

          // );
          // })
        ],
      ),
    );
  }
}
