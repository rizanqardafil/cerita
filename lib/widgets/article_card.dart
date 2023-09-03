import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/articles');
      },
      child: Container(
        width: 160,
        height: 223,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor8
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Image.asset(
              'assets/images/image-home4-1.png',
              width: 160,
              height: 145,
              fit: BoxFit.cover,
              
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'Artikel',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                        color: backgroundColor3
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
