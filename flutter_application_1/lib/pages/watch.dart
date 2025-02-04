import 'package:flutter/material.dart';

class Watch extends StatefulWidget {
  const Watch({super.key});
  @override
  State<StatefulWidget> createState() => _Watch();
}
class _Watch extends State<Watch> {
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("This is us! (My motivation)", style:TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        
      ),
      body: const Center(child: Image(image:AssetImage('images/Beznazwy.png')),)
    );
  }
}