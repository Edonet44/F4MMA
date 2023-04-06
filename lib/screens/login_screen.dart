import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'vm/login_state.dart';
import 'vm/login_controller.dart';

class LoginPage extends StatefulHookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(LoginControllerProvider, ((previous, state) {
      if (state is LoginStateError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.error),
        ));
      }
    }));

    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/bckg.png',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                // Container(
                //     alignment: Alignment.center,
                //     padding: const EdgeInsets.all(10),
                //     child: const Text(
                //       'TemiCodes',
                //       style: TextStyle(
                //           color: Colors.blue,
                //           fontWeight: FontWeight.w500,
                //           fontSize: 30),
                //     )),
                Padding(padding: EdgeInsets.only(top: 200)),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text(
                    'Forgot Password',
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        ref.read(LoginControllerProvider.notifier).login(
                            emailController.text, passwordController.text);
                      },
                    )),
                Row(
                  children: <Widget>[
                    const Text(
                      'Does not have account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            )),
      ]),
    );
  }
}

//login utilizzato ma adesso senza StateMAnagement

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool _showEmailTextField = false;
//   bool _showPasswordTextField = false;
//   bool _showRegistrationForm = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/bckg.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 if (_showEmailTextField)
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     child: FadeIn(
//                       duration: Duration(milliseconds: 500),
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           border: OutlineInputBorder(),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.white,
//                               width: 2.0,
//                             ),
//                           ),
//                         ),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 if (_showPasswordTextField)
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     child: FadeIn(
//                         duration: Duration(milliseconds: 500),
//                         child: TextFormField(
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             labelText: 'Password',
//                             border: OutlineInputBorder(),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.white,
//                                 width: 2.0,
//                               ),
//                             ),
//                           ),
//                           style: TextStyle(color: Colors.white),
//                         )),
//                   ),
//                 SizedBox(height: 15),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       _showEmailTextField = true;
//                       _showPasswordTextField = true;
//                       _showRegistrationForm = false;
//                     });


//                   },
//                   child: Text(
//                     'Login',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.redAccent,
//                     padding: EdgeInsets.all(20),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       _showEmailTextField = false;
//                       _showPasswordTextField = false;
//                       _showRegistrationForm = true;
//                     });
//                   },
//                   child: Text(
//                     'Iscriviti',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 214, 178, 18),
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Color.fromARGB(255, 10, 10, 10),
//                     padding: EdgeInsets.all(20),
//                   ),
//                 ),
//                 if (_showRegistrationForm) Modulo1()
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FadeIn extends StatefulWidget {
//   final Widget child;
//   final Duration duration;

//   FadeIn({required this.child, required this.duration});

//   @override
//   _FadeInState createState() => _FadeInState();
// }

// class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
//   late final AnimationController _controller = AnimationController(
//     vsync: this,
//     duration: widget.duration,
//   );

//   late final Animation<double> _animation = CurvedAnimation(
//     parent: _controller,
//     curve: Curves.easeIn,
//   );

//   @override
//   void initState() {
//     super.initState();
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: _animation,
//       child: widget.child,
//     );
//   }
// }

// class Modulo1 extends StatefulWidget {
//   const Modulo1({Key? key}) : super(key: key);

//   @override
//   State<Modulo1> createState() => _Modulo1State();
// }

// class _Modulo1State extends State<Modulo1> {
//   double _opacity = 0.0;
//   final _formKey = GlobalKey<FormState>();
//   final _nome = TextEditingController();
//   final _cognome = TextEditingController();
//   final _telefono = TextEditingController();
//   final _mail = TextEditingController();
//   final _ora = TextEditingController();
//   //array per tipi di massaggi
//   List<String> drop_Ditems = [
//     'GALLO',
//     'LEGGERI',
//     'WALTER',
//     'MEDI',
//     'MASSIMI',
//   ];
//   String? selezionato_dropdwon = 'GALLO';
//   String name = "";
//   @override
//   void initState() {
//     super.initState();
//     //aggiungi questo codice per far apparire gradualmente il modulo
//     Future.delayed(const Duration(milliseconds: 500), () {
//       setState(() {
//         _opacity = 1.0;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double altezza = MediaQuery.of(context).size.height;
//     final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//     return AnimatedOpacity(
//       opacity: _opacity,
//       duration: const Duration(seconds: 1),
//       child: SingleChildScrollView(
//         child: Container(
//             margin: EdgeInsets.only(top: 10),
//             color: Colors.amberAccent,
//             height: 400,
//             width: MediaQuery.of(context).size.width,
//             padding: const EdgeInsets.only(left: 40, right: 40),
//             child: SingleChildScrollView(
//               child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                           height: altezza * 0.04,
//                           width: MediaQuery.of(context).size.width * 0.06),
//                       const Text("",
//                           style: TextStyle(
//                               fontSize: 40,
//                               color: Color.fromARGB(255, 247, 241, 241))),

//                       SizedBox(height: altezza * 0.04),
//                       //campo nome
//                       TextFormField(
//                           keyboardType: TextInputType.name,
//                           controller: _nome,
//                           decoration: const InputDecoration(
//                             hintText: 'Nome',
//                             border: OutlineInputBorder(),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.white,
//                                 width: 2.0,
//                               ),
//                             ),
//                           ),
//                           style: TextStyle(color: Colors.white),
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           //se il valore è diverso da nullo e il validatore e ok altrimenti inserisci una mail valida
//                           validator: (value) {
//                             if (value != null) {
//                               return null;
//                             }
//                           }),
//                       const SizedBox(height: 10),
//                       //campo congome

//                       TextFormField(
//                           keyboardType: TextInputType.text,
//                           controller: _cognome,
//                           decoration: const InputDecoration(
//                             hintText: "Email",
//                             border: OutlineInputBorder(),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.white,
//                                 width: 2.0,
//                               ),
//                             ),
//                           ),
//                           style: TextStyle(color: Colors.white),
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: (value) {
//                             if (value != null) {
//                               return null;
//                             }
//                           }),
//                       const SizedBox(height: 10),
//                       // TextFormField(
//                       //     keyboardType: TextInputType.phone,
//                       //     controller: _telefono,
//                       //     decoration: const InputDecoration(
//                       //       hintText: "Telefono",
//                       //       border: OutlineInputBorder(),
//                       //       enabledBorder: OutlineInputBorder(
//                       //         borderSide: BorderSide(
//                       //           color: Colors.white,
//                       //           width: 2.0,
//                       //         ),
//                       //       ),
//                       //     ),
//                       //     autovalidateMode: AutovalidateMode.onUserInteraction,
//                       //     validator: (value) {
//                       //       if (value != null && value.length < 7) {
//                       //         return "Devi inserire il telefono";
//                       //       } else {
//                       //         return null;
//                       //       }
//                       //     }),
//                       const SizedBox(height: 10),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.white),
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           child: DropdownButton(
//                             style: TextStyle(
//                               color: Colors
//                                   .white, // imposta il colore del testo su bianco
//                               fontSize: 16, // imposta la dimensione del font
//                             ),
//                             value: selezionato_dropdwon,
//                             items: drop_Ditems
//                                 .map((item) => DropdownMenuItem<String>(
//                                       value: item,
//                                       child: Text(
//                                         item,
//                                         style: const TextStyle(fontSize: 16),
//                                       ),
//                                     ))
//                                 .toList(),
//                             onChanged: (item) => setState(
//                                 () => selezionato_dropdwon = item as String?),
//                             underline: Container(),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 10),
//                       // TextFormField(
//                       //   keyboardType: TextInputType.datetime,
//                       //   controller: _mail,
//                       //   decoration: const InputDecoration(
//                       //     hintText: "email",
//                       //     border: OutlineInputBorder(),
//                       //     enabledBorder: OutlineInputBorder(
//                       //       borderSide: BorderSide(
//                       //         color: Colors.white,
//                       //         width: 2.0,
//                       //       ),
//                       //     ),
//                       //   ),
//                       //   autovalidateMode: AutovalidateMode.onUserInteraction,
//                       // ),
//                       // const SizedBox(height: 10),
//                       // TextFormField(
//                       //   keyboardType: TextInputType.datetime,
//                       //   controller: _ora,
//                       //   decoration: const InputDecoration(
//                       //     border: OutlineInputBorder(),
//                       //     enabledBorder: OutlineInputBorder(
//                       //       borderSide: BorderSide(
//                       //         color: Colors.white,
//                       //         width: 2.0,
//                       //       ),
//                       //     ),
//                       //   ),
//                       //   autovalidateMode: AutovalidateMode.onUserInteraction,
//                       // ),
//                       // const SizedBox(height: 10),
//                       //creare anche una lista di radiobutton per la selezione dei vari pagamenti
//                       //https://www.youtube.com/watch?v=WPge1ZuEeCQ
//                       const SizedBox(height: 18),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             _convalida_form(context);
//                           },
//                           child: const Text(
//                             'ISCRIVITI',
//                             style:
//                                 TextStyle(fontFamily: 'Verdana', fontSize: 18),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )),
//             )),
//       ),
//     );
//   }

  // void _convalida_form(BuildContext context) {
  //   if (_formKey.currentState!.validate()) {
  //     //attivare provider
  //     //esempio di utilizzo di bloc
  //     /*
  //     BlocProvider.of<ModuloBloc>(context).add(Create(
  //         _nome.text,
  //         _cognome.text,
  //         _telefono.text,
  //         selezionato_dropdwon!,
  //         _mail.text,
  //         _ora.text));
  //   }
  //   */
  //   }
  // }

