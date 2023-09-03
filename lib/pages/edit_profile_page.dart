import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Text('Edit Profile'),
            IconButton(
              icon: Icon(
                Icons.check,
                color: primaryColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Name',
            style: subtitleTextStyle.copyWith(fontSize: 13),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Your name',
              hintStyle: subtitleTextStyle,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: subtitleColor,
                ),
              ),
            ),
            initialValue: 'Alex Keinnzalz',
            style: primaryTextStyle,
          )
        ],
      );
    }

    Widget usernameInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            'Username',
            style: subtitleTextStyle.copyWith(fontSize: 13),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Your username',
              hintStyle: subtitleTextStyle,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: subtitleColor,
                ),
              ),
            ),
            initialValue: '@alexkeinn',
            style: primaryTextStyle,
          )
        ],
      );
    }

    Widget emailInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            'Email Address',
            style: subtitleTextStyle.copyWith(fontSize: 13),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Your email address',
              hintStyle: subtitleTextStyle,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: subtitleColor,
                ),
              ),
            ),
            initialValue: 'alex.kein@gmail.com',
            style: primaryTextStyle,
          )
        ],
      );
    }

    Widget content() {
      return ListView(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/image_shoes.png',
                      width: 100,
                    ),
                  ),
                ),
                nameInput(),
                usernameInput(),
                emailInput(),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      // resizeToAvoidBottomInset: false,
      appBar: header(),
      body: content(),
    );
  }
}
