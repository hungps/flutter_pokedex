import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';

class Modal extends StatelessWidget {
  final String title;
  final Widget child;

  const Modal({Key key, this.title, this.child}) : super(key: key);

  Widget _buildDragLine(double width) {
    return Container(
      width: width,
      height: 3,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColors.lighterGrey,
      ),
    );
  }

  Widget _buildTitle() {
    if (title == null) {
      return SizedBox();
    }

    return Padding(
      padding: EdgeInsets.only(top: 18, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final dragLineWidth = MediaQuery.of(context).size.width * 0.2;

    return Container(
      padding: EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        color: AppColors.whiteGrey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildDragLine(dragLineWidth),
          _buildTitle(),
          child,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
