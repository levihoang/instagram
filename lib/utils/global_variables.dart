import 'package:flutter/material.dart';
import 'package:instagramclone/screens/add_post_screen.dart';
import 'package:instagramclone/screens/feed_screen.dart';
import 'package:instagramclone/screens/search_screen.dart';
import 'package:instagramclone/screens/temp_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text('notif'),
  Temp()
];
