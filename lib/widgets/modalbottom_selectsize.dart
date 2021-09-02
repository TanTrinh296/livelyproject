import 'package:flutter/material.dart';
import 'package:lightproject/models/widget_model/radio_model.dart';
import 'package:lightproject/resource/texts_stype.dart';
import 'package:lightproject/widgets/radio_item_categories.dart';

class ModalBottomSelectSizeWidget extends StatefulWidget {
  final List<RadioModelSize>? sampleDataCategory;
  const ModalBottomSelectSizeWidget({Key? key, this.sampleDataCategory})
      : super(key: key);

  @override
  _ModalBottomSelectSizeWidgetState createState() =>
      _ModalBottomSelectSizeWidgetState();
}

class _ModalBottomSelectSizeWidgetState
    extends State<ModalBottomSelectSizeWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) => Container(
              width: size.width,
              height: size.height / 2.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
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
                          "Select size",
                          style: TextsStyle.title.copyWith(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              width: size.width,
                              height: size.width / 3,
                              color: Colors.white,
                              child: GridView.count(
                                crossAxisCount: 3,
                                mainAxisSpacing: 5.0,
                                crossAxisSpacing: 5.0,
                                childAspectRatio: 2.2,
                                children: List.generate(
                                    widget.sampleDataCategory!.length,
                                    (index) => InkWell(
                                          onTap: () {
                                            setState(() {
                                              // sampleDataSize!.forEach((element) =>
                                              //     element.isSelected = false);
                                              widget.sampleDataCategory![index]
                                                      .isSelected =
                                                  !widget
                                                      .sampleDataCategory![
                                                          index]
                                                      .isSelected;
                                              // sizeProduct = sampleDataSize![index].buttonText;
                                              // print(sizeProduct);
                                            });
                                          },
                                          child: RadioItemCategories(
                                              widget.sampleDataCategory![index],
                                              ""),
                                        )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Size info",
                                      style: TextsStyle.title.copyWith(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Container(
                                width: size.width,
                                child: RaisedButton(
                                  color: Colors.red,
                                  onPressed: () {
                                    // Navigator.of(context)
                                    //     .pushNamed(
                                    //         "/home");
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text(
                                    "ADD TO CART",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  visualDensity: VisualDensity.comfortable,
                                  elevation: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}