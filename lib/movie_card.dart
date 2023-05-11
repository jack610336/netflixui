import 'package:flutter/material.dart';
import 'package:netflix/util.dart';

enum ButtonType {
  play,
  myList,
}

class MovieCardW extends StatelessWidget {
  const MovieCardW({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(image: Util.mainVideoPic),
            )),
      ),
      Positioned(
        bottom: 16,
        left: 16,
        right: 16,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Raunchy  •', style: TextStyle(color: Colors.white)),
                Text('  Sitcom  •', style: TextStyle(color: Colors.white)),
                Text('  Ensemble  •', style: TextStyle(color: Colors.white)),
                Text('  Gal Pals', style: TextStyle(color: Colors.white)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _cardButton(ButtonType.play),
                const SizedBox(width: 12),
                _cardButton(ButtonType.myList),
              ],
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _cardButton(ButtonType buttonType) {
    String text = 'Play';
    Color backgroundColor = Colors.white;
    Color textColor = Colors.black;
    Icon icon = Icon(
      Icons.play_arrow,
      size: 36,
    );

    if (buttonType == ButtonType.myList) {
      text = 'My List';
      backgroundColor = Color.fromARGB(255, 50, 44, 50);
      textColor = Colors.white;
      icon = Icon(Icons.add, size: 36);
    }

    return Expanded(
      child: SizedBox(
        height: 44,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            foregroundColor: MaterialStateProperty.all(textColor),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(width: 4),
              Text(text, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
