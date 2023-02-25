import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16,
      );

  static getLoader() => const Center(
        child: SpinKitCubeGrid(
          size: 70,
          duration: Duration(milliseconds: 700),
          color: Colors.green,
        ),
      );

  static showLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const Center(
            child: CircularProgressIndicator(color: Colors.green),
          ),
        );
      },
    );
  }
}
