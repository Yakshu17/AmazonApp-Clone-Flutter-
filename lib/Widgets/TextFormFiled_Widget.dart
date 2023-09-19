import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  const TextFormFieldWidget({Key? key, required this.title,required this.controller, required this.obscureText}) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
        TextFormField( decoration: const InputDecoration(fillColor: Colors.white,
            focusColor: Colors.white,border: OutlineInputBorder()),)
      ],
    );
  }
}
