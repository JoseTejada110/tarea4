import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


showUsersList(BuildContext context, String title) {
  showCupertinoDialog(
    context: context, 
    builder: ( _ ) => CupertinoAlertDialog(
      title: Text(title),
      content: usersList(),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('Ok'),
          onPressed: () => Navigator.pop(context)
        )
      ],
    )
  );
}

Widget usersList() {
  return Container(
    
  );
}