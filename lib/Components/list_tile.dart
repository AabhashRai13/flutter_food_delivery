import 'package:flutter/material.dart';

class BuildListTile extends StatelessWidget {
  final String? image;
  final String? text;
  final Function? onTap;

  BuildListTile({this.image, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
      leading: Image.asset(
        image!,
        height: 25.3,
      ),
      title: Text(
        text!,
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(fontWeight: FontWeight.w500),
      ),
      onTap: onTap as void Function()?,
    );
  }
}
