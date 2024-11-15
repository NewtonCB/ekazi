// // model/candidate.dart
// class Candidate {
//   final String name;
//   final String profilePicture;
//   final String position;
//   final String location;
//
//   Candidate({
//     required this.name,
//     required this.profilePicture,
//     required this.position,
//     required this.location,
//   });
// }
import 'dart:ui';

const linkedInBlue0077B5 = Color(0xFF0077B5);
const linkedInBlack000000 = Color(0xFF000000);
const linkedInWhiteFFFFFF = Color(0xFFFFFFFF);
const linkedInDarkGrey313335 = Color.fromRGBO(49, 51, 53, 1);
const linkedInMediumGrey86888A = Color.fromRGBO(86, 86, 91, 1.0);
const linkedInLightGreyCACCCE = Color.fromRGBO(202, 204, 206, 1);

class NetworkEntity {

  final String? userBgImage;
  final String? userProfileImage;
  final String? username;
  final String? userBio;
  final num? mutualConnections;

  NetworkEntity(
      {this.userBgImage,
        this.userProfileImage,
        this.username,
        this.userBio,
        this.mutualConnections});

  static List<NetworkEntity> networkData = [

    NetworkEntity(
      userBgImage: "bg_image_1.jpeg",
      userProfileImage: "profile_2.jpeg",
      mutualConnections: 13,
      userBio: "Flutter Developer & Advocate",
      username: "John Doe",
    ),

    NetworkEntity(
      userBgImage: "bg_image_2.png",
      userProfileImage: "profile_1.jpeg",
      mutualConnections: 22,
      userBio: "Senior Software Engineer",
      username: "Carig C. Watson",
    ),

    NetworkEntity(
      userBgImage: "bg_image_1.jpeg",
      userProfileImage: "profile_2.jpeg",
      mutualConnections: 52,
      userBio: "UX/UI Researcher & Designer",
      username: "Diana Joe",
    ),

    NetworkEntity(
      userBgImage: "bg_image_3.jpeg",
      userProfileImage: "profile_1.jpeg",
      mutualConnections: 13,
      userBio: "Android Developer at Google",
      username: "Stephan Covey",
    ),

    NetworkEntity(
      userBgImage: "bg_image_1.jpeg",
      userProfileImage: "profile_2.jpeg",
      mutualConnections: 88,
      userBio: "Flutter Developer & Advocate",
      username: "Elon Musk",
    ),

    NetworkEntity(
      userBgImage: "bg_image_2.png",
      userProfileImage: "profile_1.jpeg",
      mutualConnections: 11,
      userBio: "Flutter Developer & Advocate",
      username: "Robert Frost",
    ),

    NetworkEntity(
      userBgImage: "bg_image_3.jpeg",
      userProfileImage: "profile_2.jpeg",
      mutualConnections: 13,
      userBio: "Flutter Developer & Advocate",
      username: "Steve Wozniak",
    ),

    NetworkEntity(
      userBgImage: "bg_image_3.jpeg",
      userProfileImage: "profile_1.jpeg",
      mutualConnections: 76,
      userBio: "Flutter Developer & Advocate",
      username: "Doug Stevenson",
    ),
  ];

}