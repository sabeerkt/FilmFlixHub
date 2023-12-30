import 'package:flutter/material.dart';
import 'package:movie/constant/api_key.dart';
import 'package:movie/model/mov_model.dart';

import 'package:movie/view/detail_tv.dart';

class tvCard extends StatelessWidget {
  tvCard({super.key, required this.snapshot, required List<Movie> data});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          // Add spacing between containers
          const double containerSpacing = 10;

          return SizedBox(
            height: 200,
            width: 200 + containerSpacing, // Add spacing to the width
            child: Padding(
              padding: const EdgeInsets.only(
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 200,
                        child: Container(
                          child: Image.network(
                            "${Constants.imagepath}${snapshot.data[index].posterPath}",
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: Center(
                          child: Text(
                            snapshot.data[index].name, // Add movie name here
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
