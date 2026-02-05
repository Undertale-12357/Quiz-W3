import 'dart:convert';

import 'package:flutter/material.dart';
import 'joke.dart';

Color appColor = Colors.green[300] as Color;

class Ex4 extends StatefulWidget
{
  const Ex4 ({super.key});

  @override
  State<Ex4> createState() => _Ex4State();
}

class _Ex4State extends State<Ex4> {

  int favIndex = -1;

  void onFavClick(int index)
  {
    setState(() {
      if (favIndex == index)
      {
        favIndex = -1;
      }
      else
      {
        favIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: ListView(
          children: [
            ...allJokes.asMap().entries.map((entry) {
              final index = entry.key;
              final joke = entry.value;
              final isCurrentFav = index == favIndex;

              return FavoriteCard(
                joke: joke,
                isFav: isCurrentFav,
                onFavClick: () => onFavClick(index),
              );
            }).toList(),
          ],
        ),
      );
  }
}

class FavoriteCard extends StatelessWidget {
  final Joke joke;
  final bool isFav;
  final VoidCallback onFavClick;

  const FavoriteCard({
    super.key,
    required this.joke,
    required this.isFav,
    required this.onFavClick,
  });

  // void onFavoriteClick() {
  //   setState(() {
  //     _isFavorite = !_isFavorite;
  //   });
  // }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description)
              ],
            ),
          ),
          IconButton(
              onPressed: onFavClick,
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}
