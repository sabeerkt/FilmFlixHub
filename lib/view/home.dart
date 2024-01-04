import 'package:flutter/material.dart';
import 'package:movie/constant/api_key.dart';
import 'package:movie/controller/api_provider.dart';
import 'package:movie/services/api.dart';
import 'package:movie/model/mov_model.dart';
import 'package:movie/widgets/CarouselSlider.dart';
import 'package:movie/widgets/movie_card.dart';
import 'package:movie/widgets/text.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const AnimatedText(),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Color.fromARGB(255, 0, 0, 0)!],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Trending ",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              SizedBox(
                child: FutureBuilder(
                  future: Provider.of<ApiProvider>(context, listen: false)
                      .getMOvies(Constants.trendingurl),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data as List<Movie>;
                      return MyCarouselSlider(
                        data: data,
                        snapshot: snapshot,
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Now Playing",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: FutureBuilder(
                        future: Provider.of<ApiProvider>(context, listen: false)
                            .getMOvies(Constants.nowPlaying),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                snapshot.error.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          } else if (snapshot.hasData) {
                            final data = snapshot.data as List<Movie>;
                            return MovieCard(
                              data: data,
                              snapshot: snapshot,
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const Center(
                child: Text(
                  "Top Rated Movies ",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: FutureBuilder(
                    future: Provider.of<ApiProvider>(context, listen: false)
                        .getMOvies(Constants.toprated),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        final data = snapshot.data as List<Movie>;
                        return MovieCard(
                          data: data,
                          snapshot: snapshot,
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Upcoming Movies ",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: FutureBuilder(
                    future: Provider.of<ApiProvider>(context, listen: false)
                        .getMOvies(Constants.upcoming),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        final data = snapshot.data as List<Movie>;
                        return MovieCard(
                          data: data,
                          snapshot: snapshot,
                        );
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
      ),
    );
  }
}
