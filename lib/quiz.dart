import 'package:f_two/result.dart';
import 'package:flutter/material.dart';
import 'quiz_data.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int questionNumber = 1;
  int hits = 0;
  int mistakes = 0;

  @override
  Widget build(BuildContext context) {
    quiz.shuffle();
    for (var element in quiz) {
      List answers = element['answers'];
      int rightAnswer = element['rightAnswer'];
      String rightResponse = answers[rightAnswer - 1];
      int rightResponseIndex = 1;

      answers.shuffle();
      for (var element in answers) {
        if (element == rightResponse) {
          rightAnswer = rightResponseIndex;
        }
        rightResponseIndex++;
      }
      element['rightAnswer'] = rightAnswer;
    }

    void answered(int answerNumber) {
      setState(() {
        if (quiz[questionNumber - 1]['rightAnswer'] == answerNumber) {
          hits++;
        } else {
          mistakes++;
        }
        if (questionNumber != 10) {
          questionNumber++;
        } else {
          Navigator.pushNamed(context, Result.routeName,
              arguments: RouteArguments(totalRightAnswers: hits));
        }
      });
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Pergunta $questionNumber de 10',
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 64, bottom: 128),
                        child: Text(
                          '${quiz[questionNumber - 1]['question']}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => answered(1),
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          child: Text(
                            '${quiz[questionNumber - 1]['answers'][0]}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => answered(2),
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          child: Text(
                            '${quiz[questionNumber - 1]['answers'][1]}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => answered(3),
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          child: Text(
                            '${quiz[questionNumber - 1]['answers'][2]}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => answered(4),
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          child: Text(
                            '${quiz[questionNumber - 1]['answers'][3]}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
