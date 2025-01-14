import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/ui/components/buttons/text_icon_button.dart';
import 'package:lyme_app/ui/components/topic_ui.dart';
import 'package:lyme_app/ui/components/place_ui.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
    final List<Map<String, String>> topics = [
    {'icon': '/topic_icon/palette.svg', 'name': 'Topic 1'},
    {'icon': '/topic_icon/palette.svg', 'name': 'Topic 2'},
    {'icon': '/topic_icon/palette.svg', 'name': 'Topic 3'},
    {'icon': '/topic_icon/palette.svg', 'name': 'Topic 4'},
    {'icon': '/topic_icon/palette.svg', 'name': 'Topic 5'},
    {'icon': '/topic_icon/palette.svg', 'name': 'Topic 6'},
    {'icon': '/topic_icon/palette.svg', 'name': 'Topic 7'},
    {'icon': '/topic_icon/palette.svg', 'name': 'Topic 8'},
    {'icon': '/topic_icon/palette.svg', 'name': 'Topic 9'},
    {'icon': '/topic_icon/palette.svg', 'name': 'Topic 10'},
  ];
    final List<Map<String, String>> places = [
    {'name': 'TP. Hồ Chí Minh', 'image': '/images/hochiminhcity.jpg'},
    {'name': 'New York', 'image': '/images/hochiminhcity.jpg'},
    {'name': 'Tokyo', 'image': '/images/hochiminhcity.jpg'},
    {'name': 'London', 'image': '/images/hochiminhcity.jpg'},
    {'name': 'Berlin', 'image': '/images/hochiminhcity.jpg'},
  ];


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.backgroundPrimary,
      // child: SingleChildScrollView(
        // Make the content scrollable
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Better alignment
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Left and Right padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sự kiện nổi bật',
                      style: FontTheme.customStyles['title3Emphasized']?.copyWith(
                        color: AppColors.labelPrimaryLight, // Specify the color here
                      ),
                    ),
                    TextIconButton(
                      text: 'Xem thêm',
                      iconAssetPath: 'icons/arrow_forward_ios.svg',
                      onPressed: () {
                        // Add the onPressed callback
                        print('View more button pressed');
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Left and Right padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Chủ đề',
                      style: FontTheme.customStyles['title3Emphasized']?.copyWith(
                        color: AppColors.labelPrimaryLight, // Specify the color here
                      ),
                    ),
                    TextIconButton(
                      text: 'Xem thêm',
                      iconAssetPath: 'icons/arrow_forward_ios.svg',
                      onPressed: () {
                        // Add the onPressed callback
                        print('View more button pressed');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
SingleChildScrollView(
  scrollDirection: Axis.horizontal, // Scroll horizontally
  child: Row(
    mainAxisSize: MainAxisSize.min, // Prevent Row from taking too much space
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 8.0), // Add both left and right padding to the first item
        child: GestureDetector(
          onTap: () {
            // Action for the first item
            print('First item pressed: ${topics.first['name']}');
          },
          child: TopicCard(
            iconAssetPath: topics.first['icon']!, // First item icon
            topicName: topics.first['name']!, // First item name
          ),
        ),
      ),
      // Map the remaining items without the left padding
      ...topics.skip(1).take(9).map((topic) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: () {
              // Action for each item
              print('${topic['name']} pressed');
            },
            child: TopicCard(
              iconAssetPath: topic['icon']!,
              topicName: topic['name']!,
            ),
          ),
        );
      }).toList(),
    ],
  ),
), 
              SizedBox(height: 32),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Left and Right padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Địa điểm',
                      style: FontTheme.customStyles['title3Emphasized']?.copyWith(
                        color: AppColors.labelPrimaryLight, // Specify the color here
                      ),
                    ),
                    TextIconButton(
                      text: 'Xem thêm',
                      iconAssetPath: 'icons/arrow_forward_ios.svg',
                      onPressed: () {
                        // Add the onPressed callback
                        print('View more button pressed');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0),
            child: GestureDetector(
              onTap: () {
                print('First place pressed: ${places.first['name']}');
              },
              child: PlaceCard(
                imagePath: places.first['image']!,
                placeName: places.first['name']!,
              ),
            ),
          ),
          ...places.skip(1).take(4).map((place) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () {
                  print('${place['name']} pressed');
                },
                child: PlaceCard(
                  imagePath: place['image']!,
                  placeName: place['name']!,
                ),
              ),
            );
          }).toList(),
        ],
      ),
    ),    
],
          ),
        ),
      );
    // );
  }
}