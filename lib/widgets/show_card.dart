// movie.dart
import 'package:flutter/material.dart';
import 'package:movie/constant/api_key.dart';
import 'package:movie/model/mov_model.dart';
import 'package:movie/view/detail.dart';

class ShowCard extends StatelessWidget {
  const ShowCard({Key? key, required this.snapshot, required List<Movie> data})
      : super(key: key);

  final AsyncSnapshot<List<Movie>> snapshot;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height, // Set a fixed height
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      movie: snapshot.data![index],
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: Image.network(
                          "${Constants.imagepath}${snapshot.data![index].posterPath}",
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data![index].title ?? 'No Title',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 16,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Release Date: ${snapshot.data![index].releaseDate ?? 'No Date'}',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.amber,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Rating: ${snapshot.data![index].voteAverage ?? 'No Rating'}',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.amber),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
