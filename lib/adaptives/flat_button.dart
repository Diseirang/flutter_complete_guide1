import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptiveTextButton extends StatelessWidget {
  final String text;
  final Function handler;

  const AdaptiveTextButton({Key key, this.text, this.handler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: Text(
              text,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          )
        : TextButton(
            onPressed: handler,
            child: Text(
              text,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          );
  }
}
