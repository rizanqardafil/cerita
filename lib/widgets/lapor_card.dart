import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class LaporCard extends StatelessWidget {
  const LaporCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/chat');
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
              'assets/images/image-home5.png',
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
                      'Telekonseling',
                      style: blackTextStyle.copyWith(
                        fontSize: 17,
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
