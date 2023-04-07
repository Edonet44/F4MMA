import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/experimental.dart';
import '../model/cl_palestre.dart';
import 'package:flame/sprite.dart';
import 'package:vector_math/vector_math.dart' as vmath;
import 'package:flame/sprite.dart';

class Allenamento extends StatelessWidget {
  const Allenamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Employee List"),
        ),
        body: Container(
          child: Column(
            children: [],
            // children: [BoxingBagWidget()],
          ),
        ));
  }
}

//allenamento con sacco boxe
// class BoxingBagWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (TapDownDetails details) {
//         final position = details.globalPosition;
//         final game = _BoxingBagGame(position);
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => game.widget),
//         );
//       },
//       child: Container(
//         color: Colors.white,
//         child: Center(
//           child: Text('Tap to play with the boxing bag'),
//         ),
//       ),
//     );
//   }
// }

// class _BoxingBagGame extends FlameGame {
//   final Offset _tapPosition;

//   _BoxingBagGame(this._tapPosition) {
//     _init();
//   }

//   Future<void> _init() async {
//     final image = await Flame.images.load('punching-bag.png');
//     final spriteSheet = SpriteSheet(image: image, srcSize: Vector2.all(100));
//     final animation =
//         spriteSheet.createAnimation(stepTime: 0.1, to: 7, loop: false, row: 0);

//     final component = SpriteAnimationComponent(
//       animation: animation,
//       position: Vector2(_tapPosition.dx - 50, _tapPosition.dy - 50),
//       size: Vector2.all(100),
//     );

//     add(component);
//   }

//   GameWidget get widget => GameWidget(game: this);
//}
