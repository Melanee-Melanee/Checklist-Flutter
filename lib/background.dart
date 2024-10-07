import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final int numOfTask;

  const Background({
    Key key,
    @required this.child,
  this.numOfTask = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: 30,
            right: 0,
          ),
          child: Stack(children: [
            Align(
              alignment:Alignment.centerRight,
              child: Image.asset("assets/images/dokhtar2.png",
                  width: size.width * 0.7),
            ),
            Container(

              padding: EdgeInsets.only(
                  top: 30, left: 30, right: 30),
              child:
              Center(
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height:0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          child: Text(
                            'Checklist',
                            style: TextStyle(
                              fontFamily: 'Grandstander',
                              color:Color(0XFFd32f2f),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${numOfTask} Task(s)',
                        style: TextStyle(
                            fontFamily: 'Grandstander',
                          color:Color(0XFFd32f2f),
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ]),
              ),
            ),
          ]),
        ),
        Expanded(child: child)
      ],
    );
  }
}
