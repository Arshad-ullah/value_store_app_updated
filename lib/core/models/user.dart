import 'package:flutter/material.dart';

UserDetails? userDetails;

class UserDetails {
  final String username;
  final String email;
  final String userDocid;
  final String userUid;
  final bool storiesLocked;
  final List likedStories;

  UserDetails(
      {required this.email,
      required this.userDocid,
      required this.userUid,
      required this.username,
      required this.likedStories,
      required this.storiesLocked});
}
