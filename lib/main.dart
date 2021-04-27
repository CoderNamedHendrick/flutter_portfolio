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
        backgroundColor: Colors.white30,
        elevation: 0,
        title: Text(
          "Portfolio App",
          textDirection: TextDirection.ltr,
        ),
        centerTitle: true,
      ),
      body: _portfolio(context),
      backgroundColor: Colors.white30,
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
                    image: AssetImage("assets/my_pic.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              FlatButton(
                color: Colors.transparent,
                child: Icon(
                  getHeightState() == true ? Icons.close : Icons.height,
                  color: Colors.purple[400],
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
                  mainAxisAlignment: MainAxisAlignment.end,
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
                          style: TextStyle(
                              fontSize: 28, color: Colors.purple[400]),
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(34),
              ),
            ),
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
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
                                  image: AssetImage("assets/my_pic.png"),
                                  fit: BoxFit.fill)),
                        ),
                        Row(
                          children: [
                            Text(
                              "Name: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Sebastine Odeh",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      color: Colors.black,
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "About",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "I am a student of the University of Lagos, studying Computer Engineering. I build mobile apps using flutter.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.normal,
                              ),
                              textDirection: TextDirection.ltr,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Projects",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          decoration: TextDecoration.underline),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _projectInfo(
                          assetPath: "assets/weather_app.png",
                          projectTitle: "Weather app",
                          projectInfo:
                              "This is a weather app built with flutter."
                              "The project served as practice for understanding states in flutter and for calling APIs."),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _projectInfo(
      {String assetPath, String projectTitle, String projectInfo}) {
    return Container(
      child: Column(
        children: [
          Image(
            image: AssetImage(assetPath),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    projectTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    projectInfo,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
