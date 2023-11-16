import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class Torchlight extends StatefulWidget {
  const Torchlight({super.key});

  @override
  State<Torchlight> createState() => _TorchlightState();
}

class _TorchlightState extends State<Torchlight> {
  final bgcolor = Color.fromARGB(0, 20, 20, 32);
  final txtcolor = Colors.white;
  var Switch_on = false;
  var controller = TorchController();
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Flashlight",
          style: TextStyle(color: txtcolor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Switch_on
                          ? 'assets/images/img1.jpg'
                          : 'assets/images/img2.jpg',
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(
                      height: mq.height * 0.1,
                    ),
                    CircleAvatar(
                      minRadius: 30,
                      maxRadius: 45,
                      child: Transform.scale(
                        scale: 1.5,
                        child: IconButton(
                            onPressed: () {
                              controller.toggle();
                              Switch_on = !Switch_on;
                              setState(() {});
                            },
                            icon: Icon(Icons.power_settings_new)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text('Developed by Warisha Aslam'),
          SizedBox(
            height: mq.height * 0.05,
          ),
        ],
      ),
    );
  }
}
