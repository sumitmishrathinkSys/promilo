import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promilo/app_widgets/custom_carousel.dart';
import 'package:promilo/app_widgets/custom_text_field.dart';
import 'package:promilo/models/person_model.dart';
import 'package:promilo/utils/image_constant.dart';
import 'package:promilo/utils/text_constant.dart';
import 'description_screen.dart';

class MeetUpScreen extends StatelessWidget {
  final List<String> images = [
    ImageConstants.firstMeetupCarouselImage,
    ImageConstants.secondMeetUpCarouselImage,
    ImageConstants.thirdMeetUpCarouselImage,
    ImageConstants.firstMeetupCarouselImage,
    ImageConstants.secondMeetUpCarouselImage,
    ImageConstants.firstMeetupCarouselImage,
    ImageConstants.secondMeetUpCarouselImage,
  ];

  final List<Person> trendingPeople = [
    Person(TextConstant.author, ImageConstants.firstMeetupCarouselImage, 1024),
    Person(TextConstant.author, ImageConstants.secondMeetUpCarouselImage, 2560),
    Person(TextConstant.author, ImageConstants.thirdMeetUpCarouselImage, 1200),
    Person(TextConstant.author, ImageConstants.firstMeetupCarouselImage, 200),
    Person(TextConstant.author, ImageConstants.secondMeetUpCarouselImage, 543),
  ];

  final List<String> items = List.generate(5, (index) => 'Item $index');
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TextConstant.individualMeetup),centerTitle: false,),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomTextField(
              controller: searchController,
              labelText: 'Search',
              hintText: 'Search',
              hintTextSize: 22,
              prefixIcon: Icon(
                Icons.search_rounded,
                size: 38,
              ),
              suffixIcon: Icon(
                Icons.mic_rounded,
                size: 38,
              ),
            ),
          ),
          CarouselWithIndicator(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              TextConstant.trendingPopularPeople,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
         const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendingPeople.length,
              itemBuilder: (context, index) {
                Person person = trendingPeople[index];
                return Container(
                  margin: const EdgeInsets.all(
                      8.0), // Add some margin for spacing between children
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ), // Add border to child container
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                person.imagePath,
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  person.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("${person.meetUps} Meetups"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: const Divider(
                          color: Colors.grey,
                          // thickness: 1,
                        ),
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 10, top: 10),
                        // color: Colors.green, // Set a fixed height for the container
                        width: double.infinity,
                        child: Stack(
                          children: images.map((imagePath) {
                            int index = images.indexOf(imagePath);
                            double leftPosition = index *
                                30.0; // Adjust this value for positioning
                            return Positioned(
                              left: leftPosition,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  imagePath,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: 120,
                        height: 35,
                        margin: EdgeInsets.only(left: 160.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                           borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(child: Text("See more", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
           SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              TextConstant.trendingPopularPeople,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 20,),
          Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Colors.yellow,
            // border: Border.all(color: Colors.black, width: 2), // Add border to parent container
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trendingPeople.length,
            // padding: EdgeInsets.all(20),
            itemBuilder: (context, index) {
              // return Image.asset(images[index]);
              return GestureDetector(
                onTap: (){
                  print("clicked ${trendingPeople[index].name}");
                 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionScreen(person: trendingPeople[index])));
                },
                child: Container(
                  margin: const EdgeInsets.all(12.0), // Add some margin for spacing between children
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.green,
                    // border: Border.all(color: Colors.red, width: 2), // Add border to child container
                  ),
                  child: Image.asset(images[index],fit: BoxFit.cover,),
                ),
              );
            },
          ),
        ),
        ],
      ),
    );
  }

  Widget _buildTrendingPersonCard(Person person) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              person.imagePath,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
         const SizedBox(height: 8),
          Text(
            person.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
