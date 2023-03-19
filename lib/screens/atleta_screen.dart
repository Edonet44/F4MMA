import 'package:flutter/material.dart';

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
    final String Valore_recuperato =
        ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold();
  }
}
