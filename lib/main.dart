import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import 'constant.dart';
import 'content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Express Flutter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Express Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  //in cm
  double _height = 157 * 4;
  double _width = 74 * 4;
  bool hasAppBar = false;
  String appBarTitle = 'AppBar title Here';
  bool isCenter = false;
  List list = [];

  var cname = 'NewWidget';
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(10),
          primary: false,
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0, top: 40),
              child: Text(
                'EXPRESS FLUTTER',
                textAlign: TextAlign.center,
                style: const TextTheme(titleLarge: TextStyle(fontSize: 40))
                    .titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Change Widget Name',
                    border: OutlineInputBorder()),
                initialValue: cname,
                onChanged: (v) {
                  setState(() {
                    cname = v;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTileCard(
                  baseColor: Colors.amber,
                  expandedColor: Colors.amberAccent,
                  title: const Text('Emulator Setting'),
                  children: [
                    ListTile(
                        leading: IconButton(
                          onPressed: () {
                            setState(() {
                              _width = _width - 2;
                            });
                          },
                          icon: const Icon(Icons.exposure_minus_2_sharp),
                        ),
                        title: const Text(
                          'Change Width',
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          '($_width)',
                          textAlign: TextAlign.center,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              _width = _width + 2;
                            });
                          },
                          icon: Icon(Icons.exposure_plus_2_sharp),
                        )),
                    ListTile(
                        leading: IconButton(
                          onPressed: () {
                            setState(() {
                              _height = _height - 2;
                            });
                          },
                          icon: Icon(Icons.exposure_minus_2_sharp),
                        ),
                        title: const Text(
                          'Change height',
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          '($_height)',
                          textAlign: TextAlign.center,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              _height = _height + 2;
                            });
                          },
                          icon: const Icon(Icons.exposure_plus_2_sharp),
                        )),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTileCard(
                  baseColor: Colors.amber,
                  expandedColor: Colors.amberAccent,
                  title: const Text('App Bar'),
                  leading: Switch(
                    value: hasAppBar,
                    onChanged: (bool value) {
                      setState(() {
                        if (value) {
                          list.add(appBarText(appBarTitle));
                        } else {
                          list.removeAt(0);
                        }
                        hasAppBar = value;
                      });
                    },
                  ),
                  children: [
                    ListTile(
                      trailing: Switch(
                        value: isCenter,
                        onChanged: (bool value) {
                          if (value) {
                            list.removeAt(0);
                            list.add(appBarTextCenter(appBarTitle));
                          } else {
                            list.removeAt(0);
                          }
                          setState(() {
                            isCenter = value;
                          });
                        },
                      ),
                      title: const Text('Center Title'),
                    ),
                    if (hasAppBar)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: appBarTitle,
                          decoration: const InputDecoration(
                              labelText: 'Change Appbar Title',
                              border: OutlineInputBorder()),
                          onChanged: (v) {
                            setState(() {});
                            list.removeAt(0);
                            if (isCenter) {
                              list.add(appBarTextCenter(v));
                            } else {
                              list.add(appBarText(v));
                            }
                            appBarTitle = v;
                          },
                        ),
                      ),
                  ]),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 100,
                children: [
                  Container(
                      height: _height,
                      width: 400,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('SOURCE CODE\n'),
                            Text("class $cname extends StatefulWidget {"
                                "\n  const $cname{Key? key}): super(key: key);\n"
                                "\n @override\n"
                                "  State<$cname> createState() => _${cname}State();\n"
                                " }\n"
                                " \nclass _${cname}State extends State<$cname> {\n"
                                "  @override\n"
                                "  Widget build(BuildContext context) {\n"
                                "       return Scaffold("),
                            if (list.isNotEmpty)
                              for (var item in list) ...[
                                Text(item),
                              ],
                            if (list.isEmpty)
                              const Text("              body:Container()"),
                            const Text(
                              "       );\n"
                              "    }\n"
                              "  }",
                            ),
                          ],
                        ),
                      )),
                  Container(
                    height: _height,
                    width: _width,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Content(
                        hasAppbar: hasAppBar,
                        appBarTitle: appBarTitle,
                        isCenter: isCenter,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
