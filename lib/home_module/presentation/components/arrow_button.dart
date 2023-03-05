
import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final Widget ? child;
  final void Function() ? onTap;
  const ArrowButton({Key? key, this.child,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 43,
        width: 43,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18)
        ),
        child: Center(child:child),
      ),
    );
  }
}
