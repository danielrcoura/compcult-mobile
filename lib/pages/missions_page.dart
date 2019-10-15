import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import '../shared/providers/user_provider.dart';
import '../shared/components/item_card.dart';
import './mission_submit.dart';
import '../shared/models/mission.dart';

class MissionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int userId = Provider.of<UserProvider>(context).userId;

    return FutureBuilder(
      future: _getMissions(userId),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
          );
        }

        final Response response = snapshot.data;

        final List<Mission> missions = List<Mission>.from(
            response.data.map((mission) => Mission.fromJson(mission)));

        return _buildList(missions);
      },
    );
  }

  _buildList(List<Mission> missions) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      itemCount: missions.length,
      itemBuilder: (_, i) {
        final mission = missions[i];

        return ItemCard(
          mission: mission,
          routeName: MissionSubmit.routeName,
        );
      },
    );
  }

  Future<Response> _getMissions(int userId) {
    return Dio().get(
        'https://museu-vivo-api.herokuapp.com/missions/public?user_id=$userId');
  }
}
