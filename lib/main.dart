import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
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
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: GoogleFonts
              .hind()
              .fontFamily,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
                letterSpacing: 1.5, fontSize: 16, fontWeight: FontWeight.w100),
            headlineLarge: TextStyle(
              height: 1.1,
              color: Colors.black,
            ),
            headlineSmall: TextStyle(fontSize: 21),
          ),
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

  final List<Pages> menuPages = [
    Pages.home,
    Pages.shop,
    Pages.about,
    Pages.stories,
    Pages.contactUs
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(150),
            child: MyNavigationBar(
              menuPages: menuPages,
            )),
        body: FooterView(
          footer: Footer(
            backgroundColor: Colors.black,
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "FOLOW US",
                    style: TextStyle(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onPrimary),
                  ),
                  Text(
                    "home | about | contact".toUpperCase(),
                    style: TextStyle(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onPrimary),
                  ),
                  Text(
                    "@2023 Noble - Men’s fashion bracelets",
                    style: TextStyle(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .tertiary),
                  )
                ],
              ),
            ),
          ),
          children: [
            Align(
                alignment: Alignment.center,
                child: Provider
                    .of<PageProvider>(context)
                    .currentPage
                    .showPage),
          ],
        ));
  }
}
