import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../widget/choicebutton.dart';
import 'match_screen.dart';

// ignore: camel_case_types
class atleta_screen extends StatefulWidget {
  const atleta_screen({super.key});

  @override
  State<atleta_screen> createState() => _atleta_screenState();
}

class _atleta_screenState extends State<atleta_screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //stringa che recupera tutto l'atleta
    final String atleta = ModalRoute.of(context)!.settings.arguments.toString();

    List<String> items = [];
    atleta.split(',').forEach((item) => items.add(item.trim()));
    // String immagine = items[3].trim();
    RegExp regExp = RegExp(
        r'Immagine:\s*'); // regex che cerca la stringa "immagine" seguita da uno o più spazi

    for (int i = 0; i < items.length; i++) {
      items[i] = items[i].replaceAll(
          regExp, ''); // rimuove la stringa "immagine" e gli spazi seguenti
    }

    return Scaffold(
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
        //utilizzo questa opzione per far vedere l immagine sotto l'app bar
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            SizedBox(
                //impostiamo l'altezza a che sia pari alla meta della altezza dello schermo
                height: MediaQuery.of(context).size.height / 2,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                image: AssetImage(items[4]),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ChoiceButton(
                                width: 40,
                                height: 40,
                                color: Theme.of(context).hintColor,
                                icon: Icons.clear_rounded,
                                size: 30,
                                hasgradient: false),
                            ChoiceButton(
                                width: 80,
                                height: 80,
                                color: Theme.of(context).hintColor,
                                icon: Icons.rocket,
                                size: 30,
                                hasgradient: true),
                            ChoiceButton(
                                width: 40,
                                height: 40,
                                color: Theme.of(context).hintColor,
                                icon: Icons.watch_later,
                                size: 30,
                                hasgradient: false),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${items[1]},${items[2]}', style: IntestazioneTitolo),
                  Text('Ufc n°...', style: DescrizioneProfilo),
                  SizedBox(height: 15),
                  Text('.:: About ::.',
                      style: Theme.of(context).textTheme.displaySmall),
                  Text(items[3], style: DescrizioneProfiloHome),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          //funzione che richiama il bloc...

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MatchScreen(),
                                  settings: RouteSettings(
                                      arguments: items[4] + ',' + items[1])));
                        },
                        child: Text("Inizia")),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
