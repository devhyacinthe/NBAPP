import 'package:flutter/material.dart';
import 'package:nbapp/providers/teams.provider.dart';
import 'package:nbapp/screens/teams_details.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/logo.dart';
import '../models/teams.models.dart';
import '../services/teams.dart';
import '../widgets/app_bar.dart';
import 'homePage.screen.dart';
import 'newsPage.screen.dart';
import 'package:get/get.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  List<TeamsModel>? _teams = [];

  bool _isloading = true;

  @override
  void initState() {
    getTeams();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getTeams() async {
    var teamsProvider = Provider.of<TeamsProvider>(context, listen: false);
    final teams = await TeamApi.getTeams();
    teamsProvider.setTeamsList(teams);

    setState(() {
      _teams = teams;
      _isloading = false;
    });
  }

  int _selectedIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Get.to(() => const HomePage(), transition: Transition.zoom);
      } else if (_selectedIndex == 2) {
        Get.to(() => const NewsPage(), transition: Transition.zoom);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_teams == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Consumer<TeamsProvider>(builder: ((context, value, child) {
      return Scaffold(
          appBar: const AppBarCustom(titleText: 'NBA Teams'),
          body: _isloading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: _teams!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => TeamsDetails(index: index));
                      },
                      child: ListTile(
                        title: Text(_teams![index].name!),
                        subtitle: Text(_teams![index].city!),
                        leading: Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('${logos[index]}'))),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage('${logos[index]}'),
                          ),
                        ),
                      ),
                    );
                  }),
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
          ));
    }));
  }
}
