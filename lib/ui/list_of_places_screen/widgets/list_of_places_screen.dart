import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyme_app/domain/models/event_detail.dart';
import 'package:lyme_app/ui/components/event_card.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/ui/setting/widgets/setting_item.dart';

class ListOfPlacesScreen extends StatefulWidget {
  const ListOfPlacesScreen({Key? key}) : super(key: key);

  @override
  _ListOfPlacesScreenState createState() => _ListOfPlacesScreenState();
}

class _ListOfPlacesScreenState extends State<ListOfPlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            'Sự kiện nổi bật',
            style: FontTheme.customStyles['bodyEmphasized']?.copyWith(
              color: AppColors.labelPrimaryLight,
            ),
          ),
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.labelPrimaryLight,
                size: 20,
              )),
        ),
        backgroundColor: AppColors.backgroundPrimary,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 120),
              ...buildDummyPlaceCards(),
              SizedBox(height: 40),
            ],
          ),
        ));
  }

  Widget _buildPlaceHorizontalCard(
      String placeName, double numEvent, String placeImageURL) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      onPressed: () {
        Navigator.pushNamed(context, '/place_screen');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              placeImageURL,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  placeName,
                  style:
                      FontTheme.customStyles['subheadlineEmphasized']?.copyWith(
                    color: AppColors.labelPrimaryLight,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '${numEvent.toInt()} Sự kiện', // Ensures whole number display
                  style: FontTheme.customStyles['footnoteRegular']?.copyWith(
                    color: AppColors.labelSecondaryLight,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Icon(Icons.arrow_right_alt_rounded,
              size: 24, color: AppColors.primary),
        ],
      ),
    );
  }

  List<Widget> buildDummyPlaceCards() {
    List<Map<String, dynamic>> places = [
      {
        "name": "Hà Nội",
        "numEvents": 5,
        "imageURL":
            "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg"
      },
      {
        "name": "TP. Hồ Chí Minh",
        "numEvents": 8,
        "imageURL":
            "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg"
      },
      {
        "name": "Đà Nẵng",
        "numEvents": 3,
        "imageURL":
            "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg"
      },
      {
        "name": "Hải Phòng",
        "numEvents": 2,
        "imageURL":
            "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg"
      },
      {
        "name": "Cần Thơ",
        "numEvents": 6,
        "imageURL":
            "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg"
      },
      {
        "name": "Huế",
        "numEvents": 4,
        "imageURL":
            "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg"
      },
      {
        "name": "Nha Trang",
        "numEvents": 7,
        "imageURL":
            "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg"
      },
      {
        "name": "Vũng Tàu",
        "numEvents": 3,
        "imageURL":
            "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg"
      },
      {
        "name": "Đà Lạt",
        "numEvents": 5,
        "imageURL":
            "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg"
      },
    ];

    return places.map((place) {
      return _buildPlaceHorizontalCard(
        place["name"],
        place["numEvents"].toDouble(),
        place["imageURL"],
      );
    }).toList();
  }
}
