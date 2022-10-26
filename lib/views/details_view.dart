import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../constans.dart';

class DetailsView extends StatefulWidget {
  DetailsView(
      {Key? key,
      required this.title,
      required this.details,
      required this.poster,
      required this.id})
      : super(key: key);
  final String title;
  final String details;
  final String poster;
  final String id;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  YoutubePlayerController? youtubePlayerController;
  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
            "https://www.youtube.com/watch?v=${widget.id}")!,
        flags: YoutubePlayerFlags(
            autoPlay: true, loop: false, isLive: false, mute: false));
    super.initState();
  }

  @override
  void deactivate() {
    youtubePlayerController!.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    youtubePlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          "Movies",
          style: TextStyle(color: fontColor),
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${widget.poster}"),
                    fit: BoxFit.cover))),
        BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.black.withOpacity(0.5))),
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(5),
                height: size.height * 0.35,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      "Watch Trailer",
                      style: const TextStyle(fontSize: 18, color: fontColor),
                    ),
                    YoutubePlayer(
                        controller: youtubePlayerController!,
                        onReady: () {
                          youtubePlayerController?.play();
                        })
                  ],
                ),
              ),
              Text(
                widget.title,
                style: const TextStyle(fontSize: 22, color: fontColor),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.details,
                  style: const TextStyle(fontSize: 18, color: fontColor),
                ),
              )
            ],
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          launchUrl(Uri.parse("https://cima4u.cloud/search/${widget.title}/"));
        },
        label: const Text("Watch on Cima4u"),
        backgroundColor: primaryColor,
      ),
    );
  }
}
