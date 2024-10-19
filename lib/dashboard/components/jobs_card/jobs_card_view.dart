import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobCard extends StatelessWidget {
  final String image;
  final String company;
  final String title;
  final String location;
  final String deadline;

  JobCard({
    required this.image,
    required this.company,
    required this.title,
    required this.location,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w, // Slightly narrower to make it more compact
      height: 400.h,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r), // Slightly smaller corner radius
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6.r,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r), // Rounded corners for image
            child: Image.asset(
              image,
              height: 50.h, // Reduced image height for compact design
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            company,
            style: TextStyle(
              fontSize: 13.sp, // Slightly smaller font size
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis, // Handle long company names with ellipsis
            ),
            maxLines: 1,
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 11.sp,
              color: Colors.grey[700],
              overflow: TextOverflow.ellipsis, // Truncate long titles
            ),
            maxLines: 1,
          ),
          SizedBox(height: 4.h),
          // Location Row with Icon
          Row(
            children: [
              Icon(
                Icons.location_on,  // Location icon
                size: 11.sp,
                color: Colors.grey[600],
              ),
              SizedBox(width: 4.w),  // Spacing between icon and text
              Expanded(
                child: Text(
                  location,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,  // Ensure location fits in a single line
                  overflow: TextOverflow.ellipsis,  // Ellipsis for long location names
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Text(
                'Deadline: $deadline',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.red[400],
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,  // Location icon
                size: 13.sp,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
