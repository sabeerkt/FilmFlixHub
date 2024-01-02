import 'package:flutter/material.dart';
import 'package:movie/constant/api_key.dart';
import 'package:movie/controller/api_provider.dart';

import 'package:movie/model/mov_model.dart';
import 'package:movie/widgets/tv_show.dart';
import 'package:provider/provider.dart';

class tV extends StatelessWidget {
  const tV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Tv",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, const Color.fromARGB(255, 0, 0, 0)!],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Popular TV Shows ",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: FutureBuilder(
                    future: Provider.of<ApiProvider>(context, listen: false)
                        .getMOvies(Constants.popullar),
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
                        return TvCard(
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
                  "Top Rated TV Shows ",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: FutureBuilder(
                    future: Provider.of<ApiProvider>(context, listen: false)
                        .getMOvies(Constants.topratedTv),
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
                        return TvCard(
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
                  "On the Air TV Shows ",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: FutureBuilder(
                    future: Provider.of<ApiProvider>(context, listen: false)
                        .getMOvies(Constants.airtvshow),
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
                        return TvCard(
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
