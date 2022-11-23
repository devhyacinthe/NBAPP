import 'package:flutter/material.dart';
import 'package:nbapp/screens/teamsPage.screen.dart';
import 'package:nbapp/widgets/news_card.dart';

import '../constants/colors.dart';
import '../models/news.models.dart';
import '../services/news.dart';
import '../widgets/app_bar.dart';
import 'package:get/get.dart';
import 'homePage.screen.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsModel> _news = [];

  bool _isloading = true;

  @override
  void initState() {
    getNews();

    super.initState();
  }

  Future<void> getNews() async {
    _news = await NewsApi.getNews();
    setState(() {
      _isloading = false;
    });
  }

  int _selectedIndex = 2;

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Get.to(() => const HomePage(), transition: Transition.zoom);
      } else if (_selectedIndex == 0) {
        Get.to(() => const TeamsPage(), transition: Transition.zoom);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustom(titleText: 'News'),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.graphic_eq_outlined), label: "Teams"),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_basketball_outlined), label: "Games"),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper_outlined), label: "News"),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          selectedItemColor: secondaryColor,
          onTap: _onTapped,
          selectedLabelStyle: const TextStyle(color: secondaryColor),
          unselectedLabelStyle: const TextStyle(color: textColor),
        ),
        body: _isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _news.length,
                itemBuilder: (context, index) {
                  return NewsCard(
                    team: _news[index].team,
                    source: _news[index].source,
                    timeAgo: _news[index].timeAgo,
                    title: _news[index].title,
                    content: _news[index].content,
                    link: _news[index].link,
                    author: _news[index].author,
                  );
                }));
  }
}
