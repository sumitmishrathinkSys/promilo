import 'package:flutter/material.dart';
import 'package:promilo/app_widgets/custom_carousel.dart';
import 'package:promilo/models/person_model.dart';
import 'package:promilo/utils/text_constant.dart';
import 'package:readmore/readmore.dart';

class DescriptionScreen extends StatelessWidget {
  final Person person;

  const DescriptionScreen({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextConstant.description),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const CarouselWithIndicator(
              carousleImageHeight: 300.0,
              isDescriptionScreen: true,
            ),
            //  const SizedBox(
            //     height: 5,
            //   ),
            // Text(person.name),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.save_as),
                  Text(person.meetUps.toString()),
                  Icon(Icons.favorite_outline),
                  Text(person.meetUps.toString()),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 18,
                          color: Colors.greenAccent,
                        ),
                        Icon(
                          Icons.favorite,
                          size: 18,
                          color: Colors.greenAccent,
                        ),
                        Icon(
                          Icons.favorite,
                          size: 18,
                          color: Colors.greenAccent,
                        ),
                        Icon(
                          Icons.favorite,
                          size: 18,
                          color: Color.fromARGB(255, 66, 232, 151),
                        ),
                        Icon(
                          Icons.favorite,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                 const Text("3.2"),
                 const SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
           const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                TextConstant.actorName,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                TextConstant.indianActress,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
           const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                   const Icon(Icons.alarm),
                   const SizedBox(
                      width: 10,
                    ),
                    Text(
                      TextConstant.duration,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )),
           const SizedBox(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                   const Icon(Icons.wallet),
                   const SizedBox(
                      width: 10,
                    ),
                    Text(
                      TextConstant.totalAverage,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )),
           const SizedBox(
              height: 20,
            ),
             Padding(
              padding:const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(TextConstant.about, style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 8.0),
              child:  ReadMoreText(
               TextConstant.aboutDescription,
              trimLines: 2,
              colorClickableText: Colors.blue,
              trimMode: TrimMode.Line,
              trimCollapsedText: TextConstant.showMore,
              trimExpandedText: TextConstant.showLess,
              moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            )
            ),
           
          ],
        ),
      ),
    );
  }
}


