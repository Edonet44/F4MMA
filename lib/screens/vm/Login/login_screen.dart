import 'package:f4mma/screens/screen.dart';
import 'package:f4mma/screens/vm/Register/register_screen.dart';
import 'package:f4mma/widget/circular_progress_indicator.dart';
import 'package:f4mma/widget/google_log.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'login_state.dart';
import 'login_controller.dart';

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
    //ref.listen ascolta i cambiamenti di stato LoginState in un LoginControllerProvider
//spiegazione funzione
//     void listen<T>(
//   ProviderListenable<T> provider,
//   void Function(T?, T) listener, {
//   void Function(Object, StackTrace)? onError,
// })
// La funzione ref.listen prende due parametri: il primo è l'oggetto da ascoltare (in questo caso LoginControllerProvider),
//  il secondo è una funzione da eseguire ogni volta che lo stato cambia.
// Questa funzione prende due argomenti: previous (lo stato precedente) e state (lo stato attuale).
    ref.listen<LoginState>(LoginControllerProvider, ((previous, state) {
      if (state is LoginStateError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.error),
        ));
      }
      //se utente loggato vai homescreen
      if (state is LoginStateSuccess) {
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
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
          child: ListView(children: <Widget>[
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
                'Password dimenticata?',
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    ref
                        .read(LoginControllerProvider.notifier)
                        .login(emailController.text, passwordController.text);
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Non hai un account?',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  child: const Text(
                    'Iscriviti',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //to register page
                    Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Modulo1()));
                  },
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: GoogleSignInButton(
                      onPressed: () {
                        ref
                            .read(LoginControllerProvider.notifier)
                            .login_withGoogle();
                      },
                    ),
                  ),
                )
              ],
            )
          ]),
        )
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

