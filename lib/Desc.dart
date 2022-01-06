import 'package:cnema/utils/text.dart';
import 'package:flutter/material.dart';

class Desc extends StatelessWidget {
  final String name, descr, posteru, vote, launch, banner;
  const Desc(
      {Key? key,
      required this.name,
      required this.descr,
      required this.launch,
      required this.posteru,
      required this.vote,
      required this.banner})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      banner,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: modified_text(
                      size: 20,
                      color: Colors.white,
                      text: '⭐ Average rating - $vote ',
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: modified_text(
              text: name != null ? name : 'title',
              size: 25,
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: modified_text(
              text: 'releasing on - $launch',
              size: 14,
              color: Colors.white,
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posteru),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: modified_text(
                      text: descr,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
