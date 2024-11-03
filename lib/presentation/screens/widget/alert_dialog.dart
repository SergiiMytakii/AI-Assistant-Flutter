import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<bool> showAlertDialog(BuildContext context, String message,
    {bool showCancelButton = false}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        alignment: Alignment.center,
        content: Text(message),
        actions: <Widget>[
          if (showCancelButton)
            TextButton(
              child: Text('Cancel'.tr()),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          TextButton(
            child: Text('Ok'.tr()),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
  return result ?? false;
}
