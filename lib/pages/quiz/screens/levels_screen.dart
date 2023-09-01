import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/chat/providers/auth_provider.dart';
import 'package:shamo/pages/quiz/providers/questions.dart';
import 'package:shamo/pages/quiz/widgets/level_card.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final questionsProvider = Provider.of<QuestionsProvider>(context);

    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const SizedBox(width: 10),
                const Text(
                  'levels',
                  style: TextStyle(fontSize: 23),
                ),
                const SizedBox.shrink(),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return LevelCard(
                level: index + 1,
                stars: questionsProvider.ratings[index],
                isOpen: index <= auth.offlineLevel,
                // isOpen: true,
                onPressed: () {
                  questionsProvider.chooseLevel(index);
                  Navigator.of(context).pushNamed('/offline-game');
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
