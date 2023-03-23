import 'dart:math';

import 'package:f4mma/model/cl_api_player.dart';
import 'package:f4mma/model/cl_incontri.dart';
import 'package:flutter/material.dart';
import '../backend/api.dart';
import '../widget/bottom_nav_bar.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  static const routeName = '/discover';

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  //lista di player
  List<Player>? player;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.repeat();
    getdata();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

//recupero json e passo alla lista di tipo player
  getdata() async {
    player = await Api().loadJson();
    if (player != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }
//

  //funzione che richiama la creazione dei match
  Tomatch() {
    try {
      //creo una lista di giocatori tramite un for che itera tutti i giocatori passati dal json
      //aggiungo alla lista tutti i dati di ogni singolo giocatore
      List<Giocatore> giocatori = [];
      for (var atleta in player!) {
        giocatori.add(atleta.giocatore1);
        giocatori.add(atleta.giocatore2);
        giocatori.add(atleta.giocatore3);
        giocatori.add(atleta.giocatore4);
        giocatori.add(atleta.giocatore5);
        giocatori.add(atleta.giocatore6);
        giocatori.add(atleta.giocatore7);
        giocatori.add(atleta.giocatore8);
        giocatori.add(atleta.giocatore9);
        giocatori.add(atleta.giocatore10);
      }

      //istanza e richiamo funzione creamatch in classe cl_incontri con passaggio di variabile di tipo lista giocatore
      Incontri().Creamatches(giocatori);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Profilo'),
        ),
        bottomNavigationBar: const BottomNavBar(index: 1),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              //inserire oggetto di profilo
              children: <Widget>[
                animation_ufcoctagon(rotationAnimation: _rotationAnimation),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: ElevatedButton(
                      onPressed: () {
                        Tomatch();
                      },
                      child: Text("Combatti")),
                )
              ],
            )
          ],
        )));
  }
}

class animation_ufcoctagon extends StatelessWidget {
  const animation_ufcoctagon({
    super.key,
    required Animation<double> rotationAnimation,
  }) : _rotationAnimation = rotationAnimation;

  final Animation<double> _rotationAnimation;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          /*   boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ], */
          ),
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
        child: AnimatedBuilder(
          animation: _rotationAnimation,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.rotationY(_rotationAnimation.value * 2.0 * pi),
              alignment: Alignment.center,
              child: Image.asset('assets/images/octagon.png', width: 200),
            );
          },
        ),
      ),
    );
  }
}
