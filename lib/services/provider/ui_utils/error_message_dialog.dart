import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showErrorMessage({
  required String message,
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        "Error",
        style: TextStyle(fontWeight: FontWeight.w800),
      ),
      content: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Text(
          message,
          style:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          isDefaultAction: true,
          child: const Text("OK"),
        )
      ],
    ),
  );
}

Future<void> showConfirmMessage({
  required String message,
  required BuildContext context,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Colors.white,
      content: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Text(
          message,
          style: const TextStyle(
              fontWeight: FontWeight.w500, color: Color(0xFF273032)),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          isDefaultAction: true,
          child: const Text("OK"),
        )
      ],
    ),
  );
}
