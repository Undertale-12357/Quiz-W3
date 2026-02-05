import 'package:flutter/material.dart';

class FavoriteCard extends StatefulWidget
{
  const FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;
  Icon favIcon = Icon(Icons.favorite, color: Colors.red,);
  void changeStatusCard()
  {
    setState(() {
      if(isFavorite)
      {
        isFavorite = false;
        favIcon = Icon(Icons.favorite, color: Colors.red,);
      }
      else
      {
        isFavorite = true;
        favIcon = Icon(Icons.favorite_border, color: Colors.grey,);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           const Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'title',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10.0),
                Text('description')
              ],
            ),
          ),
          IconButton(
              onPressed: changeStatusCard,
              icon: favIcon,
          )
          ],
        ),
    );
  }
}

class Ex2 extends StatefulWidget 
{
  const Ex2({super.key});

  @override
  State<Ex2> createState() => _Ex2State();
}

class _Ex2State extends State<Ex2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavoriteCard(),
          FavoriteCard(),
          FavoriteCard(),
        ],
      ),
    );
  }
}