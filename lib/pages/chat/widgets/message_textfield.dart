import 'package:flutter/material.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:shamo/pages/beranda/app/constants/app.colors.dart';
import 'package:provider/provider.dart';

import '../models/message.dart';

class MessageTextfield extends StatefulWidget {
  final Function sendMessage;
  final String recieverId;
  final String senderId;

  const MessageTextfield({
    required this.senderId,
    required this.recieverId,
    required this.sendMessage,
    Key? key,
  }) : super(key: key);

  @override
  State<MessageTextfield> createState() => _MessageTextfieldState();
}

class _MessageTextfieldState extends State<MessageTextfield> {
  final _messageTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;

    return Container(
      decoration: BoxDecoration(
        color: themeFlag ? AppColors.mirage : AppColors.creamColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: _messageTextEditingController,
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: 'Send a message',
                  hintStyle: TextStyle(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            onPressed: _messageTextEditingController.text.trim().isEmpty
                ? null
                : () {
                    widget.sendMessage(
                      context,
                      Message(
                        id: "NO_ID",
                        text: _messageTextEditingController.text.trim(),
                        timeStamp: DateTime.now(),
                        senderId: widget.senderId,
                        receiverId: widget.recieverId,
                      ),
                    );
                    _messageTextEditingController.clear();
                  },
            icon: const Icon(Icons.send_rounded),
          ),
        ],
      ),
    );
  }
}
