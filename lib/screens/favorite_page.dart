import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  // Define a list of favorite items
  final List<String> _favoriteItems = [
    "https://picsum.photos/id/10/200/200",
    "https://picsum.photos/id/1015/200/200",
    "https://picsum.photos/id/50/200/200",
    "https://picsum.photos/id/70/200/200",
    'https://picsum.photos/id/1045/200/200',
    'https://picsum.photos/id/1055/200/200',
    'https://picsum.photos/id/1065/200/200',
    "https://picsum.photos/id/100/200/200"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        itemCount: _favoriteItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Navigate to details page or do something with the selected item
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(_favoriteItems[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
