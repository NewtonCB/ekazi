// lib/pages/dashboard.dart
import 'package:ekazi/dashboard/components/swiper_adds/swiper_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/app_bar/app_bar_view.dart';
import '../components/category_tabs/categort_tabs_view.dart';
import '../components/jobs_card/jobs_horizontal_scroll.dart';
import '../components/search_input/search_input_view.dart';
import 'package:ekazi/dashboard/components/titles/posted_jobs.dart';
import 'package:ekazi/dashboard/components/titles/candidates.dart';
import 'package:ekazi/dashboard/components/navigation_bottom/nav_bottom_view.dart';
import 'package:ekazi/dashboard/components/featured_candidates/candidates_view.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchInput(),
            SingleChildScrollView(
              child:Column(
                children: [
                  CategoryTabs(),
                  SwiperSection(),
                  SizedBox(height: 10.sp),
                  PostedJobs(),
                  SizedBox(height: 10.sp),
                  JobHorizontalScroll(),  // Dynamically filtered job cards
                  SizedBox(height: 15.sp),
                  FeaturedCandidates(),
                  SizedBox(height: 15.sp),
                  CandidateListView()
                ],
              )
            ),
        
          ],
        ),
      ),
      bottomNavigationBar: BottomNavView(),
    );
  }
}
