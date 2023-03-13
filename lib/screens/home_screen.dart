import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../widget/bottom_nav_bar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';

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
                      "Massaggi",
                      style: IntestazioneTitolo,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pranoterapia a Livorno",
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
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Image.asset(
                  "assets/images/prenotazione_app/separatoreandlogo.png",
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
                  image: AssetImage(
                      "assets/images/prenotazione_app/logo-bckg.png"),
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
                            "assets/images/prenotazione_app/profilo/profilo.png",
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
                      Image.asset(
                        "assets/images/prenotazione_app/logo_tao.png",
                        width: 80,
                        height: 80,
                      ),
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
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      Text(
                        "Sono Luca Paone da sempre\nattivo nello sport.\nHo iniziato da giovane a praticare\natletica leggera\nper poi dedicarmi al rugby\nprima da giocatore e poi da allenatore.",
                        style: DescrizioneProfiloHome,
                      )
                    ],
                  )
                ]))
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: Image.asset(
                    "assets/images/prenotazione_app/separatoreandlogo.png",
                    width: 330,
                  ),
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
  final List<String> images = [
    'assets/images/prenotazione_app/slider/1.png',
    'assets/images/prenotazione_app/slider/2.png',
    'assets/images/prenotazione_app/slider/3.png',
    'assets/images/prenotazione_app/slider/4.png',
    'assets/images/prenotazione_app/slider/5.png'
  ];

  List<Widget> generateImageTiles() {
    //la lista immagini crea una mappa che a sua volta ritorna un insieme di immagini dentro l oggetto ClipRRect
    return images
        .map((element) => (ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                element,
                fit: BoxFit.cover,
                width: 300,
                height: 200,
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
