import 'package:animator/animator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import from provider package

import 'package:shamo/pages/chat/providers/auth_provider.dart';
import 'custom_stack.dart';

class HomeQuiz extends StatelessWidget {
  const HomeQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(
        context); // Use Provider.of to access AuthProvider

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: 900,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xff6948FE),
                Color(0xff1F1147),
              ])),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffB7ADE4),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 21,
                            backgroundColor: const Color(0xff37EBBC),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundImage: NetworkImage(
                                auth.user.profilePicture,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Image.asset(
                            'assets/images/gem.png',
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Choose your game mode',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontSize: 25, letterSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 30,
                child: Animator<double>(
                  duration: const Duration(milliseconds: 500),
                  cycles: 0,
                  curve: Curves.easeInOut,
                  tween: Tween<double>(begin: 15.0, end: 20.0),
                  builder: (context, animatorState, child) => Icon(
                    Icons.keyboard_arrow_down,
                    size: animatorState.value * 3.5,
                    color: Colors.white,
                  ),
                ),
              ),
              CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    height: 500,
                    enlargeCenterPage: true,
                    padEnds: true,
                    viewportFraction: .7,
                  ),
                  items: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/levels');
                        },
                        child: const CustomStack(
                          image: 'assets/images/Component_5.png',
                          icon: 'assets/images/cloud 1.png',
                          text1: 'Solo mode',
                          text2: 'offline',
                          padding_left: 5,
                          padding_top: 45,
                          padding: 0,
                          color: Color(0xff2D2D2D),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/offline_multiplayer');
                      },
                      child: const CustomStack(
                        image: 'assets/images/Component_6.png',
                        icon: 'assets/images/group 1.png',
                        text1: 'Play 1V1',
                        text2: 'Offline mode',
                        padding_left: 8,
                        padding_top: 70,
                        padding: 25,
                        color: Color(0xff444444),
                      ),
                    ),
                  ]),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
