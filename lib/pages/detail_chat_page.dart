import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_bubble.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'assets/images/image_shop_logo.png',
              width: 50,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TESAGA',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  'Online',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: light,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget productPreview() {
      return Container();
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(
          20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: backgroundColor4,
                    ),
                    child: Center(
                      child: TextFormField(
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type something...',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/images/button_send.png',
                  width: 45,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: const [
          ChatBubble(
            isSender: true,
            text:
                'Saya izin bertanya pak. Apakah nanti judul di papar harus sama dengan judul laporan penelitian yg sudah kita buat? Contohnya punya saya judul penelitiannya “Desan Komunikasi dan Keamanan Data Araitekstur Aplikasi Multimasjid”. Apakah nanti di paper judulnya juga seperti itu atau bisa kita ubah pak? Terima kasih',
          ),
          ChatBubble(
            isSender: false,
            text: 'tidak',
          ),
          ChatBubble(
            isSender: true,
            text: "Permisi pak apa memungkinkan untuk zoom juga pak 🙏",
          ),
          ChatBubble(
            isSender: false,
            text: "Boleh, saya buka zoomnya ya",
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: header(),
      ),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
