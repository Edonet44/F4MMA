import 'package:f4mma/backend/api.dart';
import 'package:f4mma/model/cl_atleta.dart';
import 'package:flutter/material.dart';
import '../model/cl_api_player.dart';
import '../theme/theme.dart';
import '../widget/bottom_nav_bar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'atleta_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//   //lista di player
//   List<Player>? player;
//   List<Giocatore> giocatori = [];
//   var isLoaded = false;

//   @override
//   void initState() {
//     super.initState();
//     getdata();
//   }

// //recupero json e passo dati alla lista di tipo player
//   getdata() async {
//     try {
//       player = await Api().loadJson();
//       if (player != null) {
//         setState(() {
//           isLoaded = true;
//         });
//       }
//       //inserisco i valori nella lista giocatori
//       for (var atleta in player!) {
//         giocatori.add(atleta.giocatore1);
//         giocatori.add(atleta.giocatore2);
//         giocatori.add(atleta.giocatore3);
//         giocatori.add(atleta.giocatore4);
//         giocatori.add(atleta.giocatore5);
//         giocatori.add(atleta.giocatore6);
//         giocatori.add(atleta.giocatore7);
//         giocatori.add(atleta.giocatore8);
//         giocatori.add(atleta.giocatore9);
//         giocatori.add(atleta.giocatore10);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home'),
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: const BottomNavBar(index: 0),
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "F4MMA",
                      style: IntestazioneTitolo,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "CombatGames",
                    style: IntestazioneTitolo,
                  ),
                ],
              )
            ],
          ),
          _info_bar(context),
          const Divider(),
          const Carousel(),
          Row(
            //inserire oggetto
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Image.asset(
                  "assets/images/separatore.png",
                  width: 330,
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  opacity: 240,
                  image: AssetImage("assets/images/Ufc_logo.png"),
                  fit: BoxFit.cover),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 5, top: 10, bottom: 10, right: 0),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            fit: BoxFit.fill,
                            "assets/images/gallo/malley.png",
                            width: 150,
                            height: 200,
                          ))
                    ],
                  ),
                ),
                Container(
                    //color: Colors.amber,
                    child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image.asset(
                      //   "assets/images/Ufc_logo.png",
                      //   width: 80,
                      //   height: 80,
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      // const Padding(padding: EdgeInsets.only(left: 10)),
                      RichText(
                        text: TextSpan(
                          text: 'Benvenuto',
                          style: IntestazioneTitolo,
                          children: const <TextSpan>[
                            TextSpan(
                                text: '',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: '\n in F4mma!'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ]))
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  // child: Image.asset(
                  //   "assets/images/pngegg.png",
                  //   width: 330,
                  // ),
                )
              ],
            ),
          ),
          Column(
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Presso La Scuola Nazionale del Massaggio Tao\nho effettuato i seguenti corsi:",
                        style: DescrizioneProfiloHome),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    const Icon(Icons.add_circle),
                    Text("Diploma Nazionale Operatore Massaggio Sportivo",
                        style: DescrizioneProfiloHome),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    const Icon(Icons.add_circle),
                    Text("Attestato di Specializzazione Linfodrenaggio Vodder",
                        style: DescrizioneProfiloHome),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    const Icon(Icons.add_circle),
                    Text("Massaggio Classico Svedese",
                        style: DescrizioneProfiloHome),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    const Icon(Icons.add_circle),
                    Text("Massaggio Anticellulite",
                        style: DescrizioneProfiloHome),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    const Icon(Icons.add_circle),
                    Text("Massaggi Benessere", style: DescrizioneProfiloHome),
                  ],
                ),
              ),
            ],
          )
        ])));
  }

  _info_bar(context) {
    return Container(
      // color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //   color: Colors.amber,
            margin: const EdgeInsets.only(left: 20, right: 50, top: 10),
            child: Column(
              children: [
                /* Text(
                  "Oggi : " + DateFormat.yMMMMd().format(DateTime.now()),
                  style: IntestazioneSottotitolo,
                ), */
              ],
            ),
          ),
          Container(
            // color: Colors.blue,
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                //  const Log_out(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;

  final List<AtletiUFC> atletiUfc = [
    AtletiUFC(1, 'erter', 'rte', 'assets/images/gallo/cory.png', 24),
    AtletiUFC(2, 'gsd', 'dfgdf', 'assets/images/gallo/cruz.png', 25),
    AtletiUFC(3, 'daer', 'ere', 'assets/images/gallo/davil.png', 27),
    AtletiUFC(4, 'erte', 'er', 'assets/images/gallo/font.png', 27),
    AtletiUFC(
        5,
        'Malley',
        'O\'Malley si allena a Glendale presso la The MMA Lab diretto dal capo allenatore John Crouch Ha combattuto i suoi primi cinque combattimenti della sua carriera in Montana per poi spostarsi nel Nord Dakota per combattere poi per la Legacy Fighting Alliance dove riesce ad ottenere un\'incredibile vittoria per KO con uno spinning hook kick su David Nuzzo Dopo questa vittoria si guadagna un posto per il Dana White\'s Tuesday Night Contender Series sfidando Alfred Khashakyan O\'Malley con un\'altra sorprendente prestazione lo batte per KO al primo round Dopo questa vittoria ottiene un contratto con la UFC',
        'assets/images/gallo/malley.png',
        24),
    AtletiUFC(6, '', '', 'assets/images/gallo/muhnoz.png', 23),
    AtletiUFC(7, '', '', 'assets/images/gallo/sterling.png', 28),
    AtletiUFC(8, '', '', 'assets/images/gallo/umar.png', 26),
    AtletiUFC(9, '', '', 'assets/images/gallo/vera.png', 30),
    AtletiUFC(10, '', '', 'assets/images/gallo/yan.png', 31)
  ];

  List<Widget> generateImageTiles() {
    //la lista immagini crea una mappa che a sua volta ritorna un insieme di immagini dentro l oggetto ClipRRect
    return atletiUfc
        .map((element) => (ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: GestureDetector(
                onTap: () {
                  //passo l'immagine cliccata alla pagina atleta_screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const atleta_screen(),
                          settings: RouteSettings(arguments: element)));
                },
                child: Image.asset(
                  element.img,
                  fit: BoxFit.cover,
                  width: 300,
                  height: 300,
                ),
              ),
            )))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          CarouselSlider(
              items: generateImageTiles(),
              options: CarouselOptions(enlargeCenterPage: true))
        ],
      ),
    );
  }
}
