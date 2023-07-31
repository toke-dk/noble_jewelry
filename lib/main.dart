import 'package:flutter/material.dart';
import 'package:noble_jewelry/models/pageProvider.dart';
import 'package:noble_jewelry/shared/color_palette.dart';
import 'package:noble_jewelry/widgets/navigationbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageProvider())
      ],
      child: MaterialApp(
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
      ),
    );
  }
}

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final List<Pages> allItems = Pages.values.map((e) => e).toList();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 100),
            child: MyNavigationBar(
              allPages: allItems,
            )),
        body: SingleChildScrollView(child: Provider.of<PageProvider>(context).currentPage.showPage));
  }
}
