import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(
        //brightness: Brightness.dark,
          primarySwatch: Colors.deepOrange,
          accentColor:Colors.deepPurple
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Clipper test'),
          ),
          body:Center(
            child:Stack(
              children: <Widget>[
                ClipPath(
                  clipper: ArctoPointClass(),
                  child: Container(
                    width: 310,
                    height: 530,
                    color: Colors.yellow,
                    child: Text('Hello'),
                  ),
                ),
                //Image.network('https://www.cotrpro.com/wp-content/uploads/2020/07/106999157_2726177160816826_9100954873283786515_o.jpg'),

              ],
            )
          )
      ),
    );
  }
}

class LinePathClass extends CustomClipper<Path>{//Heart Shape
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.moveTo(size.width/2, 200);
    path.lineTo(size.width*0.75, 150);
    path.lineTo(size.width*0.8, 300);
    path.lineTo(size.width/2, 400);
    path.lineTo(size.width*0.2, 300);
    path.lineTo(size.width/4, 150);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class CurvePathClass extends CustomClipper<Path>{//Heart Shape
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.moveTo(0,size.height/2);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height/2);
    path.quadraticBezierTo(size.width/2, size.height+300, 0,size.height/2);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class CubicPathClass extends CustomClipper<Path>{//Heart Shape
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.cubicTo(size.width/4, 3*size.height/4, 3*size.width/4, size.height/4, size.width, size.height);
    path.lineTo( size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class CirclePathClass extends CustomClipper<Path>{//Heart Shape
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.addOval(
        Rect.fromCircle(center: Offset(size.width, 0), radius: 20)
    );

    return path;
  }



  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class ArctoPointClass extends CustomClipper<Path>{//Heart Shape
  @override
  Path getClip(Size size) {
    double radius = 20;
    var path = new Path();
    path.moveTo(radius,0);
    path.lineTo(size.width-radius,0);
    path.arcToPoint(Offset(size.width, radius),radius: Radius.circular(radius));

    path.lineTo(size.width, (size.height*3/4)-radius);
    path.arcToPoint(Offset(size.width,(size.height*3/4)+radius),radius: Radius.circular(radius),clockwise: false);

    path.lineTo(size.width, size.height-radius);
    path.arcToPoint(Offset(size.width-radius, size.height),radius: Radius.circular(radius));

    path.lineTo(radius, size.height);
    path.arcToPoint(Offset(0, size.height-radius),radius: Radius.circular(radius));

    path.lineTo(0, (size.height*3/4)+radius);
    path.arcToPoint(Offset(0, (size.height*3/4)-radius),radius: Radius.circular(radius),clockwise: false);

    path.lineTo(0, radius);
    path.arcToPoint(Offset(radius, 0),radius: Radius.circular(radius));

    return path;
  }



  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}