import 'package:flutter/material.dart';
import 'package:lightproject/models/widget_model/listtle_model.dart';
import 'package:lightproject/resource/texts_stype.dart';
import 'package:lightproject/view/shopping/shopping_categories_item_screen.dart';

class ModalBottomSortWidget extends StatefulWidget {
  final List<ListTileItem> listTileItem;
  const ModalBottomSortWidget({Key? key, required this.listTileItem}) : super(key: key);

  @override
  _ModalBottomSortWidgetState createState() => _ModalBottomSortWidgetState();
}

class _ModalBottomSortWidgetState extends State<ModalBottomSortWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) => ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              child: Container(
                width: size.width,
                height: size.height / 2.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: 80,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Sort by",
                            style: TextsStyle.title.copyWith(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.listTileItem
                            .map(
                              (e) => Container(
                                color: e.active == true
                                    ? Colors.red
                                    : Colors.white,
                                child: ListTile(
                                  // selected:
                                  //     e.active,
                                  // selectedTileColor:
                                  //     Colors.red,
                                  onTap: () {
                                    widget.listTileItem.forEach((element) {
                                      element.active = false;
                                    });
                                    e.active = true;
                                    // _choseSort = e.value;
                                    setModalState(() {});
                                    setState(() {});
                                  },
                                  title: Text(
                                    e.title,
                                    style: TextStyle(
                                        color: e.active == true
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
