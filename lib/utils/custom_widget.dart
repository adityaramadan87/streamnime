import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:stream_nime/constant/color.dart';

class CustomWidget {
  static Widget defaultButton(
      {required String label,
      required double width,
      required Function() onPressed,
      double height = 48,
      Color color = primary,
      double radius = 16,
      double fontSize = 14,
      FontWeight fontWeight = FontWeight.bold}) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))),
        ),
        child: Text(
          "$label",
          style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
        ),
      ),
    );
  }

  static Widget defaultTextField(TextEditingController controller, String label, IconData icons, bool obscureText) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {},
        child: TextField(
          controller: controller,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: "$label",
            labelStyle: TextStyle(
              fontSize: 14,
            ),
            icon: Icon(
              icons,
              size: 24,
              color: primary,
            ),
          ),
        ),
      ),
    );
  }

  static void showDialogConfirmation(BuildContext context, String title, String desc, Function() okPress) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        animType: AnimType.BOTTOMSLIDE,
        title: title,
        desc: desc,
        btnOkOnPress: okPress,
        btnCancelOnPress: () {})
      ..show();
  }

  static Future<dynamic> showDialogSuccess(BuildContext context, String title, String desc) {
     return Future.value(AwesomeDialog(
       context: context,
       dialogType: DialogType.SUCCES,
       animType: AnimType.BOTTOMSLIDE,
       title: title,
       desc: desc,
       btnOkOnPress: (){},
     )..show());
  }

  static void showDialogError(BuildContext context, String title, String desc) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: "$title",
        desc: desc.contains("connectTimeout") ? "Connection Timeout, try again" : "$desc",
        btnOkOnPress: () {

        }
    )..show();
  }

  static Widget roundedBackButton({required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.only(top: 16, left: 16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: darkCard.withOpacity(0.5),
        ),
        child: Align(
          alignment: Alignment.center,
          child:  Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  static Widget searchBar(TextEditingController controller, String hint, Function(String) onChange) {
    return TextField(
      textInputAction: TextInputAction.done,
      controller: controller,
      style: TextStyle(color: Colors.white),
      onChanged: onChange,
      autofocus: true,
      decoration: new InputDecoration(
          hintText: '$hint',
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintStyle: TextStyle(color: Colors.white)),
    );
  }
}
