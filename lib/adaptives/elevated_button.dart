import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveElevatedButton extends StatelessWidget {
  final String text;
  final Function handle;
  const AdaptiveElevatedButton({Key key, this.text, this.handle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handle,
            child:  Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          )
        : ElevatedButton(
            onPressed: handle,
            child:   Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          );
  }
}
