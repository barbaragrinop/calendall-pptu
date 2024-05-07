import 'package:flutter/material.dart';
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      padding: EdgeInsets.all(20), 
      child: SizedBox(
        // height: 1.0, // Change this value to your desired footer height
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Seu footer aqui',
              style: TextStyle(
                color: Colors.black, // Cor do texto
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}