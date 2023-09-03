import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: backgroundColor3,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
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
                      style: primaryTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    Text(
                      '\$143,98',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/button_add.png',
                    width: 16,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '2',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Image.asset(
                    'assets/images/button_reduce.png',
                    width: 16,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/icon_remove.png',
                width: 10,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'Remove',
                style: redTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
