import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        right: defaultMargin,
        left: defaultMargin,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/image_shoes.png',
              width: 60,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terrex Urban Low',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '\$143,98',
                  style: priceTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/button_love.png',
              width: 34,
            ),
          )
        ],
      ),
    );
  }
}
