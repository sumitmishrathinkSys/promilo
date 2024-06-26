import 'package:flutter/material.dart';

class SocialMediaWidget extends StatelessWidget {
  final String path;
  const SocialMediaWidget({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10),
        child: Image.asset(
          path,
          width: 40,
          height: 40,
        ));
  }
}
