import 'package:flutter/material.dart';
import 'package:movie/constant/api_key.dart';
import 'package:movie/model/mov_model.dart';

class DetailPageTv extends StatelessWidget {
  DetailPageTv({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 70,
                width: 70,
                margin: const EdgeInsets.only(top: 16, left: 8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.arrow_back),
              ),
            ),
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.name ?? 'No Title',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  "${Constants.imagepath}${movie.backDropPath}",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Overview",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    movie.overview ?? "No review",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Release Date: ${movie.releaseDate ?? "Unknown"}",
                        style: TextStyle(fontSize: 14),
                      ),
                      Row(
                        children: [
                          Text(
                            "Rating: ",
                            style: TextStyle(fontSize: 14),
                          ),
                          Icon(Icons.star, color: Colors.amber),
                          Text(
                            "${movie.voteAverage?.toStringAsFixed(1)}/10",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
            
          )
        ],
      ),
    );
  }
}
