import 'package:flutter/material.dart';
import 'package:flutter_app/cn/xlunzi/flutter/ui_util.dart';

void main() {
  runApp(Page1());
  UiUtil.setStatusBar(true);
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route',
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: RaisedButton(
              onPressed: () async {
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return Page2();
                  }),
                );
                debugPrint('onBack $result');
              },
              child: Text('下一个'),
            ),
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Text(
              'Hello Flutter $hashCode',
              style: TextStyle(color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, '我回来了');
                },
                child: Text('返回'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
