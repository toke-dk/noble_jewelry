import 'package:flutter/material.dart';
import 'package:noble_jewelry/shared/color_palette.dart';
import 'package:noble_jewelry/widgets/navigationbar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            toolbarHeight: 110,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0),
        primarySwatch: Palette.kPrimaryMaterialColor,
      ),
      home: const Content(),
    );
  }
}

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final List<MenuItems> allItems = MenuItems.values.map((e) => e).toList();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 100),
            child: MyNavigationBar(
              allItems: allItems,
              currentIndex: currentIndex,
              onIndexChange: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )),
        body: allItems[currentIndex].showPage);
  }
}
