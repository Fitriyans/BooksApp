import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:e_book_app_ui/json/home_json.dart';
import 'package:e_book_app_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BookDetailPage extends StatefulWidget {
  final String img;
  final String title;
  final String subTitle;
  final String price;
  final String page;
  final String authorName;
  final String rate;
  final String desc;
  const BookDetailPage(
      {Key? key,
      required this.img,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.page,
      required this.authorName,
      required this.rate,
      required this.desc})
      : super(key: key);

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: getAppBar(), preferredSize: Size.fromHeight(130)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: white,
      flexibleSpace: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.img), fit: BoxFit.cover)),
          ),
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(color: black.withOpacity(0.2)),
          ),
          Container(
            width: double.infinity,
            height: 180,
            child: Stack(
              children: [
                BlurryContainer(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios,
                                  size: 22, color: white)),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.bookmark, color: white)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.headphones, color: white)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.settings, color: white)),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: white),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              widget.subTitle,
                              style: TextStyle(fontSize: 15, color: white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 10,
        ),
        getFirstSection(),
        SizedBox(
          height: 30,
        ),
        getSecondSection()
      ]),
    );
  }

  Widget getFirstSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "\$" + widget.price,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "Price",
              style: TextStyle(fontSize: 14, color: black.withOpacity(0.5)),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              widget.page,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "Pages",
              style: TextStyle(fontSize: 14, color: black.withOpacity(0.5)),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              widget.rate,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "Rating",
              style: TextStyle(fontSize: 14, color: black.withOpacity(0.5)),
            ),
          ],
        )
      ],
    );
  }

  Widget getSecondSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          widget.desc,
          style: TextStyle(
              fontSize: 15,
              height: 1.5,
              fontWeight: FontWeight.w500,
              color: black),
        ),
        SizedBox(
          height: 15,
        ),
        Wrap(
          runSpacing: 10,
          children: List.generate(storeTags.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: storeTags[index]['color'],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: Text(
                      storeTags[index]['label'],
                      style: TextStyle(fontSize: 12, color: white),
                    )),
              ),
            );
          }),
        ),
      ],
    );
  }
}
