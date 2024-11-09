import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/helper/mySize.dart';
import '../../cores/helper/theme_helper.dart';
import 'package:social_services/features/home/components/profile_container.dart';

var currentUserIdGlobal = FirebaseAuth.instance.currentUser!.uid;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Sample post data (This would typically be fetched from Firebase or API)
  final List<Map<String, String>> posts = [
    {
      'image': 'https://via.placeholder.com/600x400', // Post image URL
      'caption': 'This is a sample caption for the post.',
      'profileImage': 'https://via.placeholder.com/150', // Profile image URL
      'username': 'johndoe',
    },
    {
      'image': 'https://via.placeholder.com/600x400',
      'caption': 'Another beautiful post. #nature',
      'profileImage': 'https://via.placeholder.com/150',
      'username': 'janedoe',
    },
    // More posts can be added here...
  ];

  @override
  void initState() {
    debugPrint("Home init called");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MySize.size20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Profile Header
              SizedBox(height: MySize.size80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MySize.size200,
                    child: "Good Morning! Jane"
                        .text
                        .size(MySize.size24)
                        .color(ThemeColors.black)
                        .textStyle(GoogleFonts.nunitoSans())
                        .fontWeight(FontWeight.w500)
                        .make(),
                  ),
                  const ProfileContainer(
                    hasActiveStory: true,
                    profileImageUrl:
                        "https://media.istockphoto.com/id/614409740/photo/to-stay-productive-you-need-to-stay-persistent.jpg?s=1024x1024&w=is&k=20&c=qJ-VC4p8iM53pANOg6YxUENJ0igRVNOR2MpqK_9_9Cs=",
                  ),
                ],
              ),
              SizedBox(height: MySize.size32),

              // Feed Posts Section
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Post Header (User Profile Image and Username)
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(post['profileImage']!),
                            radius: MySize.size20,
                          ),
                          SizedBox(width: MySize.size10),
                          Text(
                            post['username']!,
                            style: GoogleFonts.nunitoSans().copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: MySize.size16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MySize.size10),

                      // Post Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(MySize.size12),
                        child: Image.network(
                          post['image']!,
                          width: double.infinity,
                          height: MySize.size350,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: MySize.size10),

                      // Post Caption
                      Text(
                        post['caption']!,
                        style: GoogleFonts.nunitoSans().copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: MySize.size14,
                        ),
                      ),
                      SizedBox(height: MySize.size15),

                      // Interaction Buttons (Like, Comment, Share)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.favorite_border,
                                    size: MySize.size24),
                                onPressed: () {
                                  // Handle like functionality
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.comment_outlined,
                                    size: MySize.size24),
                                onPressed: () {
                                  // Handle comment functionality
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.share_outlined,
                                    size: MySize.size24),
                                onPressed: () {
                                  // Handle share functionality
                                },
                              ),
                            ],
                          ),
                          // More options button
                          IconButton(
                            icon: Icon(Icons.more_vert, size: MySize.size24),
                            onPressed: () {
                              // Handle more options (edit, delete, etc.)
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: MySize.size20),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
