import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'candidates_model.dart';
import 'candidate_card.dart';

class CandidateListView extends StatelessWidget {
  final List<NetworkEntity> networkData = NetworkEntity.networkData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h), // Reduced margin for compact spacing
      height: 180.h, // Smaller height for compact layout
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: networkData.length,
        itemBuilder: (context, index) {
          final network = networkData[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w), // Compact spacing between cards
            child: SizedBox(
              width: 120.w, // Compact width to reduce card size
              child: SingleNetworkUserWidget(network: network),
            ),
          );
        },
      ),
    );
  }
}
