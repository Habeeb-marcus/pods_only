import 'dart:async';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectImageColor();
    // _backgroundColor = paletteGenerator.dominantColor?.color ?? Colors.white;
  }

  Color _backgroundColor = Colors.white;
  selectImageColor() async {
    if (widget.item.artworkUrl600 != null) {
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
          NetworkImage('${widget.item.artworkUrl600}'));
      // print('this is the color: ${paletteGenerator.dominantColor?.color}');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _backgroundColor = paletteGenerator.dominantColor?.color ??
              paletteGenerator.darkVibrantColor?.color ??
              Colors.white;
        });
      });
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print('----->this is our item: ${widget.item}');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '${widget.item.trackName}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: widget.item.artworkUrl600 != null
            ? Colors.transparent
            : Colors.black,
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
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 2 / 3 * height,
            color: _backgroundColor,
            child: Column(children: [
              SizedBox(
                height: 120,
              ),
              Image(
                image: widget.item.artworkUrl600 != null
                    ? NetworkImage('${widget.item.artworkUrl600}')
                    : const NetworkImage('https://picsum.photos/250?image=9'),
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${widget.item.trackName}',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${widget.item.artistName}',
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                // height: 10,
                width: 2/3 * width,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow_sharp),
                  label: const Text('Latest Episode'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${widget.item.primaryGenreName}',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text('navigate back to home page')),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
