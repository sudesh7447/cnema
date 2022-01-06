import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cnema/utils/text.dart';
import 'package:cnema/Desc.dart';

class Tvs extends StatelessWidget {
  final List trending;

  const Tvs({Key? key, required this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Popular Tv Shows',
            color: Colors.white,
            size: 26,
          ),
          SizedBox(height: 10),
          Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Desc(
                                      name: trending[index]['original_name'] !=
                                              null
                                          ? trending[index]['original_name']
                                          : 'title',
                                      banner:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['backdrop_path'],
                                      posteru:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path'],
                                      descr: trending[index]['overview'],
                                      vote: trending[index]['vote_average']
                                          .toString(),
                                      launch: trending[index]['first_air_date'],
                                    )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 250,
                        child: Column(
                          children: [
                            Container(
                              width: 250,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path']),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modified_text(
                                  size: 15,
                                  color: Colors.white,
                                  text: trending[index]['original_name'] != null
                                      ? trending[index]['original_name']
                                      : ''),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
