import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FirstScreenBody extends StatelessWidget {
  const FirstScreenBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("This also");
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Vaccinations',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Center(
            child: CircularPercentIndicator(
              radius: 200.0,
              lineWidth: 20.0,
              animation: true,
              percent: 0.5,
              center: new Text(
                "50.0%",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              // footer: new Text(
              //   "Sales this week",
              //   style: new TextStyle(
              //       fontWeight: FontWeight.bold, fontSize: 17.0),
              // ),
              circularStrokeCap: CircularStrokeCap.butt,
              progressColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
