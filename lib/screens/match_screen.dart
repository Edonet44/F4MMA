import 'dart:math';
import 'package:f4mma/model/cl_api_player.dart';
import 'package:f4mma/model/cl_incontri.dart';
import 'package:f4mma/utils/app_large_text.dart';
import 'package:f4mma/utils/app_text.dart';
import 'package:flutter/material.dart';
import '../backend/api.dart';
import '../theme/theme.dart';
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

    //utilizzo nel file crud api da utilizzare successivamente
    //player = await FirebaseStorageCRUD().loadJson_storage();

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
            AppLargeText(
              text: 'Allenamento',
              color: Colors.black38,
            ),
            AppText(text: 'Scegli palestra', color: Colors.black87),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    width: 150,
                    child: Column(
                      children: [
                        animation_ufcoctagon(
                            rotationAnimation: _rotationAnimation),
                        ElevatedButton(
                            onPressed: () {
                              Tomatch();
                            },
                            child: Text("Combatti"))
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    child: Column(
                      children: [
                        animation_allenamento(
                            rotationAnimation: _rotationAnimation),
                        ElevatedButton(
                            onPressed: () {}, child: Text("Allenati"))
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(),
                  AppLargeText(
                    text: 'Carriera',
                    color: Colors.black38,
                  ),
                  AppText(
                      text: 'Scegli il luogo sulla mappa',
                      color: Colors.black87),
                  CclikMap(),
                  MyExpansionPanelList(
                    items: ['Luoghi disponibili'],
                  )
                ],
              ),
            )
          ],
        )));
  }
}

//classe mappa
class CclikMap extends StatelessWidget {
  const CclikMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: 400,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/usa_map.png'))),
        GestureDetector(
          //onTap: () => print('Alabama'),
          onTap: () => _navigateToStateScreen(context, 'Alabama'),
          child: Container(
            color: Color.fromARGB(255, 160, 8, 8),
            margin: EdgeInsets.only(left: 230, top: 140),
            width: 20,
            height: 20,
          ),
        ),
        GestureDetector(
          onTap: () => print('Alaska'),
          child: Container(
            color: Colors.transparent,
            margin: EdgeInsets.only(left: 20, top: 70),
            width: 100,
            height: 100,
          ),
        ),
      ],
    );
  }

  void _navigateToStateScreen(BuildContext context, String stateName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StateScreen(stateName)),
    );
  }
}

class StateScreen extends StatelessWidget {
  final String stateName;

  StateScreen(this.stateName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(stateName)),
      body: Center(
        child: Text('Informazioni su $stateName'),
      ),
    );
  }
}

class MyExpansionPanelList extends StatefulWidget {
  final List<String> items;

  MyExpansionPanelList({required this.items});

  @override
  _MyExpansionPanelListState createState() => _MyExpansionPanelListState();
}

class _MyExpansionPanelListState extends State<MyExpansionPanelList> {
  List<bool> _isExpandedList = [];

  @override
  void initState() {
    super.initState();
    _isExpandedList = List<bool>.filled(widget.items.length, false);
  }

  @override
  Widget build(BuildContext context) {
    List<String> Luoghi = [
      'T-Mobile Arena Las Vegas',
      'T-Mobile Center Missouri',
      'Miami-Dade Arena Florida',
      'AT&T Center Texas',
      'The O2 Arena London',
      'RAC Arena Australia',
      'Jeunesse Arena Rio de Janeiro',
      'Madison Square Garden New York',
      'Vivint Arena Utah',
      'Pechanga Arena California',
      'Footprint Center Arizona',
      'Nationwide Arena Ohio',
      'PNC Arena North Carolina',
      'Pepsi Center Colorado',
      'Target Center Minnesota'
    ];
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _isExpandedList[index] = !isExpanded;
        });
      },
      children: widget.items.map<ExpansionPanel>((String item) {
        int index = widget.items.indexOf(item);
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item),
            );
          },
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: Text('Contenuto dell\'elemento $Luoghi'),
          ),
          isExpanded: _isExpandedList[index],
        );
      }).toList(),
    );
  }
}

class animation_allenamento extends StatelessWidget {
  const animation_allenamento({
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
