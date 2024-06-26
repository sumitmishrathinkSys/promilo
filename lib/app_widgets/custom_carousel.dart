import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:promilo/utils/image_constant.dart';
import 'package:share_plus/share_plus.dart';

class CarouselWithIndicator extends StatefulWidget {
  final double? carousleImageHeight;
  final bool isDescriptionScreen;

  const CarouselWithIndicator(
      {Key? key, this.carousleImageHeight, this.isDescriptionScreen = false})
      : super(key: key);

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  final List<String> imgList = [
    ImageConstants.firstMeetupCarouselImage,
    ImageConstants.secondMeetUpCarouselImage,
    ImageConstants.thirdMeetUpCarouselImage,
  ];

  List<Widget> generateImageTiles() {
    return imgList
        .map((element) => ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                element,
                fit: BoxFit.cover,
                width: double.infinity,
                height: widget.carousleImageHeight,
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: carouselContent());
  }

  Widget carouselContent() {
    return !widget.isDescriptionScreen
        ? Column(
            children: [
                CarouselSlider(
                  items: generateImageTiles(),
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: widget
                        .carousleImageHeight, // Set the height of the carousel
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: false,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  widget.isDescriptionScreen == true ? Colors.grey[400] : null,
            ),
            height: widget.isDescriptionScreen == true
                ? widget.carousleImageHeight! + 70
                : null,
            child: Column(
              children: [
                Stack(
                  children: [
                    CarouselSlider(
                      items: generateImageTiles(),
                      carouselController: _controller,
                      options: CarouselOptions(
                        height: widget
                            .carousleImageHeight, // Set the height of the carousel
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: false,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: MediaQuery.of(context).size.width * 0.35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
               const SizedBox(
                  height: 20,
                ),
                widget.isDescriptionScreen == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        const Icon(
                            Icons.downloading,
                            size: 30,
                          ),
                         const Icon(
                            Icons.save,
                            size: 30,
                          ),
                        const  Icon(
                            Icons.square_outlined,
                            size: 30,
                          ),
                        const  Icon(
                            Icons.favorite_outline,
                            size: 30,
                          ),
                        const  Icon(
                            Icons.star,
                            size: 30,
                          ),
                          GestureDetector(
                              onTap: () {
                                Share.share('Check out this awesome app!');
                              },
                              child: const Icon(
                                Icons.share,
                                size: 30,
                              )),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          );
  }
}
