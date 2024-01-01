import 'package:flutter/material.dart';
import 'package:movie/constant/api_key.dart';
import 'package:movie/controller/search_provider.dart';
import 'package:movie/view/detail.dart';

import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final searchcontroller = Provider.of<SearchProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    searchcontroller.searchMovies(value);
                  },
                  style: const TextStyle(color: Colors.white),
                  controller: searchcontroller.queryController,
                  decoration: InputDecoration(
                    hintText: 'Search ',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 900,
                child: searchcontroller.searchResults.isEmpty
                    ? const Center(
                        child: Text(
                          'Search Anything',
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : GridView.builder(
                        itemCount: searchcontroller.searchResults.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                crossAxisCount: 3,
                                childAspectRatio: 1 / 1.4),
                        itemBuilder: (context, index) {
                          final searchdata =
                              searchcontroller.searchResults[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        movie: searchdata,
                                      )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${Constants.imagepath}${searchdata.posterPath}"),
                                        fit: BoxFit.fill,
                                        filterQuality: FilterQuality.high),
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          );
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
