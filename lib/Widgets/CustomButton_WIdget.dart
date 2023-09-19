import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onpressed;
  final Color color;
  final bool isloading;
  const CustomButtonWidget({Key? key,required this.child,required this.onpressed,required this .color, required this.isloading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color,),
        onPressed: onpressed, child:isloading? child:const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: AspectRatio(
            aspectRatio: 1/1,
              child: CircularProgressIndicator(color: Colors.white,)),
        ));
  }
}
