import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: ''),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  String situacao = 'Há vaga, entre';

  void _incrementCounter(int operacao) {
    setState(() {
      if (_counter < 10) {
        situacao = 'Há vaga, entre';
      }
      switch (operacao) {
        case 1:
          if (_counter >= 10) {
            situacao = 'Aguarde, não há vagas';
            _counter--;
          }
          _counter++;
          break;

        case 2:
          if (_counter <= 0) {
            situacao = 'Operação inválida';
            _counter++;
          }
          _counter--;

          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: [
                  Text(
                    'Pessoas:',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '$_counter',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                    ),
                  ),Center(
                    child: SizedBox(
                      height: 24.0,
                      width: double.maxFinite,
                      child: Divider(
                        thickness: 1.4,
                        color: Colors.white60,
                        indent: 100,
                        endIndent: 100,
                      ),
                    ),
                  ),
                  Text(
                    '$situacao',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child:  Row(
                    children: [
                      IconButton(
                        onPressed: () => _incrementCounter(1),
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: Colors.greenAccent,
                        ),
                        iconSize: 40,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      IconButton(
                        onPressed: () => _incrementCounter(2),
                        icon: Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                        ),
                        iconSize: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
