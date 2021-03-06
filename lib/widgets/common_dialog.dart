
import 'package:flutter/material.dart';
import 'package:lightproject/resource/dimen.dart';
import 'package:lightproject/resource/texts_stype.dart';
typedef OnClickOK();
typedef OnClickYes();
typedef OnClickNo();

Future<T?> showOkDialog<T>(@required BuildContext context, @required String text, OnClickOK onClickOK, [bool? clickoutSide, Color? buttonColor, String? textButton]) async => showDialog(
      context: context,
      builder: (conontext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimen.dialogRadius)),
          title: Text(text, textAlign: TextAlign.center),
          titleTextStyle: TextsStyle.title,
          // ignore: deprecated_member_use
          content: RaisedButton(
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
              // ignore: unnecessary_null_comparison
              if (onClickOK != null) {
                onClickOK();
              }
            },
            child: Text(textButton ?? "OK"),
          ),
          // actions: [
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       RaisedButton(
          //         onPressed: () {
          //           if (Navigator.of(context).canPop()) {
          //             Navigator.of(context).pop();
          //           }
          //           if (onClickOK != null) {
          //             onClickOK();
          //           }
          //         },
          //         child: Text(textButton ?? "OK"),
          //       ),
          //     ],
          //   )
          // ],
        );
      },
    );

Future<T?> showYesNoDialog<T>(@required BuildContext context, @required String text, OnClickOK onClickOK, [bool? clickoutSide, Color? buttonColor, String? textButton]) async {
  // return Text("");
}

// void showPhotoView(BuildContext context, final List<String> imageUrls, final int initIndex) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => NetworkPhotoView(
//         imageUrls: imageUrls,
//         backgroundDecoration: const BoxDecoration(
//           color: Colors.black,
//         ),
//         initialIndex: initIndex,
//         scrollDirection: Axis.horizontal,
//       ),
//     ),
//   );
// }

// Future<PickerSource> showPickerSource(BuildContext context) async {
//   var result = await showModalBottomSheet(
//     context: context,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
//     builder: (context) => Container(
//       margin: EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           RaisedButton(
//             onPressed: () {
//               Navigator.of(context).pop(PickerSource.CAMERA);
//             },
//             child: Text("Ch???p ???nh"),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           RaisedButton(
//             onPressed: () {
//               Navigator.of(context).pop(PickerSource.GALLERY);
//             },
//             child: Text("Th?? vi???n ???nh"),
//           ),
//           SizedBox(height: 30),
//           // RaisedButton(
//           //   onPressed: () {
//           //     Navigator.of(context).pop(PickerSource.FILE);
//           //   },
//           //   child: Text("T???p tin"),
//           // ),
//           // Spacer(),
//           RaisedButton(
//             onPressed: () {
//               Navigator.of(context).pop(PickerSource.NONE);
//             },
//             child: Text("Hu???"),
//             color: Colors.red[400],
//           ),
//         ],
//       ),
//     ),
//   );
//   return result ?? PickerSource.NONE;
// }
