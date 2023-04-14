import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../screens/vm/Login/login_controller.dart';
import '../screens/vm/Login/login_screen.dart';

class LogOut extends StatefulHookConsumerWidget {
  const LogOut({super.key});

  @override
  ConsumerState<LogOut> createState() => _LogOutState();
}

class _LogOutState extends ConsumerState<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          child: Text("LogOut"),
          onPressed: () {
            ref.read(LoginControllerProvider.notifier).signOut();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
          }),
    );
  }
}
