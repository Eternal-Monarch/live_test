import 'package:flutter/material.dart';

void main() => runApp(NewsFeedApp());

class NewsFeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsFeedScreen(),
    );
  }
}

class NewsFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: NewsFeedList(),
    );
  }
}

class NewsFeedList extends StatelessWidget {
  // Sample news data with thumbnails (replace this with your actual data)
  final List<NewsArticle> newsArticles = [
    NewsArticle(
      title: "Sample News Article 1",
      thumbnailUrl: "https://via.placeholder.com/150",
    ),
    NewsArticle(
      title: "Sample News Article 2",
      thumbnailUrl: "https://via.placeholder.com/150",
    ),
    NewsArticle(
      title: "Sample News Article 3",
      thumbnailUrl: "https://via.placeholder.com/150",
    ),
    NewsArticle(
      title: "Sample News Article 4",
      thumbnailUrl: "https://via.placeholder.com/150",
    ),
    NewsArticle(
      title: "Sample News Article 5",
      thumbnailUrl: "https://via.placeholder.com/150",
    ),
    NewsArticle(
      title: "Sample News Article 6",
      thumbnailUrl: "https://via.placeholder.com/150",
    ),
    // Add more articles here...
  ];

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return ListView(
            children: <Widget>[
              Column(
                children: newsArticles.map((article) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildNewsArticleCard(article, isLandscape: false),
                  );
                }).toList(),
              ),
            ],
          );
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: newsArticles.length,
            itemBuilder: (context, index) {
              return _buildNewsArticleCard(newsArticles[index], isLandscape: true);
            },
          );
        }
      },
    );
  }

  Widget _buildNewsArticleCard(NewsArticle article, {required bool isLandscape}) {
    double boxSize = isLandscape ? 80.0 : 150.0; // Adjust box size based on orientation
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: isLandscape ? 0.0 : 2.0, // Remove elevation for landscape mode
      child: Container(
        height: isLandscape ? null : boxSize, // Set height to null in landscape mode
        width: isLandscape ? null : boxSize, // Set width to null in landscape mode
        child: Stack(
          children: [
            Image.network(
              article.thumbnailUrl,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  article.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsArticle {
  final String title;
  final String thumbnailUrl;

  NewsArticle({required this.title, required this.thumbnailUrl});
}
