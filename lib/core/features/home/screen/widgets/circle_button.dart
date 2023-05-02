import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CircleNavButton extends StatelessWidget {
  final IconData? icon;
  final double? iconSize;
  final Function onPressed;

  const CircleNavButton({
    Key? key,
    @required this.icon,
    @required this.iconSize,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        // color: Colors.grey[200],
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
          onPressed: onPressed as void Function()?,
          icon: Icon(icon),
          iconSize: iconSize ?? 30.0,
          color: Colors.black),
    );
  }
}
