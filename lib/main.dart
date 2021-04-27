import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 1.4;
  bool heightState = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Portfolio App",
          textDirection: TextDirection.ltr,
        ),
        centerTitle: true,
      ),
      body: _portfolio(context),
    );
  }

  Widget _portfolio(BuildContext context) {
    void setHeight({double height: 1.4}) => this.height = height;
    double getHeight() => this.height;
    void setHeightState({bool heightState: true}) =>
        this.heightState = heightState;
    bool getHeightState() => this.heightState;
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / getHeight(),
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                foregroundDecoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/starry_night.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              FlatButton(
                color: Colors.transparent,
                child: Icon(
                  getHeightState() == true ? Icons.close : Icons.height,
                  color: Colors.orange,
                ),
                onPressed: () => setState(() {
                  getHeightState() == true ? setHeight(height: 5) : setHeight();
                  getHeightState() == true
                      ? setHeightState(heightState: false)
                      : setHeightState();
                }),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello, I'm ",
                          style: TextStyle(fontSize: 28, color: Colors.white70),
                        ),
                        Text(
                          "Sebastine Odeh.",
                          style: TextStyle(fontSize: 28, color: Colors.orange),
                        )
                      ],
                    ),
                    Text(
                      "I'm a full-stack mobile developer.",
                      style: TextStyle(fontSize: 28, color: Colors.white70),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.pink,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                 Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(64),
                              image: DecorationImage(
                                  image: AssetImage("assets/night_image.jpg"),
                                  fit: BoxFit.fill)),
                        ),
                        Row(
                          children: [
                            Text(
                              "Name: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Sebastine Odeh",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  Spacer(),
                  Column(
                    children: [
                      Text("About")
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
