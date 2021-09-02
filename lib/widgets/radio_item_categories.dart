import 'package:flutter/material.dart';
import 'package:lightproject/models/widget_model/radio_model.dart';
import 'package:lightproject/resource/colors_data.dart';

class RadioItemCategories extends StatelessWidget {
  final RadioModelSize _item;
  RadioItemCategories(this._item, String s);
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
            width: size.width / 4,
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
