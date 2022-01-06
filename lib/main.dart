import 'package:flutter/material.dart';
import 'utils/text.dart';
import 'widgets/trending.dart';
import 'widgets/toprated.dart';
import 'widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '698e3b68c9e5c578d44239bd3271487d';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2OThlM2I2OGM5ZTVjNTc4ZDQ0MjM5YmQzMjcxNDg3ZCIsInN1YiI6IjYxZDQxMjgyZTE5NGIwMDA4Y2Y0ZmIyNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Xs7BDmqffszMeotBXQCoPnZoTcNPJfgmBAKc3dKvxLk';
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
              child:
                  modified_text(text: 'Cnema', color: Colors.white, size: 40)),
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: [
            TrendingMovies(
              trending: trendingmovies,
            ),
            Tvs(trending: tv),
            Topratedmovies(trending: topratedmovies),
          ],
        ));
  }
}
