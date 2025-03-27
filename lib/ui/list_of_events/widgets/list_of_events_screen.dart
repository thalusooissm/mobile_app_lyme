import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyme_app/domain/models/event_detail.dart';
import 'package:lyme_app/ui/components/event_card.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/ui/setting/widgets/setting_item.dart';

class ListOfEventsScreen extends StatefulWidget {
  const ListOfEventsScreen({Key? key}) : super(key: key);

  @override
  _ListOfEventsScreenState createState() => _ListOfEventsScreenState();
}

class _ListOfEventsScreenState extends State<ListOfEventsScreen> {
  List<EventDetail> dummyEvents = [
    EventDetail(
      eventId: 1,
      eventName: "Hội Nghị Đổi Mới Công Nghệ 01 - Khởi Đầu",
      startTime: DateTime(2025, 11, 20, 16, 0),
      placeId: 101,
      hostIds: [201, 202, 203],
      topicId: 5,
      chainId: 2,
      about:
          "Sự kiện kết nối các chuyên gia công nghệ, nhà phát triển và nhà đổi mới để chia sẻ ý tưởng và khám phá xu hướng mới.",
      image:
          "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
      endTime: DateTime(2025, 11, 20, 21, 0),
      addressId: 301,
    ),
    EventDetail(
      eventId: 2,
      eventName: "Hội Nghị Đổi Mới Công Nghệ 02 - Khám Phá",
      startTime: DateTime(2025, 11, 21, 16, 0),
      placeId: 102,
      hostIds: [204, 205, 206],
      topicId: 6,
      chainId: 3,
      about:
          "Phiên thảo luận về AI, blockchain và những công nghệ đột phá trong tương lai.",
      image:
          "https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg",
      endTime: DateTime(2025, 11, 21, 21, 0),
      addressId: 302,
    ),
    EventDetail(
      eventId: 3,
      eventName: "Hội Nghị Đổi Mới Công Nghệ 03 - Kết Thúc",
      startTime: DateTime(2025, 11, 22, 16, 0),
      placeId: 103,
      hostIds: [207, 208, 209],
      topicId: 7,
      chainId: 4,
      about:
          "Sự kiện cuối cùng của chuỗi hội nghị, với các chuyên gia chia sẻ kinh nghiệm và cơ hội kết nối.",
      image:
          "https://images.pexels.com/photos/1181406/pexels-photo-1181406.jpeg",
      endTime: DateTime(2025, 11, 22, 21, 0),
      addressId: 303,
    ),
    EventDetail(
      eventId: 4,
      eventName: "Hội Nghị Công Nghệ AI - Định Hình Tương Lai",
      startTime: DateTime(2025, 12, 5, 9, 0),
      placeId: 104,
      hostIds: [210, 211, 212],
      topicId: 8,
      chainId: 5,
      about:
          "Hội thảo chuyên sâu về AI, học máy và cách chúng đang thay đổi ngành công nghiệp.",
      image:
          "https://images.pexels.com/photos/3746234/pexels-photo-3746234.jpeg",
      endTime: DateTime(2025, 12, 5, 17, 0),
      addressId: 304,
    ),
    EventDetail(
      eventId: 5,
      eventName: "Hội Thảo Blockchain - Tương Lai Số",
      startTime: DateTime(2025, 12, 10, 14, 0),
      placeId: 105,
      hostIds: [213, 214, 215],
      topicId: 9,
      chainId: 6,
      about:
          "Hội thảo thảo luận về cách blockchain có thể ứng dụng vào các lĩnh vực kinh tế và tài chính.",
      image:
          "https://images.pexels.com/photos/11035569/pexels-photo-11035569.jpeg",
      endTime: DateTime(2025, 12, 10, 18, 0),
      addressId: 305,
    ),
    EventDetail(
      eventId: 6,
      eventName: "Diễn Đàn Công Nghệ Việt Nam 2025",
      startTime: DateTime(2026, 1, 15, 10, 0),
      placeId: 106,
      hostIds: [216, 217, 218],
      topicId: 10,
      chainId: 7,
      about:
          "Diễn đàn quy tụ các chuyên gia công nghệ hàng đầu Việt Nam, thảo luận về xu hướng và cơ hội phát triển.",
      image:
          "https://images.pexels.com/photos/3184292/pexels-photo-3184292.jpeg",
      endTime: DateTime(2026, 1, 15, 17, 0),
      addressId: 306,
    ),
    EventDetail(
      eventId: 1,
      eventName: "Hội Nghị Đổi Mới Công Nghệ 01 - Khởi Đầu",
      startTime: DateTime(2025, 11, 20, 16, 0),
      placeId: 101,
      hostIds: [201, 202, 203],
      topicId: 5,
      chainId: 2,
      about:
          "Sự kiện kết nối các chuyên gia công nghệ, nhà phát triển và nhà đổi mới để chia sẻ ý tưởng và khám phá xu hướng mới.",
      image:
          "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
      endTime: DateTime(2025, 11, 20, 21, 0),
      addressId: 301,
    ),
    EventDetail(
      eventId: 2,
      eventName: "Hội Nghị Đổi Mới Công Nghệ 02 - Khám Phá",
      startTime: DateTime(2025, 11, 21, 16, 0),
      placeId: 102,
      hostIds: [204, 205, 206],
      topicId: 6,
      chainId: 3,
      about:
          "Phiên thảo luận về AI, blockchain và những công nghệ đột phá trong tương lai.",
      image:
          "https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg",
      endTime: DateTime(2025, 11, 21, 21, 0),
      addressId: 302,
    ),
    EventDetail(
      eventId: 3,
      eventName: "Hội Nghị Đổi Mới Công Nghệ 03 - Kết Thúc",
      startTime: DateTime(2025, 11, 22, 16, 0),
      placeId: 103,
      hostIds: [207, 208, 209],
      topicId: 7,
      chainId: 4,
      about:
          "Sự kiện cuối cùng của chuỗi hội nghị, với các chuyên gia chia sẻ kinh nghiệm và cơ hội kết nối.",
      image:
          "https://images.pexels.com/photos/1181406/pexels-photo-1181406.jpeg",
      endTime: DateTime(2025, 11, 22, 21, 0),
      addressId: 303,
    ),
    EventDetail(
      eventId: 4,
      eventName: "Hội Nghị Công Nghệ AI - Định Hình Tương Lai",
      startTime: DateTime(2025, 12, 5, 9, 0),
      placeId: 104,
      hostIds: [210, 211, 212],
      topicId: 8,
      chainId: 5,
      about:
          "Hội thảo chuyên sâu về AI, học máy và cách chúng đang thay đổi ngành công nghiệp.",
      image:
          "https://images.pexels.com/photos/3746234/pexels-photo-3746234.jpeg",
      endTime: DateTime(2025, 12, 5, 17, 0),
      addressId: 304,
    ),
    EventDetail(
      eventId: 5,
      eventName: "Hội Thảo Blockchain - Tương Lai Số",
      startTime: DateTime(2025, 12, 10, 14, 0),
      placeId: 105,
      hostIds: [213, 214, 215],
      topicId: 9,
      chainId: 6,
      about:
          "Hội thảo thảo luận về cách blockchain có thể ứng dụng vào các lĩnh vực kinh tế và tài chính.",
      image:
          "https://images.pexels.com/photos/11035569/pexels-photo-11035569.jpeg",
      endTime: DateTime(2025, 12, 10, 18, 0),
      addressId: 305,
    ),
    EventDetail(
      eventId: 6,
      eventName: "Diễn Đàn Công Nghệ Việt Nam 2025",
      startTime: DateTime(2026, 1, 15, 10, 0),
      placeId: 106,
      hostIds: [216, 217, 218],
      topicId: 10,
      chainId: 7,
      about:
          "Diễn đàn quy tụ các chuyên gia công nghệ hàng đầu Việt Nam, thảo luận về xu hướng và cơ hội phát triển.",
      image:
          "https://images.pexels.com/photos/3184292/pexels-photo-3184292.jpeg",
      endTime: DateTime(2026, 1, 15, 17, 0),
      addressId: 306,
    ),
    EventDetail(
      eventId: 1,
      eventName: "Hội Nghị Đổi Mới Công Nghệ 01 - Khởi Đầu",
      startTime: DateTime(2025, 11, 20, 16, 0),
      placeId: 101,
      hostIds: [201, 202, 203],
      topicId: 5,
      chainId: 2,
      about:
          "Sự kiện kết nối các chuyên gia công nghệ, nhà phát triển và nhà đổi mới để chia sẻ ý tưởng và khám phá xu hướng mới.",
      image:
          "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
      endTime: DateTime(2025, 11, 20, 21, 0),
      addressId: 301,
    ),
    EventDetail(
      eventId: 2,
      eventName: "Hội Nghị Đổi Mới Công Nghệ 02 - Khám Phá",
      startTime: DateTime(2025, 11, 21, 16, 0),
      placeId: 102,
      hostIds: [204, 205, 206],
      topicId: 6,
      chainId: 3,
      about:
          "Phiên thảo luận về AI, blockchain và những công nghệ đột phá trong tương lai.",
      image:
          "https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg",
      endTime: DateTime(2025, 11, 21, 21, 0),
      addressId: 302,
    ),
    EventDetail(
      eventId: 3,
      eventName: "Hội Nghị Đổi Mới Công Nghệ 03 - Kết Thúc",
      startTime: DateTime(2025, 11, 22, 16, 0),
      placeId: 103,
      hostIds: [207, 208, 209],
      topicId: 7,
      chainId: 4,
      about:
          "Sự kiện cuối cùng của chuỗi hội nghị, với các chuyên gia chia sẻ kinh nghiệm và cơ hội kết nối.",
      image:
          "https://images.pexels.com/photos/1181406/pexels-photo-1181406.jpeg",
      endTime: DateTime(2025, 11, 22, 21, 0),
      addressId: 303,
    ),
    EventDetail(
      eventId: 4,
      eventName: "Hội Nghị Công Nghệ AI - Định Hình Tương Lai",
      startTime: DateTime(2025, 12, 5, 9, 0),
      placeId: 104,
      hostIds: [210, 211, 212],
      topicId: 8,
      chainId: 5,
      about:
          "Hội thảo chuyên sâu về AI, học máy và cách chúng đang thay đổi ngành công nghiệp.",
      image:
          "https://images.pexels.com/photos/3746234/pexels-photo-3746234.jpeg",
      endTime: DateTime(2025, 12, 5, 17, 0),
      addressId: 304,
    ),
    EventDetail(
      eventId: 5,
      eventName: "Hội Thảo Blockchain - Tương Lai Số",
      startTime: DateTime(2025, 12, 10, 14, 0),
      placeId: 105,
      hostIds: [213, 214, 215],
      topicId: 9,
      chainId: 6,
      about:
          "Hội thảo thảo luận về cách blockchain có thể ứng dụng vào các lĩnh vực kinh tế và tài chính.",
      image:
          "https://images.pexels.com/photos/11035569/pexels-photo-11035569.jpeg",
      endTime: DateTime(2025, 12, 10, 18, 0),
      addressId: 305,
    ),
    EventDetail(
      eventId: 6,
      eventName: "Diễn Đàn Công Nghệ Việt Nam 2025",
      startTime: DateTime(2026, 1, 15, 10, 0),
      placeId: 106,
      hostIds: [216, 217, 218],
      topicId: 10,
      chainId: 7,
      about:
          "Diễn đàn quy tụ các chuyên gia công nghệ hàng đầu Việt Nam, thảo luận về xu hướng và cơ hội phát triển.",
      image:
          "https://images.pexels.com/photos/3184292/pexels-photo-3184292.jpeg",
      endTime: DateTime(2026, 1, 15, 17, 0),
      addressId: 306,
    ),
  ];

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
            SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                children: dummyEvents
                    .map((event) => EventCard(eventDetail: event))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
