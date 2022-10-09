import 'package:flutter/material.dart';
import 'package:hungerz_store/Themes/colors.dart';

class EntryField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? image;
  final String? initialValue;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final String? hint;
  final InputBorder? border;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function? onTap;
  final TextCapitalization? textCapitalization;

  EntryField({
    this.controller,
    this.label,
    this.image,
    this.initialValue,
    this.readOnly,
    this.keyboardType,
    this.maxLength,
    this.hint,
    this.border,
    this.prefix,
    this.maxLines,
    this.suffixIcon,
    this.onTap,
    this.textCapitalization,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: Column(
        children: [
          TextFormField(
            textCapitalization:
                textCapitalization ?? TextCapitalization.sentences,
            cursorColor: kMainColor,
            onTap: onTap as void Function()?,
            autofocus: false,
            controller: controller,
            initialValue: initialValue,
            style: Theme.of(context).textTheme.caption,
            readOnly: readOnly ?? false,
            keyboardType: keyboardType,
            minLines: 1,
            maxLength: maxLength,
            maxLines: maxLines,
            decoration: InputDecoration(
              prefix: prefix ?? null,
              prefixIcon: prefixIcon ?? null,
              suffixIcon: suffixIcon,
              labelText: label ?? null,
              hintText: hint,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.grey, fontSize: 15),
              border: border ??
                  UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]!),
                  ),
              enabledBorder: border ??
                  UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]!),
                  ),
              focusedBorder: border ??
                  UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]!),
                  ),
              counter: Offstage(),
              icon: (image != null)
                  ? ImageIcon(
                      AssetImage(image!),
                      color: kMainColor,
                      size: 20.0,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

class EntryFieldR extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? image;
  final String? initialValue;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final String? hint;
  final InputBorder? border;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function? onTap;
  final TextCapitalization? textCapitalization;

  EntryFieldR({
    this.controller,
    this.label,
    this.image,
    this.initialValue,
    this.readOnly,
    this.keyboardType,
    this.maxLength,
    this.hint,
    this.border,
    this.prefix,
    this.maxLines,
    this.suffixIcon,
    this.onTap,
    this.textCapitalization,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: Column(
        children: [
          TextFormField(
            textAlign: TextAlign.right,
            textCapitalization:
                textCapitalization ?? TextCapitalization.sentences,
            cursorColor: kMainColor,
            onTap: onTap as void Function()?,
            autofocus: false,
            controller: controller,
            initialValue: initialValue ?? null,
            style: Theme.of(context).textTheme.caption,
            readOnly: readOnly ?? false,
            keyboardType: keyboardType,
            minLines: 1,
            maxLength: maxLength,
            maxLines: maxLines,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              prefix: prefix ?? null,
              prefixIcon: prefixIcon ?? null,
              suffixIcon: suffixIcon,
              labelText: label ?? null,
              hintText: hint,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.grey, fontSize: 15),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              counter: Offstage(),
              icon: (image != null)
                  ? ImageIcon(
                      AssetImage(image!),
                      color: kMainColor,
                      size: 20.0,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
