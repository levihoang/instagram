import 'package:flutter/material.dart';
import 'package:instagramclone/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      "https://image.thanhnien.vn/w1024/Uploaded/2022/znetns/2022_04_29/son-tung-1-4956.jpg"),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(' sontungmtp',
                          style: TextStyle(fontWeight: FontWeight.bold))
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Image.network(
                "https://image.thanhnien.vn/w1024/Uploaded/2022/znetns/2022_04_29/son-tung-1-4956.jpg",
                fit: BoxFit.cover,
              ),
            ),

            // LIKE COMMENT SECTION
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.comment_outlined,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: Colors.red,
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
                      '1,231 likes',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 8),
                    child: RichText(
                      text: const TextSpan(
                          style: TextStyle(color: primaryColor),
                          children: [
                            TextSpan(
                                text: 'G Dragon',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' '),
                            TextSpan(
                              text:
                                  'Bigbang is still the greatest group in performing live',
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
                      child: const Text(
                        '12/11/2001',
                        style: TextStyle(fontSize: 16, color: secondaryColor),
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
