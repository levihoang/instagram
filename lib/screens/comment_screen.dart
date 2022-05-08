import 'package:flutter/material.dart';
import 'package:instagramclone/utils/colors.dart';
import 'package:instagramclone/widgets/comment_card.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comments'),
        centerTitle: false,
      ),
      body: const CommentCard(),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://znews-photo.zingcdn.me/w660/Uploaded/wobvjuz/2022_04_29/mv_moi_son_tung_mtp_5_.jpg'),
              radius: 18,
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Comment as username',
                      border: InputBorder.none),
                ),
              ),
            ),
            InkWell(
                onTap: null,
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: const Text(
                      'Post',
                      style: TextStyle(color: Colors.blueAccent),
                    )))
          ]),
        ),
      ),
    );
  }
}
