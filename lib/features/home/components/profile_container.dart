import 'package:flutter/material.dart';
import 'package:social_services/cores/helper/theme_helper.dart';

import '../../../cores/helper/mySize.dart';

class ProfileContainer extends StatelessWidget {
  final String profileImageUrl;
  final bool hasActiveStory;
  final double size;

  const ProfileContainer({
    super.key,
    required this.profileImageUrl,
    this.hasActiveStory = false,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(MySize.size2),
          decoration: BoxDecoration(
              border: Border.all(color: ThemeColors.tertiaryBlue),
              shape: BoxShape.circle),
          child: CircleAvatar(
            radius: size / 2,
            backgroundImage: NetworkImage(profileImageUrl),
          ),
        ),
      ],
    );
  }
}
