import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:podcast_search/podcast_search.dart';
import 'package:pods_only/core/services/podcast_service.dart';

class PlaySect extends StatelessWidget {
  const PlaySect({super.key});

  @override
  Widget build(BuildContext context) {
    return   FutureBuilder<SearchResult>(
      future: PodcastService().fetchPodcast(),
      builder: (BuildContext context, AsyncSnapshot<SearchResult> snapshot) { 
              if(snapshot.hasData){
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      // height: 380,
                      // color: Colors.amber,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data?.items.length,
                        shrinkWrap: true,
                        itemBuilder:  (BuildContext context, int index) {
                          print('${snapshot.data?.items}---->>>>>>>>>>>>>>>>>>>');
                          print('-------${snapshot.data}---->>>>>>>>>>>>>>>>>>>');
                          final items = snapshot.data?.items.reversed.toList();
                           final item = items?[index];
                          
                        return  Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                          
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  // color: Colors.grey,
                                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        '${item?.artworkUrl600}',
                        fit: BoxFit.cover,
                      ),
                                  ),
                                ),
                               const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                                        const Text('5D AGO',
                                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600),
                                      ),
                                                    const    SizedBox(
                                                          height: 4,
                                                        ),
                                                       Text(
                                                          item?.trackName ?? '',
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 17,
                                                              fontWeight: FontWeight.w600),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            InkWell(
                                                              onTap: (){
                                                                print('play');
                                                              },
                                                              child: Row(
                                                                children: const[
                                                                  Icon(Icons.play_circle_outline_rounded,
                                                                  size: 25,
                                                                  color: Colors.deepPurple,),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    'data',
                                                                    style: TextStyle(
                                                                      fontSize: 15,
                                                                        color: Color.fromARGB(255, 177, 139, 244)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                              
                                                        Icon(Icons.more_horiz_outlined,
                                                        size: 20,
                                                        color: Colors.deepPurple,)
                                                          ],
                                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            
                          //  ( items!.length - 1 ) == 2 ?  
                          //   Container(
                          //     height: 20,
                          //     color: Colors.red,
                          //   ):
                            SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 0.2,
                            )
                          ],
                        );
                       
                       
                      }
                      
                        ),
                    ),
                  ],
                );
              }
               if (snapshot.hasError) {
                return const Center(
                    child:  Text('Opps!!! something went wrong'));
              }
              return Center(
                child: CircularProgressIndicator(),
              );
             },

            );
    
   
  }



}