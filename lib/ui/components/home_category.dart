import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:podcast_search/podcast_search.dart';
import 'package:pods_only/core/services/podcast_service.dart';

import '../screens/temp_api_ui.dart';

class HomeCategory extends StatelessWidget {
  final String mainTitle;
  final String subTitle;
  final buttonFunction;
  final double imageHeight;
  final double imageWidth;
  final Color containerColor;
  final double containerHeight;
  final bool isHorizontalLine;
  final String genre;
  const HomeCategory({
    super.key,
    required this.mainTitle,
    this.subTitle = '',
    required this.buttonFunction,
    required this.imageHeight,
    required this.imageWidth,
    required this.containerHeight,
    required this.containerColor,
    this.isHorizontalLine = false, 
     this.genre = '', 
  });

  @override
  Widget build(BuildContext context) {
    // print('this na the ${genre}---->>>>');
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    mainTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                        color: Color.fromARGB(255, 165, 161, 161),
                        fontSize: subTitle.isEmpty ? 0 : 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              InkWell(
    
                child: const Text(
                  'See All',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TempAPIUI()));
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<SearchResult>(
            future: PodcastService().fetchPodcast(genre: genre ),
            builder:
                (BuildContext context, AsyncSnapshot<SearchResult> snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: containerHeight,
                  //  250,
                  color: containerColor,
                  // color: Color.fromARGB(96, 38, 36, 36),
                  child: ListView.separated(
                    itemCount: snapshot.data?.resultCount ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final items = snapshot.data?.items;
                      final item = items?[index];

                      return Container(
                        height: imageHeight,
                        // 180,
                        width: imageWidth,
                        // 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                '${item?.artworkUrl600}',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              index == 0
                                  ? '...RECENTLY FOLLOWED'
                                  : 'RECENTLY FOLLOWED',
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 165, 161, 161),
                                  fontSize: (isHorizontalLine == false) ? 9 : 0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.6),
                            ),
                            SizedBox(
                              height: (isHorizontalLine == false) ? 3 : 0,
                            ),
                            Text(
                              (isHorizontalLine == false)
                                  ? '${item?.trackName}'
                                  : '${item?.primaryGenreName}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              (isHorizontalLine == false)
                                  ? ('${item?.artistName} - ${item?.collectionCensoredName}')
                                  : '${item?.artistName}',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                  ),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                    child:  Text('Opps!!! something went wrong'));
              }
              return const Center(child: CircularProgressIndicator());
            }),
        SizedBox(
          height: (isHorizontalLine == false) ? 0 : 5,
        ),
        (isHorizontalLine == true)
            ? const Divider(
                color: Colors.grey,
                thickness: 0.2,
              )
            : const SizedBox(
                height: 0,
              ),
      ],
    );
  }
}
