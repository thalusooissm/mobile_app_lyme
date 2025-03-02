import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/domain/models/event_ticket.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

import 'package:lyme_app/domain/models/event_detail.dart';
import 'package:lyme_app/ui/event_detail/widgets/blast_card.dart';
import 'package:lyme_app/ui/event_detail/widgets/event_ticket_card_compact.dart';
import 'package:lyme_app/domain/models/host.dart';
import 'package:lyme_app/ui/event_detail/widgets/host_card.dart';
import 'package:lyme_app/domain/models/blast.dart';

final List<Blast> dummyBlasts = [
  Blast(
    blastId: 1,
    eventId: 101,
    hostId: 1,
    timestamp: DateTime.parse("2025-01-01 12:00:00"),
    content: "Join us for an exciting event happening this weekend!",
  ),
  Blast(
    blastId: 2,
    eventId: 102,
    hostId: 2,
    timestamp: DateTime.parse("2025-01-05 15:30:00"),
    content: "Dont miss out on the special discounts for early registrations!",
  ),
  Blast(
    blastId: 3,
    eventId: 103,
    hostId: 3,
    timestamp: DateTime.parse("2025-01-10 09:45:00"),
    content: "Our keynote speaker has just been announced. Check it out!",
  ),
];

final List<EventTicket> dummyEventTickets = [
  EventTicket(
    tickTypeId: 1,
    eventId: 101,
    capacity: 100,
    typeName: "VIP",
    description: "Access to exclusive VIP areas and perks",
    ifFree: false,
    price: 500.0,
    discountPrice: 450.0,
    ifDiscount: true,
    soldAmount: 30,
  ),
  EventTicket(
    tickTypeId: 2,
    eventId: 101,
    capacity: 200,
    typeName: "Standard",
    description: "General admission with great seating",
    ifFree: false,
    price: 200.0,
    discountPrice: null,
    ifDiscount: false,
    soldAmount: 150,
  ),
  EventTicket(
    tickTypeId: 3,
    eventId: 101,
    capacity: 50,
    typeName: "Free Pass",
    description: "Limited free tickets for early registrants",
    ifFree: true,
    price: null,
    discountPrice: null,
    ifDiscount: false,
    soldAmount: 45,
  ),
];

final List<Host> dummyHosts = [
  Host(
    userId: 1,
    fullName: "John Doe",
    userType: "Admin",
    instaLink: "https://instagram.com/johndoe",
    fbLink: "https://facebook.com/johndoe",
    xLink: "https://x.com/johndoe",
    birthdate: DateTime(1990, 5, 14),
    gender: "Male",
    userName: "john_doe",
    avatar:
        "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
    hostType: "Organizer",
    bio: "Loves organizing events and connecting people.",
  ),
  Host(
    userId: 2,
    fullName: "Jane Smith",
    userType: "Premium",
    instaLink: "https://instagram.com/janesmith",
    fbLink: null,
    xLink: "https://x.com/janesmith",
    birthdate: DateTime(1985, 11, 20),
    gender: "Female",
    userName: "jane_smith",
    avatar:
        "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
    hostType: "Speaker",
    bio: "Public speaker and motivator.",
  ),
  Host(
    userId: 3,
    fullName: "Alice Brown",
    userType: "Basic",
    instaLink: null,
    fbLink: "https://facebook.com/alicebrown",
    xLink: null,
    birthdate: null,
    gender: "Female",
    userName: "alice_brown",
    avatar:
        "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
    hostType: "Volunteer",
    bio: "Passionate about helping out at events.",
  ),
];

class EventDetailScreen extends StatefulWidget {
  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg'), // Path to your image
                fit: BoxFit.cover, // Makes the image cover the whole screen
              ),
            ),
          ),
          // Blur effect
          BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 150.0, sigmaY: 150.0), // Adjust blur intensity
            child: Container(
              color: Colors.black.withAlpha(
                  (0.5 * 255).toInt()), // Semi-transparent black overlay
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 28),
                  _eventThumbnail(
                    imageUrl:
                        "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
                  ),
                  SizedBox(height: 20),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //   child: _eventBasicInfo(),
                  // ),
                  SizedBox(height: 40),
                  _eventSetOfButtons(context),
                  SizedBox(height: 40),
                  _listOfTickets(),
                  SizedBox(height: 40),
                  _listOfHotsts(),
                  SizedBox(height: 40),
                  _buildBlasts(),
                  SizedBox(height: 40),
                  _buildEventDescription(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _eventThumbnail({required String imageUrl}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 360,
          height: 360,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.nonOpaqueSeparator,
                blurRadius: 10,
                offset: Offset(0, 5),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _eventBasicInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'LGBT Exposition 2024',
                      style: FontTheme.customStyles['subHeadlineRegular']
                          ?.copyWith(color: AppColors.labelSecondaryLight),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 4),
                  SvgPicture.asset(
                    'lib/assets/icons/arrow_forward_ios.svg',
                    width: 16,
                    height: 16,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Queer Planet Soiree For First Time In 2024',
                style: FontTheme.customStyles['title2Emphasized']
                    ?.copyWith(color: AppColors.labelPrimaryLight),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Text(
                '19:00 - 21:00, 21/08 (Ngày mai)',
                style: FontTheme.customStyles['footnoteRegular']
                    ?.copyWith(color: AppColors.labelSecondaryLight),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(width: 8),
        _buildFavoriteButton(),
      ],
    );
  }

  Widget _eventSetOfButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: _primaryActionButton(
              label: 'Đặt vé',
              icon: 'lib/assets/icons/dat_ve_icon.svg',
              onPressed: () {
                Navigator.of(context).pushNamed('/select_ticket_type');
              },
            ),
          ),
          SizedBox(width: 4),
          Expanded(
            child: _secondaryActionButton(
              label: 'Ghi chú',
              icon: 'lib/assets/icons/ghi_chu_icon.svg',
              onPressed: () {},
            ),
          ),
          SizedBox(width: 4),
          Expanded(
            child: _secondaryActionButton(
              label: 'Chia sẻ',
              icon: 'lib/assets/icons/chia_se_icon.svg',
              onPressed: () {},
            ),
          ),
          SizedBox(width: 4),
          Expanded(
            child: _secondaryActionButton(
              label: 'Khác',
              icon: 'lib/assets/icons/khac_icon.svg',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: SvgPicture.asset(
        'lib/assets/icons/add_to_fav_icon.svg',
        width: 24,
        height: 24,
      ),
    );
  }

  Widget _primaryActionButton(
      {required String label,
      required String icon,
      required Function() onPressed}) {
    return Container(
      child: CupertinoButton(
        color: AppColors.backgroundPrimary,
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              height: 20,
              width: 20,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              label,
              style: FontTheme.customStyles['caption1Emphasized']?.copyWith(
                color: AppColors.labelPrimaryLight,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }

  Widget _secondaryActionButton(
      {required String label,
      required String icon,
      required Function() onPressed}) {
    return Container(
      child: CupertinoButton(
        color: AppColors.fillPrimary,
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              height: 20,
              width: 20,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              label,
              style: FontTheme.customStyles['caption1Regular']?.copyWith(
                color: AppColors.labelPrimaryDark,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }

  Widget _listOfTickets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeading(label: 'Vé'),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: dummyEventTickets.length,
            itemBuilder: (context, index) {
              return EventTicketCardCompact(
                eventTicket: dummyEventTickets[index],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeading({
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Adjust alignment for text
        children: [
          Text(
            label,
            style: FontTheme.customStyles['calloutEmphasized']?.copyWith(
              color: AppColors.labelSecondaryDark,
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 0.33, // Set height directly without Expanded
            color: AppColors.nonOpaqueSeparator,
          ),
        ],
      ),
    );
  }

  Widget _listOfHotsts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeading(label: 'Host'),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: dummyHosts.length,
            itemBuilder: (context, index) {
              return HostCard(
                host: dummyHosts[index],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEventDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeading(label: 'Mô Tả'),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
              '💃 Là một cuộc hành trình khám phá sâu sắc về sự phát triển của loài người, một loài thông minh và tự sáng tạo. Thông qua ngôn ngữ hình thể và cảm xúc, các nghệ sĩ sẽ tái hiện lại chặng đường tiến hóa của chúng ta – từ quá khứ đầy dấu ấn đến hiện tại được định hình bởi sự sáng tạo, và tương lai đầy tiềm năng và bất định. 💃 Với những động tác uyển chuyển nhưng không kém phần mạnh mẽ, từng tiết mục múa sẽ kể câu chuyện về sự tò mò không ngừng nghỉ của con người – chúng ta luôn hướng tới tương lai, đặt câu hỏi về vị trí của mình trong thế giới này và khao khát hiểu rõ hơn về giới hạn của bản thân. Từ ký ức về những bước đi đầu tiên của loài người trên mặt đất cho đến những sáng tạo hiện đại, chương trình không chỉ là một hành trình về thể chất mà còn là cuộc phiêu lưu tâm trí, phản ánh quá trình tự vấn và sáng tạo của con người. “Đi Đâu” không chỉ là sự tôn vinh những gì loài người đã đạt được, mà còn là lời mời gọi khán giả cùng suy ngẫm về những khả năng vô tận của tương lai. Hãy cùng đắm chìm trong những cảm xúc mạnh mẽ, nhìn lại chặng đường mà chúng ta đã đi qua và tự hỏi: “Chúng ta có thể tiến xa đến đâu nữa?”',
              style: FontTheme.customStyles['footnoteRegular']
                  ?.copyWith(color: AppColors.labelPrimaryDark)),
        ),
      ],
    );
  }

  Widget _buildBlasts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeading(label: 'Lời nhắn'),
        SizedBox(height: 16),
        SizedBox(
          height: 200, // Set a height to prevent unbounded error
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyBlasts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0
                      ? 16.0
                      : 8.0, // Padding left for the first item
                  right: index == dummyBlasts.length - 1
                      ? 16.0
                      : 0.0, // Padding right for the last item
                ),
                child: BlastCard(
                  blast: dummyBlasts[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
