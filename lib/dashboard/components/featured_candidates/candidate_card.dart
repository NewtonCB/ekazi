import 'package:flutter/material.dart';
import 'package:ekazi/dashboard/components/featured_candidates/candidates_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleNetworkUserWidget extends StatefulWidget {
  final NetworkEntity network;
  const SingleNetworkUserWidget({Key? key, required this.network}) : super(key: key);


  @override
  State<SingleNetworkUserWidget> createState() => _SingleNetworkUserWidgetState();
}

class _SingleNetworkUserWidgetState extends State<SingleNetworkUserWidget> {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min, // Limits card height to fit content tightly
            children: [
              Container(
                width: double.infinity,
                height: 60.h, // Reduced height for compact image
                decoration: const BoxDecoration(color: Colors.grey),
                child: Image.asset("assets/${widget.network.userBgImage}", fit: BoxFit.cover),
              ),
              const SizedBox(height: 40), // Space for profile image
              Text(
                "${ widget.network.username}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 3),
              Text(
                "${widget.network.userBio}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10.sp, color: Colors.grey[600]),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.group, size: 12.sp),
                  const SizedBox(width: 5),
                  Text(
                    "${widget.network.mutualConnections} mutual connections",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 9.sp, color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: 60.w,
                height: 20.h, // Compact button height
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Connect",
                    style: TextStyle(fontSize: 10.sp, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 20.h, // Position profile image
            left: (120.w - 60.w) / 2, // Center horizontally within card
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset("assets/${widget.network.userProfileImage}", fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
