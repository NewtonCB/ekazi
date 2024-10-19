import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FeaturedCandidates extends StatelessWidget {
  const FeaturedCandidates({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(FeedController()); // Ensure FeedController is available
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              'Featured candidates',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color:  Color(0xFF195198),
              ),
            ),
            TextButton(
              onPressed: () {
                // Get.to(() =>  FeedPage());
              },
              child:  Text(
                  'see more',
                style: TextStyle(
                  fontSize: 12.sp,
                  // color:  Color(0xFF195198),
                  color: Colors.black54
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
