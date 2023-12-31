import 'dart:async';

import 'package:shamo/pages/chat/providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../screens/live_chat_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/more_screen.dart';
import '../screens/new_chat_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/chat';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _currentIndex = 1;
  late StreamSubscription _messageStreamSubscription;
  late StreamSubscription _statusStreamSubscription;

  @override
  void initState() {
    startSubscription();
    super.initState();
  }

  @override
  void dispose() {
    _messageStreamSubscription.cancel();
    _statusStreamSubscription.cancel();
    super.dispose();
  }

  Future<void> startSubscription() async {
    final userDataProvider =
        Provider.of<UserDataProvider>(context, listen: false);
    await userDataProvider.setUserStatus();
    _messageStreamSubscription =
        await userDataProvider.listenAndReadMessasgesFromFirestore();
    _statusStreamSubscription =
        await userDataProvider.listenAndReadUserStatusFromDatabase();
  }

  PreferredSizeWidget _scaffoldAppBar() {
    var title = 'Chats';
    var actions = <Widget>[];
    if (_currentIndex == 0) {
      title = 'Live Chat';
    } else if (_currentIndex == 1) {
      title = 'Chats';
      actions = [
        IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, NewChatScreen.routeName),
            icon: const Icon(Icons.add))
      ];
    } else if (_currentIndex == 2) {
      title = 'More';
      actions = [
        IconButton(
          onPressed: () {
            var userDataProvider =
                Provider.of<UserDataProvider>(context, listen: false);
            userDataProvider.setUserStatus(true);
            userDataProvider.clearAllLists();
            FirebaseAuth.instance.signOut();
          },
          icon: const Icon(Icons.logout_outlined),
        )
      ];
    }
    return AppBar(
      toolbarHeight: kToolbarHeight * 1.25,
      title: Text(
        title,
        textScaleFactor: 1.25,
      ),
      actions: actions,
    );
  }

  Widget _scaffoldBody() {
    switch (_currentIndex) {
      case 0:
        return const LiveChatScreen();
      case 1:
        return const ChatScreen();
      case 2:
        return const MoreScreen();
      default:
        return const ChatScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('Main Screen Executed');
    return Scaffold(
      appBar: _scaffoldAppBar(),
      body: _scaffoldBody(),
    );
  }
}
