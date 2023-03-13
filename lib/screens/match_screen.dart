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
  List<Player>? player;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    player = await Incontri().loadJson();
    if (player != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  Tomatch() {
    try {
      //Prima di poter effettuare il casting in un altro tipo di classe bisogna passare dalla classe Stringa
      //successivamente si puo passare all oggetto desiderato in questo Giocatore

      List<Giocatore> giocatori = [];
      for (var atleta in player!) {
        giocatori.add(atleta.giocatore1);
        giocatori.add(atleta.giocatore2);
        giocatori.add(atleta.giocatore3);
        giocatori.add(atleta.giocatore4);
        giocatori.add(atleta.giocatore5);
      }

      // List firstgoString = player!.map((player) =>
      // player.giocatore1.nome).toList();
      // List<Giocatore> giocatori = firstgoString.map((name) => Giocatore(, 0)).toList();
      //  List<Giocatore>? playerNames =
      //     player!.map((player) => player).cast<Giocatore>().toList();
      // Incontri().Creamatches(playerNames);
      Incontri().Creamatches(giocatori);
      //Incontri().Creamatches(player!.cast<Giocatore>());
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
