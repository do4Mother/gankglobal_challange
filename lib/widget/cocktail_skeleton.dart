import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class CocktailSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SkeletonAnimation(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey[300]
            ),
            width: 150,
            height: 150,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SkeletonAnimation(
          child: Container(
            color: Colors.grey[300],
            width: 90,
            height: 20,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        SkeletonAnimation(
          child: Container(
            color: Colors.grey[300],
            width: 90,
            height: 20,
          ),
        ),
      ],
    );
  }
}