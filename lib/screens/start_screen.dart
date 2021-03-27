import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_os_wear/screens/name_screen.dart';
import 'package:flutter_os_wear/utils/utils.dart';
import 'package:flutter_os_wear/wear.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WatchShape(
        builder: (context, shape) {
          var screenSize = MediaQuery.of(context).size;
          final shape = InheritedShape.of(context).shape;
          if (shape == Shape.round) {
            // boxInsetLength requires radius, so divide by 2
            screenSize = Size(boxInsetLength(screenSize.width ),
                boxInsetLength(screenSize.height ));
          }
          var screenHeight = screenSize.height;
          var screenWidth = screenSize.width;

          return Center(
            child: Container(
              height: screenSize.height,
              width: screenSize.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Front.png'),
                      fit: BoxFit.fill
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  //FlutterLogo(size: 90),
                  //SizedBox(height: 10),
                  RaisedButton(
                    highlightColor: Colors.grey,
                    elevation: 6.0,
                    child: Text(
                      'Hey!',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.black12,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return NameScreen(screenHeight, screenWidth);
                        }),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
