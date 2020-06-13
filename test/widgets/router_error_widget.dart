import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';

import '../components/counter/index.dart';
import '../utilities/memory_db.dart';

const errorTestGotoPageBKey = Key('errorTestGotoPageBKey');

Momentum routerErrorTest() {
  return Momentum(
    child: MyApp(),
    controllers: [CounterController()],
    services: [
      Router([
        PageErrorTestA(),
      ]),
      InMemoryStorage<String>(),
    ],
    persistSave: (context, key, value) async {
      var storage = InMemoryStorage.of<String>('routerErrorTest',context);
      var result = await storage.save(key, value);
      return result;
    },
    persistGet: (context, key) async {
      var storage = InMemoryStorage.of<String>('routerErrorTest',context);
      var result = storage.getValue(key);
      return result;
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: Router.getActivePage(context),
    );
  }
}

class PageErrorTestA extends StatelessWidget {
  const PageErrorTestA({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          key: errorTestGotoPageBKey,
          onPressed: () {
            Router.goto(context, PageErrorTestB);
          },
          child: Text('Goto PageB'),
        ),
      ),
    );
  }
}

class PageErrorTestB extends StatelessWidget {
  const PageErrorTestB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('PageB'),
      ),
    );
  }
}
