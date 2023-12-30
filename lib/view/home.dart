import 'package:flutter/material.dart';
import 'package:movie/services/api.dart';
import 'package:movie/model/mov_model.dart';
import 'package:movie/widgets/CarouselSlider.dart';
import 'package:movie/widgets/movie_card.dart';
import 'package:movie/widgets/text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

late Future<List<Movie>> trendingMovie;
late Future<List<Movie>> topRatedMovie;
late Future<List<Movie>> upcomingMovie;

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    trendingMovie = Api().getTrending();
    topRatedMovie = Api().getToprated();
    upcomingMovie = Api().getUpcoming();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AnimatedText(),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Trending ",
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              child: FutureBuilder(
                future: trendingMovie,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    final data = snapshot.data as List<Movie>;
                    return MyCarouselSlider(
                      data: data,
                      snapshot: snapshot,
                    ); // Pass the data to the widget
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text("Top Rated Movies"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: FutureBuilder(
                  future: topRatedMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data as List<Movie>;
                      return MovieCard(
                        data: data,
                        snapshot: snapshot,
                      ); // Pass the data to the widget
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
            const Text("Upcoming Movies"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: FutureBuilder(
                  future: upcomingMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data as List<Movie>;
                      return MovieCard(
                        data: data,
                        snapshot: snapshot,
                      ); // Pass the data to the widget
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
