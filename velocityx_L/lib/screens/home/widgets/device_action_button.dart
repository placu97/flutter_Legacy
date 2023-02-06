import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DeviceActionButton extends StatelessWidget {
  final String image;
  final String text;
  final Function onTap;

  const DeviceActionButton({Key key,@required this.image,@required this.text,@required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 3,
              )
            ],
            borderRadius: BorderRadius.circular(20)
        ),
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            //Image.network(image),
            Image(image: NetworkImage(image), width: 40, fit: BoxFit.cover,),
            //Icon(Icons.ac_unit),
            Padding(
              padding: const EdgeInsets.all(4),
              child: text.text.make()
              //CustomText(text: text, size: 18,),
            )
          ],
        ),
      ),
    );
  }
}