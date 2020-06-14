import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';

import '../components/type-test/index.dart';

const keyTypeTestIncrementButton = Key('keyTypeTestIncrementButton');
const keyTypeTestDecrementButton = Key('keyTypeTestDecrementButton');
const keyTypeTestMultiplyButton = Key('keyTypeTestMultiplyButton');
const keyTypeTestDivideButton = Key('keyTypeTestDivideButton');

Momentum typeTestWidget() {
  return Momentum(
    child: TypeTestApp(),
    controllers: [
      ATypeTestController(),
      BTypeTestController(),
    ],
  );
}

class TypeTestApp extends StatelessWidget {
  const TypeTestApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                MomentumBuilder(
                  controllers: [ATypeTestController],
                  builder: (context, snapshot) {
                    var typeTest = snapshot<TypeTestModel>();
                    return Text('$ATypeTestController: ${typeTest.value}');
                  },
                ),
                MomentumBuilder(
                  controllers: [BTypeTestController],
                  builder: (context, snapshot) {
                    var typeTest = snapshot<TypeTestModel>();
                    return Text('$BTypeTestController: ${typeTest.value}');
                  },
                ),
                FlatButton(
                  key: keyTypeTestIncrementButton,
                  onPressed: () {
                    Momentum.controller<ATypeTestController>(
                      context,
                    ).increment();
                  },
                  child: Text('Increment'),
                ),
                FlatButton(
                  key: keyTypeTestDecrementButton,
                  onPressed: () {
                    Momentum.controller<BTypeTestController>(
                      context,
                    ).decrement();
                  },
                  child: Text('Decrement'),
                ),
                FlatButton(
                  key: keyTypeTestMultiplyButton,
                  onPressed: () {
                    Momentum.controller<ATypeTestController>(
                      context,
                    ).multiplyBy(2);
                  },
                  child: Text('Multiply by 2'),
                ),
                FlatButton(
                  key: keyTypeTestDivideButton,
                  onPressed: () {
                    Momentum.controller<BTypeTestController>(
                      context,
                    ).divideBy(2);
                  },
                  child: Text('Divide by 2'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
