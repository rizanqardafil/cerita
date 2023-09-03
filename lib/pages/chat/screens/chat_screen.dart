import 'package:shamo/pages/chat/screens/new_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:shamo/pages/beranda/app/constants/app.colors.dart';
import '../providers/user_data_provider.dart';
import '../screens/message_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var searchFieldTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;
    final filteredChats = Provider.of<UserDataProvider>(context).chats.where(
      (chat) {
        if (searchFieldTextEditingController.text.isEmpty) {
          return true;
        } else if (chat.receiver.name
            .toLowerCase()
            .contains(searchFieldTextEditingController.text.toLowerCase())) {
          return true;
        } else {
          return false;
        }
      },
    ).toList()
      ..sort(
        (chatA, chatB) =>
            chatB.lastMessageTimeStamp.compareTo(chatA.lastMessageTimeStamp),
      );
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
            child: Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                  filled: true,
                ),
              ),
              child: TextField(
                controller: searchFieldTextEditingController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  ),
                  hintStyle: TextStyle(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredChats.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        const Text(
                          'Oops! No chats were found.',
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory),
                            onPressed: () => Navigator.of(context)
                                .pushNamed(NewChatScreen.routeName),
                            child: const Text('Start a new chat!'))
                      ])
                : ListView.builder(
                    itemCount: filteredChats.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: ClipOval(
                            child: filteredChats[index]
                                        .receiver
                                        .profilePictureURL !=
                                    null
                                ? FadeInImage(
                                    fadeInDuration:
                                        const Duration(milliseconds: 300),
                                    placeholder: const AssetImage(
                                        'assets/images/default_profile.png'),
                                    image: NetworkImage(filteredChats[index]
                                        .receiver
                                        .profilePictureURL!),
                                    imageErrorBuilder: (context, error,
                                            stackTrace) =>
                                        Image.asset(
                                            'assets/images/default_profile.png'),
                                  )
                                : Image.asset(
                                    'assets/images/default_profile.png'),
                          ),
                          title: Text(
                            filteredChats[index].receiver.name,
                            style: TextStyle(
                              color: themeFlag
                                  ? AppColors.creamColor
                                  : AppColors.mirage,
                            ),
                          ),
                          subtitle: Text(
                            filteredChats[index].lastMessageText,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: themeFlag
                                  ? AppColors.creamColor.withOpacity(0.5)
                                  : AppColors.mirage.withOpacity(0.5),
                            ),
                          ),
                          trailing: Text(
                            DateFormat.jm().format(
                                filteredChats[index].lastMessageTimeStamp),
                            style: TextStyle(
                              color: themeFlag
                                  ? AppColors.creamColor.withOpacity(0.5)
                                  : AppColors.mirage.withOpacity(0.5),
                            ),
                          ),
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            await Navigator.of(context).pushNamed(
                              MessageScreen.routeName,
                              arguments: filteredChats[index].receiver,
                            );
                            setState(() {
                              searchFieldTextEditingController.clear();
                            });
                          });
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
