import 'package:flutter/material.dart';

class EntryFormField extends StatelessWidget {
  final String? label;
  final String title;
  EntryFormField(this.label, this.title);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        label != null
            ? Row(
                children: [
                  Text(
                    label!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 12),
                  ),
                ],
              )
            : SizedBox.shrink(),
        TextFormField(
          decoration: InputDecoration(
              prefixStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              hintText: title,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black, fontSize: 17)),
        ),
      ],
    );
  }
}

class SmallTextFormField extends StatelessWidget {
  final String? label;
  final String? title;
  final Icon? icon;
  final String? initial;

  SmallTextFormField(this.label, this.title, [this.icon, this.initial]);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          label != null
              ? Row(
                  children: [
                    Text(
                      label!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 11),
                    ),
                  ],
                )
              : SizedBox.shrink(),
          TextFormField(
            initialValue: initial,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.black, fontSize: 14),
            decoration: InputDecoration(
                suffix: icon,
                isDense: true,
                prefixStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.black, fontSize: 12),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                hintText: title ?? null,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.grey, fontSize: 14)),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}

class SmallTextFormFieldR extends StatelessWidget {
  final String label;
  final String? title;
  final Icon? icon;
  final String? initial;

  SmallTextFormFieldR(this.label, this.title, [this.icon, this.initial]);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          label != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 11),
                    ),
                  ],
                )
              : SizedBox.shrink(),
          TextFormField(
            textAlign: TextAlign.end,
            initialValue: initial,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.black, fontSize: 14),
            decoration: InputDecoration(
                suffix: icon,
                isDense: true,
                prefixStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.black, fontSize: 12),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                hintText: title ?? null,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.grey, fontSize: 14)),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}

class SmallImageTextFormField extends StatelessWidget {
  final String img;
  final String label;
  final String title;
  SmallImageTextFormField(this.img, this.label, this.title);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        label != null
            ? Row(
                children: [
                  Text(
                    label,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 11),
                  ),
                ],
              )
            : SizedBox.shrink(),
        TextFormField(
          decoration: InputDecoration(
              isDense: true,
              prefixStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              hintText: title,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black, fontSize: 14)),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
