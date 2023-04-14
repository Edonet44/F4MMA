import 'package:f4mma/providers/users/user_provider.dart';
import 'package:f4mma/screens/screen.dart';
import 'package:f4mma/screens/vm/Register/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//final authProvider = Provider<AuthController>((ref) => AuthController());


class Modulo1 extends StatefulHookConsumerWidget {
  const Modulo1({Key? key}) : super(key: key);

  @override
  ConsumerState<Modulo1> createState() => _Modulo1State();
}

class _Modulo1State extends ConsumerState<Modulo1> {
  double _opacity = 0.0;
  final _formKey = GlobalKey<FormState>();
  final _mail = TextEditingController();
  final _password = TextEditingController();
  // final _telefono = TextEditingController();
  // final _mail = TextEditingController();
  // final _ora = TextEditingController();
  //array per tipi di massaggi
  List<String> drop_Ditems = [
    'GALLO',
    'LEGGERI',
    'WALTER',
    'MEDI',
    'MASSIMI',
  ];
  String? selezionato_dropdwon = 'GALLO';
  String name = "";
  @override
  void initState() {
    super.initState();
    //aggiungi questo codice per far apparire gradualmente il modulo
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double altezza = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(body: 
        Stack(
          children:[
            Positioned.fill(
          child: Image.asset(
            'assets/images/body-registration.jpg',
            fit: BoxFit.cover,
          ),
        ),
            Padding(padding: EdgeInsets.all(10),
              child: ListView(
              children: [AnimatedOpacity(opacity: _opacity,duration: Duration(seconds: 1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Container(
                      margin: EdgeInsets.only(top: 10),
                     //color: Colors.amberAccent,
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: SingleChildScrollView(
                        child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: altezza * 0.04,
                                    width: MediaQuery.of(context).size.width * 0.06),
                                const Text("",
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Color.fromARGB(255, 247, 241, 241))),
                    
                                SizedBox(height: altezza * 0.04),
                                //campo nome
                                TextFormField(
                                    keyboardType: TextInputType.name,
                                    controller: _mail,
                                    decoration: const InputDecoration(
                                      hintText: 'Mail',
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    //se il valore è diverso da nullo e il validatore e ok altrimenti inserisci una mail valida
                                    validator: (value) {
                                      if (value != null) {
                                        return null;
                                      }
                                    }),
                                const SizedBox(height: 10),
                                //campo congome
                    
                                TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _password,
                                    decoration: const InputDecoration(
                                      hintText: "Password",
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value != null) {
                                        return null;
                                      }
                                    }),
                                const SizedBox(height: 10),
                                // TextFormField(
                                //     keyboardType: TextInputType.phone,
                                //     controller: _telefono,
                                //     decoration: const InputDecoration(
                                //       hintText: "Telefono",
                                //       border: OutlineInputBorder(),
                                //       enabledBorder: OutlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color: Colors.white,
                                //           width: 2.0,
                                //         ),
                                //       ),
                                //     ),
                                //     autovalidateMode: AutovalidateMode.onUserInteraction,
                                //     validator: (value) {
                                //       if (value != null && value.length < 7) {
                                //         return "Devi inserire il telefono";
                                //       } else {
                                //         return null;
                                //       }
                                //     }),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    // child: DropdownButton(
                                    //   style: TextStyle(
                                    //     color: Colors
                                    //         .white, // imposta il colore del testo su bianco
                                    //     fontSize: 16, // imposta la dimensione del font
                                    //   ),
                                    //   value: selezionato_dropdwon,
                                    //   items: drop_Ditems
                                    //       .map((item) => DropdownMenuItem<String>(
                                    //             value: item,
                                    //             child: Text(
                                    //               item,
                                    //               style: const TextStyle(fontSize: 16),
                                    //             ),
                                    //           ))
                                    //       .toList(),
                                    //   onChanged: (item) => setState(
                                    //       () => selezionato_dropdwon = item as String?),
                                    //   underline: Container(),
                                    // ),
                                  ),
                                ),
                    
                                const SizedBox(height: 10),
                                // TextFormField(
                                //   keyboardType: TextInputType.datetime,
                                //   controller: _mail,
                                //   decoration: const InputDecoration(
                                //     hintText: "email",
                                //     border: OutlineInputBorder(),
                                //     enabledBorder: OutlineInputBorder(
                                //       borderSide: BorderSide(
                                //         color: Colors.white,
                                //         width: 2.0,
                                //       ),
                                //     ),
                                //   ),
                                //   autovalidateMode: AutovalidateMode.onUserInteraction,
                                // ),
                                // const SizedBox(height: 10),
                                // TextFormField(
                                //   keyboardType: TextInputType.datetime,
                                //   controller: _ora,
                                //   decoration: const InputDecoration(
                                //     border: OutlineInputBorder(),
                                //     enabledBorder: OutlineInputBorder(
                                //       borderSide: BorderSide(
                                //         color: Colors.white,
                                //         width: 2.0,
                                //       ),
                                //     ),
                                //   ),
                                //   autovalidateMode: AutovalidateMode.onUserInteraction,
                                // ),
                                // const SizedBox(height: 10),
                                //creare anche una lista di radiobutton per la selezione dei vari pagamenti
                                //https://www.youtube.com/watch?v=WPge1ZuEeCQ
                                const SizedBox(height: 18),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      //get registrer controller
                                      _convalida_form(context, ref);
                                    },
                                    child: const Text(
                                      'ISCRIVITI',
                                      style:
                                          TextStyle(fontFamily: 'Verdana', fontSize: 18),
                                    ),
                                  ),
                                ),
                      
                               Row(crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Expanded(
                                     child: Center(
                                       child: TextButton(
                                                           child: const Text(
                                                             'Vai al Login',
                                                             style: TextStyle(fontSize: 20),
                                                           ),
                                                           onPressed: () {
                                                             //to register page
                                                             Navigator.of(context).pushReplacement(
                                                             MaterialPageRoute(builder: (context) => const LoginPage()));
                                                           },
                                                         ),
                                     ),
                                   ),
                                 ],
                               ),
                              ],
                            )),
                      )),
                ),
              ),
                      ]),
            ),
    ]),
      
    );
  }

//controllo lato client del form
  void _convalida_form(BuildContext context, WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      ref
                            .watch(SignUpProvider.notifier).register(_mail.text, _password.text);   
    }
  }
}
