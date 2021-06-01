import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ButtonSocialNetwork extends StatelessWidget {
  const ButtonSocialNetwork({Key key, this.urlImage, this.text, this.color})
      : super(key: key);

  final String urlImage;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 100,
      borderRadius: BorderRadius.circular(17),
      highlightColor: Colors.grey.withOpacity(0.9),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "$text",
            ),
            backgroundColor: color != null ? color : Colors.blue,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))));
      },
      child: Container(
        height: 6.h,
        width: 80.w,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image.asset(
            "$urlImage",
            height: 7.h,
            width: 7.w,
          ),
          Text(
            '$text',
            style: TextStyle(color: Colors.white, fontSize: 2.6.h),
          ),
          SizedBox(width: 5.w),
        ]),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
        ),
      ),
    );
  }
}
