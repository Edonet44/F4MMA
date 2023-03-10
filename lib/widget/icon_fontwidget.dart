import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

//widget creato per riutilizzare le icone in qualsiasi applicazione

class IconFont extends StatelessWidget {
  const IconFont({Key? key, this.color, this.size, required this.iconName})
      : super(key: key);

  final Color? color;
  final double? size;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.iconName,
      style: TextStyle(
          color: this.color, fontSize: this.size, fontFamily: 'orilla'),
    );
  }
}
