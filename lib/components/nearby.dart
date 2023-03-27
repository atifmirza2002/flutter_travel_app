import 'package:flutter/material.dart';
import '../constants/data.dart';
import './nearby_card.dart';
class TopNearby extends StatefulWidget {

  final Map<String, dynamic> nearby;
  const TopNearby({Key? key, required this.nearby}) : super(key: key);

  @override
  State<TopNearby> createState() => _TopNearbyState();
}

class _TopNearbyState extends State<TopNearby> {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: nearbyData.map((item) => NearbyCard(nearby: item)).toList(),
    );
  }
}
