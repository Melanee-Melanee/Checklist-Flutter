

import 'package:flutter/material.dart';
class Background2 extends StatelessWidget {
  final Widget child;
  const Background2({
    Key key,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 47,
            right: 65,
            child: Image.asset(
                "assets/images/dokhtar6.png",
                width: size.width *0.7
            ),
          ),

          child
        ],
      ),
    );
  }
}