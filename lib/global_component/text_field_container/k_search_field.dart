import 'package:flutter/material.dart';

import '../../../../utils/colors/app_colors.dart';

// ignore: must_be_immutable
class SearchTextField extends StatefulWidget {
  SearchTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.callbackFunction,
    this.onTap,
    required this.readOnly,
  }) : super(key: key);
  final String hintText;
  final bool readOnly;
  TextEditingController controller = TextEditingController();
  final Function(String value)? callbackFunction;
  final Function()? onTap;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please FillUp';
        }
        return null;
      },
      readOnly: widget.readOnly,
      controller: widget.controller,
      onChanged: (val) {
        if (widget.callbackFunction != null) widget.callbackFunction!(val);
      },
      onTap: widget.readOnly
          ? () {
              widget.onTap!();
            }
          : null,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(
            Icons.search,
            color: KColor.primary,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: KColor.greyText),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
        fillColor: KColor.textfieldgrey,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}

class CodeDigit extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  CodeDigit({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      margin: EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (newValue) {
          if (newValue.length <= 1) {
            onChanged(newValue);
          }
        },
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        controller: TextEditingController(text: value),
      ),
    );
  }
}
