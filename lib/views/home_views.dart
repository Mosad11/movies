import 'package:flutter/material.dart';
import 'package:movies/constans.dart';
import 'package:movies/controllers/home_controller.dart';
import 'package:movies/helper.dart';
import 'package:movies/views/details_view.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<HomeController>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Top 10",
                style: TextStyle(color: fontColor, fontSize: 20),
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
              child: CarouselSlider.builder(
                  itemCount: controller.movieList.length,
                  itemBuilder: (context, index, realIndex) {
                    return InkWell(
                      onTap: (() async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    CircularProgressIndicator(),
                                    Text("Loading")
                                  ],
                                ),
                              );
                            });
                        String id = await controller
                            .getTrailerKey(controller.movieList[index].id!);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsView(
                                      title: controller.movieList[index].title!,
                                      details:
                                          controller.movieList[index].overview!,
                                      poster: controller
                                          .movieList[index].posterPath!,
                                      id: id,
                                    )));
                      }),
                      child: Container(
                        child: Stack(children: [
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Container(
                              height: size.height * 0.07,
                              width: size.width * 0.4,
                              child: Center(
                                  child: Text(
                                controller.movieList[index].title!,
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: fontColor, fontSize: 16),
                              )),
                              decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.7),
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15))),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              height: size.height * 0.07,
                              width: size.width * 0.2,
                              child: Center(
                                  child: Text(
                                controller.movieList[index].voteAverage
                                    .toString(),
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: fontColor, fontSize: 16),
                              )),
                              decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.7),
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15))),
                            ),
                          )
                        ]),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: primaryColor,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${controller.movieList[index].posterPath}"),
                                fit: BoxFit.fill)),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                  )),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Best Movies",
                    style: TextStyle(fontSize: 20, color: fontColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.movieList2.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (() async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    CircularProgressIndicator(),
                                    Text("Loading")
                                  ],
                                ),
                              );
                            });
                        String id = await controller
                            .getTrailerKey(controller.movieList2[index].id!);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsView(
                                      title:
                                          controller.movieList2[index].title!,
                                      details: controller
                                          .movieList2[index].overview!,
                                      poster: controller
                                          .movieList2[index].posterPath!,
                                      id: id,
                                    )));
                      }),
                      child: Container(
                        height: size.height * 0.25,
                        width: 110,
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Container(
                              height: size.height * 0.17,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${controller.movieList2[index].posterPath}"),
                                      fit: BoxFit.fill)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                cutString(controller.movieList2[index].title!),
                                style: const TextStyle(
                                    color: fontColor, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: size.height * 0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.movieList3.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (() async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    CircularProgressIndicator(),
                                    Text("Loading")
                                  ],
                                ),
                              );
                            });
                        String id = await controller
                            .getTrailerKey(controller.movieList3[index].id!);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsView(
                                      title:
                                          controller.movieList3[index].title!,
                                      details: controller
                                          .movieList3[index].overview!,
                                      poster: controller
                                          .movieList3[index].posterPath!,
                                      id: id,
                                    )));
                      }),
                      child: Container(
                        height: size.height * 0.25,
                        width: 110,
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Container(
                              height: size.height * 0.17,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${controller.movieList3[index].posterPath}"),
                                      fit: BoxFit.fill)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                cutString(controller.movieList3[index].title!),
                                style: const TextStyle(
                                    color: fontColor, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
