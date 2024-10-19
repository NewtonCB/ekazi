// lib/widgets/job_horizontal_scroll.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'jobs_card_view.dart';
import 'jobs_controller.dart';

class JobHorizontalScroll extends StatelessWidget {
  final JobController jobController = Get.find<JobController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: jobController.filteredJobs.length,
        itemBuilder: (context, index) {
          var job = jobController.filteredJobs[index];
          return JobCard(
            image: job['image']!,
            company: job['company']!,
            title: job['title']!,
            location: job['location']!,
            deadline: job['deadline']!,
          );
        },
      ),
    ));
  }
}
