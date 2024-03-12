import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/logo.png'),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/quiz'),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: const Text(
                  'Jogar',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
