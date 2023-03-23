import 'package:flutter/material.dart';

class MagicCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  final bool isTop;

  MagicCard(
      {required this.title,
      required this.subtitle,
      required this.image,
      required this.isTop});

  @override
  _MagicCardState createState() => _MagicCardState();
}

class _MagicCardState extends State<MagicCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedPositioned(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        top: widget.isTop
            ? _isExpanded
                ? -100.0
                : 0.0
            : _isExpanded
                ? 100.0
                : 0.0,
        child: Card(
          elevation: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
