import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  //For indicator image slider
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List images = [
      'assets/images/image_shoes.png',
      'assets/images/image_shoes.png',
      'assets/images/image_shoes.png',
    ];

    List familiarShoes = [
      'assets/images/image_shoes.png',
      'assets/images/image_shoes.png',
      'assets/images/image_shoes.png',
      'assets/images/image_shoes.png',
      'assets/images/image_shoes.png',
      'assets/images/image_shoes.png',
      'assets/images/image_shoes.png',
      'assets/images/image_shoes.png',
      'assets/images/image_shoes.png',
      'assets/images/image_shoes.png',
      'assets/images/image_shoes.png',
      'assets/images/image_shoes.png',
    ];

    Widget indicator(int index) {
      var isSelected = currentIndex == index;
      return Container(
        height: 4,
        width: isSelected ? 16 : 4,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : const Color(0xffC4C4C4),
          borderRadius: BorderRadius.circular(12),
        ),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          // AppBar
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkResponse(
                  child: const Icon(
                    Icons.chevron_left,
                  ),
                  onTap: () {},
                ),
                InkResponse(
                  child: Icon(
                    Icons.shopping_bag,
                    color: backgroundColor1,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),

          // Image Slider
          CarouselSlider(
            items: images
                .map(
                  (image) => Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((e) {
                index++;
                return indicator(index);
              }).toList()),
        ],
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        margin: const EdgeInsets.only(right: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(imageUrl),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 17),
        padding: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          color: backgroundColor1,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            // HEADER
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TERREX URBAN LOW',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'Hiking',
                        style: subtitleTextStyle,
                      )
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/button_wishlist.png',
                  width: 46,
                ),
              ],
            ),

            // PRICE
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$143,98',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),

            // DESCRIPTION
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Unpaved trails and mixed surfaces are easy when you have the raction and support you need. Casual enough for the daily commute.',
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            // FAMILIAR SHOES
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Familiar Shoes',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    height: 54,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      children: familiarShoes
                          .map((imageUrl) => familiarShoesCard(imageUrl))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),

            // BUTTON
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/button_chat.png',
                      width: 54,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: primaryColor,
                        ),
                        child: Text(
                          'Add to Cart',
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
