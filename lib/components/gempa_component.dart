import 'package:flutter/material.dart';

import '../dto/gempa.dart';

class GempaComponent extends StatefulWidget {
  final Gempa gempa;
  const GempaComponent({Key? key, required this.gempa}) : super(key: key);

  @override
  _GempaComponentState createState() => _GempaComponentState();
}

class _GempaComponentState extends State<GempaComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffB81736),
            Color(0xff281537),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.white, width: 2.0),
          ),
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.gempa.Tanggal,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                SizedBox(height: 5),
                Text(
                  widget.gempa.Wilayah,
                  style: TextStyle(
                      color: Colors.limeAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Koordinat : ',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    Text(
                      widget.gempa.Coordinates,
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Magnitude : ',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    Text(
                      widget.gempa.Magnitude.toString(),
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Kedalaman : ',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    Text(
                      widget.gempa.Kedalaman,
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  widget.gempa.Potensi,
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
