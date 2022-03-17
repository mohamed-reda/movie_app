import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/movies/get_movies_list.dart';

class BuildCard extends StatelessWidget {
  final BuildContext context;
  final List<Results> model;
  final ScrollController controller;

  const BuildCard(
      {Key? key,
      required this.context,
      required this.model,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: model.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Movie title : ${model[index].originalTitle}"),
                  // Text(": ${model[index].toJson()}"),
                  SizedBox(
                    height: 400,
                    // width: ,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500${model[index].posterPath}",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              colorFilter: const ColorFilter.mode(
                                  Colors.red, BlendMode.colorBurn)),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
