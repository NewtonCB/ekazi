// view/candidate_list_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'candidates_controller.dart';

class CandidateListView extends StatelessWidget {
  final CandidateController candidateController = Get.put(CandidateController());

  @override
  Widget build(BuildContext context) {
        // Use Obx to listen for changes in the candidates list
        return Container(
          // padding: EdgeInsets.only(bottom: 10),
          margin: EdgeInsets.only(bottom: 20),
          height: 120.h, // Define a fixed height for the horizontal list
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: candidateController.candidates.length,
              itemBuilder: (context, index) {
                final candidate = candidateController.candidates[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                 decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(candidate.profilePicture),fit: BoxFit.cover),
                   border: Border.all(
                     color: Color(0xffbd6325)
                   ),
                   borderRadius: BorderRadius.circular(10)
                   // boxShadow: [
                   //   BoxShadow(
                   //     color: Colors.black,
                   //     blurRadius: 1.4
                   //       ,spreadRadius: .3
                   //   )
                   // ]
                 ),
                  child: Column(
mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          
                        ),
                        child: Column(
                          children: [
                            Text(candidate.name),
                            Text(candidate.position),
                            Text(candidate.location)
                          ],
                        ),
                      )
                    ],
                  ),
                  width: 150.w,
                );
                // return Container(
                //   width: 100.w, // Set a width for each card
                //   height: 300.h,
                //   margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.black26,
                //         blurRadius: 4,
                //         offset: Offset(0, 2),
                //       ),
                //     ],
                //   ),
                //   child: Column(
                //     children: [
                //       ClipRRect(
                //         borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                //         child: Image.asset(
                //           candidate.profilePicture,
                //           height: 50, // Set the height of the profile picture
                //           width: double.infinity,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               candidate.name,
                //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                //             ),
                //             SizedBox(height: 4),
                //             Text(
                //               candidate.position,
                //               style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                //             ),
                //             SizedBox(height: 4),
                //             Row(
                //               children: [
                //                 Icon(Icons.location_on, size: 16, color: Colors.grey[700]),
                //                 SizedBox(width: 4),
                //                 Text(
                //                   candidate.location,
                //                   style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // );
              },
            ),
          ),
        );
  }
}
