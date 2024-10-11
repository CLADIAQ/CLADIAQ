import 'package:cladiaq/commons/widgets/buttom_navigation/cq_buttomn_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<RssFeed> fetchRssFeed(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return RssFeed.parse(response.body);
  } else {
    throw Exception('Failed to load RSS feed');
  }
}

List<RssItem> filterEnvironmentalNews(RssFeed feed) {
  final keywords = ['environment', 'climate', 'pollution', 'sustainability'];

  return feed.items!.where((item) {
    final title = item.title?.toLowerCase() ?? '';
    final description = item.description?.toLowerCase() ?? '';

    return keywords.any(
        (keyword) => title.contains(keyword) || description.contains(keyword));
  }).toList();
}

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<RssFeed> rssFeed;

  @override
  void initState() {
    super.initState();
    rssFeed = fetchRssFeed(
        'https://www.jpl.nasa.gov/feeds/news/'); // Replace with the actual RSS URL
  }

  Future<void> _launchUrl(Uri uri) async {
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Environmental News'),
      ),
      body: FutureBuilder<RssFeed>(
        future: rssFeed,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading news'));
          } else {
            final filteredNews = filterEnvironmentalNews(snapshot.data!);

            return ListView.builder(
              itemCount: filteredNews.length,
              itemBuilder: (context, index) {
                final item = filteredNews[index];
                return ListTile(
                  title: Text(item.title ?? ''),
                  subtitle: Text(item.pubDate.toString()),
                  onTap: () {
                    final url = item.link;
                    if (url != null && url.isNotEmpty) {
                      _launchUrl(Uri.parse(url));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("No link available for this article")));
                    }
                  },
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: const CqButtomnNavBar(),
    );
  }
}
