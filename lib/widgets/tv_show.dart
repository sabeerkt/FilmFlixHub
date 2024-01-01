import 'package:flutter/material.dart';
import 'package:movie/constant/api_key.dart';
import 'package:movie/model/mov_model.dart';
import 'package:movie/view/detail_tv.dart';

class TvCard extends StatelessWidget {
  TvCard({super.key, required this.snapshot, required List<Movie> data});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          // Add spacing between containers
          const double containerSpacing = 10;

          return SizedBox(
            width: 200 + containerSpacing, // Add spacing to the width
            child: Padding(
              padding: EdgeInsets.only(
                  right: containerSpacing), // Add spacing to the right
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPageTv(
                        movie: snapshot.data[index],
                      ),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.network(
                            "${Constants.imagepath}${snapshot.data[index].posterPath}",
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            snapshot.data[index].name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
