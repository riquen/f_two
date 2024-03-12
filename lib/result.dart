import 'package:flutter/material.dart';

class RouteArguments {
  int totalRightAnswers;

  RouteArguments({this.totalRightAnswers = 0});
}

class Result extends StatelessWidget {
  static const routeName = '/result';

  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as RouteArguments;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Resultado',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Você acertou ${routeArguments.totalRightAnswers} de 10 perguntas',
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/quiz'),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: const Text(
                  'Jogar novamente',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
