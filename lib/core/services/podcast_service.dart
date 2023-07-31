import 'package:podcast_search/podcast_search.dart';

class PodcastService {
  Future<SearchResult>  fetchPodcast({ String genre = ''} ) async {
    final search = Search();
    final results = await search.charts(
        country: Country.unitedKingdom, 
        limit: 10,
        genre: genre ,
        explicit: true
        );
    return results;
  }
}
