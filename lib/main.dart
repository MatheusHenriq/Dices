import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(Dices());
}

class Dices extends StatefulWidget {
  @override
  _DicesState createState() => _DicesState();
}

class _DicesState extends State<Dices> {
   int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void buttonClick(){
    Random rnd = Random();

    setState(() {
          leftDiceNumber = rnd.nextInt(6) + 1;
          rightDiceNumber = rnd.nextInt(6) + 1;
        });
  }

  void leftDicesTapped(){
    Random rnd = Random();
    setState(() {
          leftDiceNumber = rnd.nextInt(6) + 1;
    });

    print('dado esquerdo rolou: ' + leftDiceNumber.toString());
  }

  void rightDicesTapped(){
    Random rnd = Random();
    setState(() {
          rightDiceNumber =  rnd.nextInt(6) + 1;
    });

    print("dado direito rolou: $rightDiceNumber");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home :Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: buttonClick,
              backgroundColor: Colors.red[300],
              child: Icon(
              Icons.loop_rounded,
              color: Colors.black
              ),
            ),
            appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('Rolando Dados'),
          ),
          backgroundColor: Colors.red,
          body : SafeArea(
            child: Container(
              height: double.infinity, //faz com que o height pegue todo o tamanho da tela
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex:1,
                    child:GestureDetector(
                      onTap: leftDicesTapped,
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Image(
                          image: AssetImage('assets/images/dice$leftDiceNumber.png'),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child:GestureDetector(
                      onTap: rightDicesTapped,
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Image(
                          image: AssetImage('assets/images/dice$rightDiceNumber.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
         ),
      )
    );
  }
}


