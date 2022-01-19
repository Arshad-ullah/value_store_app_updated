import 'package:flutter/material.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';
import 'package:value_stories_app/ui/custom_widgets/custom-widget.dart';

class ProgressWidget extends StatefulWidget {
  final value;
  final labelStarts;
  final labelEnds;
  ProgressWidget({this.value, this.labelEnds, this.labelStarts});

  @override
  _ProgressWidgetState createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.labelStarts,
                  style: headingTextStyle.copyWith(
                      fontSize: 12.sp, color: Colors.black54),
                ),
                Text(
                  widget.labelEnds,
                  style: headingTextStyle.copyWith(
                      fontSize: 12.sp, color: Colors.black54),
                ),
              ],
            ),
          ),
          //main progress indicator
          mainProgress(context),

          //progressValue
          progressValue(1.sw * widget.value),

          //head of progress value
          indicator(1.sw * widget.value),
        ],
      ),
    );
  }

  indicator(double width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 40.0,
        width: width,
        child: Row(
          children: [
            Expanded(
              child: SizedBox(),
            ),
            Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 6,
                        spreadRadius: 2,
                        offset: Offset(1, 2),
                        color: Colors.grey.withOpacity(0.8))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fiber_manual_record,
                    color: mainThemeColor,
                    size: 14,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  mainProgress(context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 4.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0XFF707070).withOpacity(0.14),
          border: Border.all(width: .5, color: mainThemeColor.withAlpha(7)),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.grey.withOpacity(0.6),
          //       blurRadius: 1,
          //       spreadRadius: 1,
          //       offset: Offset(1, -1))
          // ],
        ),
      ),
    );
  }

  progressValue(double width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 4.h,
        width: width,
        decoration: BoxDecoration(
          color: mainThemeColor,
          border: Border.all(width: .5, color: mainThemeColor.withAlpha(7)),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          // boxShadow: [
          //   BoxShadow(
          //       color: mainThemeColor.withOpacity(0.6),
          //       blurRadius: 1,
          //       spreadRadius: 1,
          //       offset: Offset(1, -1))
          // ],
        ),
      ),
    );
  }
}
