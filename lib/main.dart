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
                  color: Colors.deepOrange,
                ),
                onPressed: () => setState(() {
                  getHeightState() == true
                      ? setHeight(height: 2.7)
                      : setHeight();
                  getHeightState() == true
                      ? setHeightState(heightState: false)
                      : setHeightState();
                }),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Hello, I am ",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      Text(
                        "Sebastine Odeh.",
                        style:
                            TextStyle(fontSize: 32, color: Colors.deepOrange),
                      ),
                      Text(
                        "Mobile Developer(Flutter)",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30)),
                      ),
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
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Skills",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                              ),
                            ),
                            SizedBox(
                              height: 130,
                              child: GridView.count(
                                childAspectRatio: 2,
                                crossAxisCount: 2,
                                padding: EdgeInsets.all(8.0),
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                children: [
                                  _specialisationInfo(
                                    icon: Icon(
                                      Icons.code,
                                      color: Colors.red,
                                    ),
                                    speciality: "Flutter",
                                  ),
                                  _specialisationInfo(
                                      icon: Icon(
                                        Icons.stream,
                                        color: Colors.red,
                                      ),
                                      speciality: "StateManagement with blocs"),
                                  _specialisationInfo(
                                      icon: Icon(
                                        Icons.code,
                                        color: Colors.red,
                                      ),
                                      speciality: "Dart"),
                                  _specialisationInfo(
                                    icon: Icon(
                                      Icons.android_rounded, color: Colors.red,
                                    ),
                                    speciality: "Android development"
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "Projects",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          decoration: TextDecoration.underline),
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

  Widget _specialisationInfo({Icon icon, String speciality}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: GridTile(
        child: icon,
        footer: Text(
          speciality,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _projectInfo(
      {String assetPath, String projectTitle, String projectInfo}) {
    return Container(
      color: Colors.deepOrange,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      projectTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white,
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
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
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
      ),
    );
  }
}
