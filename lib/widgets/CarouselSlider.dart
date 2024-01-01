import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/constant/api_key.dart';
import 'package:movie/model/mov_model.dart';
import 'package:movie/view/detail.dart';

class MyCarouselSlider extends StatelessWidget {
  const MyCarouselSlider({
    Key? key,
    required this.data,
    required this.snapshot,
  }) : super(key: key);

  final List<Movie> data;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    movie: snapshot.data[index],
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 250,
                width: 180,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6.0,
                      offset: const Offset(0.0, 2.0),
                    ),
                  ],
                ),
                child: Image.network(
                  "${Constants.imagepath}${snapshot.data[index].posterPath}",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.5,
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayAnimationDuration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
