import 'package:f4mma/model/cl_api_player.dart';
import 'package:f4mma/model/cl_incontri.dart';
import 'package:flutter/material.dart';
import '../widget/bottom_nav_bar.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  static const routeName = '/discover';

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  //lista di player
  List<Player>? player;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getdata();
  }

//recupero json e passo alla lista di tipo player
  getdata() async {
    player = await Incontri().loadJson();
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
                ElevatedButton(
                    onPressed: () {
                      Tomatch();
                    },
                    child: Text("Combatti")),
              ],
            )
          ],
        )));
  }
}
