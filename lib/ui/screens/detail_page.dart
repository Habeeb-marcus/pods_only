import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:podcast_search/podcast_search.dart';
import 'package:palette_generator/palette_generator.dart';

class DetailPage extends StatefulWidget {
   final Item item;

  const DetailPage({super.key, required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color _backgroundColor = Colors.white;
  selectImageColor () async {
    if(widget.item.artworkUrl600 != null){
       final paletteGenerator = await PaletteGenerator.fromImageProvider(NetworkImage('${widget.item.artworkUrl600}'));
      
       setState(() {
        _backgroundColor = paletteGenerator.dominantColor?.color ?? Colors.white;
      });
    }else{
      return Colors.black;
    }
  }
  @override
  Widget build(BuildContext context) {
      selectImageColor();
    print('----->this is our item: ${widget.item}');
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          title: Text('${widget.item.trackName}', style: TextStyle(color: Colors.white),),
          backgroundColor:  widget.item.artworkUrl600 != null ? Colors.transparent : Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          actions: [
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.favorite_border),
            //   label: Text(''),
            //   backgroundColor: Colors.black,
            // ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            )],
        ),
        body: Column(
          children: [
     
        Container(
          height: 400,
          color: _backgroundColor,
          child: Column(
            children: [
              SizedBox(height: 150,),
                Image(
                image: widget.item.artworkUrl600 != null
                    ? NetworkImage('${widget.item.artworkUrl600}')
                    : const NetworkImage('https://picsum.photos/250?image=9'),
                height: 100,
                width: 100,
              ),
              // Text(item),
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: Text('navigate back to home page')),
              ),
          ]),
        )
          ],
        ),
      );

  }
}
