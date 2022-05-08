import 'package:flutter/material.dart';
import 'package:instagramclone/utils/colors.dart';
import 'package:intl/intl.dart';

import 'like_animation_widget.dart';

class PostCard extends StatefulWidget {
  final snap;
  const PostCard({Key? key, required this.snap}) : super(key: key);

  static const String defaultAvtUrl =
      'https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg';

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  bool isHeartAnimating = false;
  @override
  Widget build(BuildContext context) {
    final icon = isLiked ? Icons.favorite : Icons.favorite_outline;
    final hearIconColor = isLiked ? Colors.red : Colors.white;
    return Container(
        color: mobileBackgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                  .copyWith(right: 0),
              // ignore: prefer_const_literals_to_create_immutables
              child: Row(children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      widget.snap["profImage"] ?? PostCard.defaultAvtUrl),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.snap['username'],
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                )),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: ListView(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shrinkWrap: true,
                                  children: ['Delete']
                                      .map((e) => InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 16),
                                              child: Text(e),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ));
                    },
                    icon: const Icon(Icons.more_vert)),
              ]),
            ),
            GestureDetector(
              child: Stack(alignment: Alignment.center, children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Image.network(
                    widget.snap["postUrl"],
                    fit: BoxFit.cover,
                  ),
                ),
                AnimatedOpacity(
                  opacity: isHeartAnimating ? 1 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: LikeAnimation(
                    isAnimating: isHeartAnimating,
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 100,
                    ),
                    duration: const Duration(microseconds: 400),
                    onEnd: () => setState(() {
                      isHeartAnimating = false;
                      isLiked = true;
                    }),
                  ),
                )
              ]),
              onDoubleTap: () {
                setState(() {
                  isHeartAnimating = true;
                  isLiked = true;
                });
              },
            ),

            // LIKE COMMENT SECTION
            Row(
              children: [
                LikeAnimation(
                  isAnimating: isLiked,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      icon: Icon(icon, color: hearIconColor)),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.comment_outlined,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                    )),
                const Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        icon: Icon(Icons.bookmark_border), onPressed: null),
                  ),
                )
              ],
            )

            // DESCRIPTION
            ,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w800),
                    child: Text(
                      "${widget.snap['likes'].length} likes",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 8),
                    child: RichText(
                      text: TextSpan(
                          style: const TextStyle(color: primaryColor),
                          children: [
                            TextSpan(
                                text: widget.snap['username'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const TextSpan(text: ' '),
                            TextSpan(
                              text: widget.snap['description'],
                            ),
                          ]),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: const Text(
                          'View all 211 comments',
                          style: TextStyle(fontSize: 16, color: secondaryColor),
                        )),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        DateFormat.yMMMd().format(
                          widget.snap['datePublished'].toDate(),
                        ),
                        style: const TextStyle(
                            fontSize: 16, color: secondaryColor),
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
