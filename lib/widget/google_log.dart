import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../screens/vm/Login/login_controller.dart';

//oggetto che crea un pulsante elevatedbutton con immagine di google e passa una funzione
//in questo caso utilizza poi nel login_screen il

class GoogleSignInButton extends StatefulHookConsumerWidget {
  final Function onPressed;

  const GoogleSignInButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  ConsumerState<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends ConsumerState<GoogleSignInButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: Colors.white,
        padding: const EdgeInsets.all(8.0),
      ),
      child: Container(
        width: 48.0,
        height: 48.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Center(
          child: Image.asset(
            'assets/images/G_Logo.png',
            width: 24.0,
            height: 24.0,
          ),
        ),
      ),
    );
  }
}
