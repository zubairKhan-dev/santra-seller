import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTitle extends StatelessWidget {
  AppTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/santra_icon.svg',
            semanticsLabel: 'Acme Logo',
            alignment: Alignment.bottomCenter,
            height: 50,
            width: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'santra',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
              ),
              Text(
                'seller',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFF265198)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
