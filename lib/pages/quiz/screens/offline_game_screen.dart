import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shamo/pages/quiz/providers/questions.dart';
import 'package:shamo/pages/quiz/widgets/answer_card.dart';
import 'package:shamo/pages/quiz/widgets/custom_button.dart';

import '../widgets/custom_timer.dart';

class OfflineGameScreen extends StatelessWidget {
  const OfflineGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionsProvider = Provider.of<QuestionsProvider>(context);

    if (questionsProvider.isFinish || questionsProvider.seconds == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed('/finish-Level');
      });
    }
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1F1147), Color(0xff362679)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SvgPicture.asset(
                'assets/images/circles.svg',
                fit: BoxFit.fitHeight,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'level ${(questionsProvider.currentLevel ?? 0) + 1}',
                      style: const TextStyle(
                        color: Color(0xff37EBBC),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const CustomTimer(leftSeconds: 20),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    child: Text(
                      'Question ${questionsProvider.currentQuestionIndex + 1}/5',
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: ListView(
                        children: [
                          Text(
                            questionsProvider.currentQuestion.question,
                            style: const TextStyle(color: Colors.black),
                            textAlign: TextAlign.start,
                          ),
                          if (questionsProvider.currentQuestion.image != null)
                            Image.asset(
                                'assets/t-images/${questionsProvider.currentQuestion.image}'),
                          for (int i = 0;
                              i < questionsProvider.currentAnswers.length;
                              i++)
                            AnswerCard(
                              answer: questionsProvider.currentAnswers[i],
                              answerCardStatus:
                                  questionsProvider.answersStatus[i],
                              onTap: questionsProvider.isChoseAnswer
                                  ? null
                                  : () {
                                      questionsProvider.chooseAnswer(i);
                                    },
                            ),
                          if (questionsProvider.isChoseAnswer) ...[
                            const SizedBox(height: 20),
                            CustomButton(
                              padding: 0,
                              onPressed: questionsProvider.nextQuestion,
                              text: 'Next Question',
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
