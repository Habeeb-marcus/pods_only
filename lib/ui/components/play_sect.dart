import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PlaySect extends StatelessWidget {
  const PlaySect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 150,
              width: 150,
              color: Colors.grey,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  'src',
                  fit: BoxFit.cover,
                  ),
              ),
            ),
            Column(
              children:  [
                 Text('5D AGO'),
                  SizedBox(
                  height: 4,
                ),
                Text(
                 'edwewfw',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                 SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    children: [
                      TextButton.icon(onPressed: (){}, icon: Icon(Icons.play_circle_rounded), label: Text('data'))
                      
                    ],
                  )
                )
              ],
            )
          ],
        )
      ],
    );
  }
}