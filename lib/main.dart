import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      providers: [ChangeNotifierProvider(create: (context) => PageProvider())],
      child: MaterialApp(
        scrollBehavior: MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
        ),
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: GoogleFonts.hind().fontFamily,
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 16,
                  fontWeight: FontWeight.w100),
              headlineLarge: TextStyle(
                color: Colors.black,
              )),
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

  @override
  void initState() {

    super.initState();
  }

  final List<Pages> allItems = Pages.values.map((e) => e).toList();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).textTheme.bodyLarge!.fontSize);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: MyNavigationBar(
              allPages: allItems,
            )),
        body: SingleChildScrollView(
            child: Provider.of<PageProvider>(context).currentPage.showPage));
  }
}
