import 'package:flutter/material.dart';

class ScoreCard extends StatefulWidget
{
  final String course;
  const ScoreCard({super.key, required this.course});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int score = 0;
  final int maxScore = 10;
  final int minScore = 0;

  void updateScore(int delta)
  {
    setState(() {
      score += delta;
    }); 
  }

  VoidCallback? addScore()
  {
    if (score >= 10)
    {
      return null;
    }
    else
    {
      return () => updateScore(1);
    }
  }

  VoidCallback? minusScore()
  {
    if (score <= 0)
    {
      return null;
    }
    else
    {
      return () => updateScore(-1);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 500,
        child: Column(
          children: [

            Text(
              'My Score in ${widget.course}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.remove),
                  iconSize: 30,
                  color: Colors.black,
                  onPressed: minusScore(),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  iconSize: 30,
                  color: Colors.black,
                  onPressed: addScore(),
                ),
              ],
            ),

            LinearProgressIndicator(
              value: score/maxScore,
              minHeight: 10, 
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            )
          ],
        ),
      ),
    );
  }
}

class Ex4 extends StatefulWidget
{
  const Ex4({super.key});

  @override
  State<Ex4> createState() => _Ex4State();
}

class _Ex4State extends State<Ex4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreenAccent,
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: ScoreCard(course: 'Flutter'),),
            Expanded(child: ScoreCard(course: 'Dart'),),
            Expanded(child: ScoreCard(course: 'React'),),
          ],
        ),
      ),
    );
  }
}