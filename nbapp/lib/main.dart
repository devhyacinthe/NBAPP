import 'package:flutter/material.dart';
import 'package:nbapp/providers/news.provider.dart';
import 'package:nbapp/providers/players.provider.dart';
import 'package:nbapp/providers/teams.provider.dart';
import 'package:nbapp/screens/homePage.screen.dart';
import 'package:nbapp/screens/newsPage.screen.dart';
import 'package:nbapp/screens/teamsPage.screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => TeamsProvider()),
      ChangeNotifierProvider(create: (_) => PlayersProvider()),
      ChangeNotifierProvider(create: (_) => NewsProvider())
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'NBAPP',
        debugShowCheckedModeBanner: false,
        routes: {
          '/home': (_) => const HomePage(),
          '/news': (_) => const NewsPage(),
          '/teams': (_) => const TeamsPage(),
        },
        home: const HomePage());
  }
}
