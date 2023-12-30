import 'package:flutter/material.dart';
import 'package:movie/api/api.dart';
import 'package:movie/model/mov_model.dart';

import 'package:movie/widgets/tv_show.dart';

class tV extends StatefulWidget {
  const tV({super.key});

  @override
  State<tV> createState() => _tVState();
}

late Future<List<Movie>> popullar;
late Future<List<Movie>> topratedTv;
late Future<List<Movie>> airshow;

class _tVState extends State<tV> {
  void initState() {
    super.initState();
    popullar = Api().getpopullar();
    topratedTv = Api().gettopratedTv();
    airshow = Api().getairtvshow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tv"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("popular tv show"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: FutureBuilder(
                  future: popullar,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data as List<Movie>;
                      return tvCard(
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
            const Text("top rated tv show"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: FutureBuilder(
                  future: topratedTv,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data as List<Movie>;
                      return tvCard(
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
            const Text("on the air tv show"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: FutureBuilder(
                  future: airshow,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data as List<Movie>;
                      return tvCard(
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
