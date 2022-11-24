import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../models/players.models.dart';

import '../screens/players_details.dart';
import '../services/players.dart';

class PlayersTile extends StatefulWidget {
  PlayersTile({Key? key, required this.keys}) : super(key: key);

  String keys;

  @override
  State<PlayersTile> createState() => _PlayersTileState();
}

class _PlayersTileState extends State<PlayersTile> {
  List<PlayersModel> _players = [];

  bool _isloading = true;

  @override
  void initState() {
    getPlayers();

    super.initState();
  }

  Future<void> getPlayers() async {
    _players = await PlayersApi.getPlayers(widget.keys);
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    

    return _isloading
        ? const Center(child: CircularProgressIndicator())
        : 
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              
              reverse: true,
              itemCount: _players.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => PlayersDetails(index: index, keys: widget.keys,));
                  },
                  child: ListTile(
                    title: Text(_players[index].firstname!),
                    subtitle: Text(_players[index].lastname!),
                    leading: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage('${_players[index].photo}'))),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage('${_players[index].photo}'),
                      ),
                    ),
                  ),
                );
              },
            
        );
  }
}
