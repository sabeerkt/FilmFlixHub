// show.dart
import 'package:flutter/material.dart';
import 'package:movie/services/api.dart';
import 'package:movie/model/mov_model.dart';
import 'package:movie/widgets/show_card.dart';

class ShowPage extends StatefulWidget {
  ShowPage({Key? key}) : super(key: key);

  @override
  State<ShowPage> createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  late Future<List<Movie>> show;

  @override
  void initState() {
    super.initState();
    show = Api().getTrending();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Show")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Popular TV Shows"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: FutureBuilder(
                  future: show,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data as List<Movie>;
                      return ShowCard(
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
