import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        width: 330,
        height: 200,
        margin: EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Image.asset(
              'assets/images/banner.jpg',
              width: 330,
              height: 150,
              fit: BoxFit.cover,
            ),
            
          ],
        ),
      ),
    );
  }
}
