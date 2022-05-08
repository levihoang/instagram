import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({Key? key}) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: Row(children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://znews-photo.zingcdn.me/w660/Uploaded/wobvjuz/2022_04_29/mv_moi_son_tung_mtp_5_.jpg'),
          radius: 18,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: 'username',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: ' some description to insert',
                    ),
                  ])),
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      '23/12/21',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  )
                ]),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.favorite,
            size: 16,
          ),
        )
      ]),
    );
  }
}
