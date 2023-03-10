import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widget/icon_fontwidget.dart';

/**
 * template welcome Screen
 * icona centrale
 * testo
 * e login
 * 
 * Questa e la parte del main con il logo centrale e lo sfondo di colore verde.
 */

class Welcome1 extends StatelessWidget {
  const Welcome1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//MAIN INIZIALE reindirizzo sulla landing page
    //funzione che ritarda i secondi prima di richiamare la seconda pagina
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Welcome2()));
    });

    return Scaffold(
      body: Container(
          color: const Color(0xFF80C038),
          alignment: Alignment.center,
          child: const IconFont(
            iconName: "Benvenuto reinderizza tra due secondi",
            size: 20,
          )),
    );
  }
}

//Landing Page
class Welcome2 extends StatelessWidget {
  const Welcome2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned(
                top: 2,
                child: Image.asset(
                  'assets/images/1.png',
                  color: Colors.white.withOpacity(0.8),
                  colorBlendMode: BlendMode.modulate,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Container(
                          alignment: Alignment.center,
                          color: const Color(0xff80c038),
                          width: 180,
                          height: 180,
                          child: const IconFont(
                            iconName: "Logo nome",
                            color: Colors.white,
                            size: 130,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Benvenuto',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'orilla',
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Landing page con logo centrale',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'orilla',
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Iscriviti',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'orilla',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    //avvolgo il pulsante nella classe material che mi permette di avere l effetto sul pulsante
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Color(0xff80c038).withOpacity(0.2),
                            highlightColor: Color(0xff80c038).withOpacity(0.2),
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: const Color(0xFF80c038), width: 4),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10)),
                              child: const Text(
                                'Accedi',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'orilla',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
