import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/components/buttons/text_icon_button.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/ui/getting_ticket/widgets/step_indicator.dart';
import 'package:lyme_app/ui/getting_ticket/widgets/ticket_type_select_card.dart';
import 'package:intl/intl.dart';

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.backgroundPrimary,
      //   navigationBar: CupertinoNavigationBar(
      //     leading: GestureDetector(
      //       onTap: () {
      //         if (Navigator.of(context).canPop()) {
      //           Navigator.of(context).pop();
      //         }
      //       },
      //       child: Icon(
      //         Icons.arrow_back_ios_new_rounded,
      //         color: AppColors.labelPrimaryLight,
      //         size: 20,
      //       ),
      //     ),
      //     middle: Text(
      //       'Chọn vé',
      //       style: FontTheme.customStyles['title3Emphasized']
      //           ?.copyWith(color: AppColors.labelPrimaryLight),
      //     ),
      //     backgroundColor: AppColors.backgroundPrimary,
      //   ),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 144,
                      ),
                      Icon(Icons.check_circle_rounded,
                          color: AppColors.green, size: 72),
                      SizedBox(height: 16),
                      Text(
                        'Đặt Vé Thành Công',
                        style: FontTheme.customStyles['title3Emphasized']
                            ?.copyWith(color: AppColors.white),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Bạn đã đặt vé cho sự kiện ‘Triễn lãm Những Đại hạt Phù du’ diễn ra vào ngày 12 Tháng 12, 2024.',
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: FontTheme.customStyles['bodyRegular']
                                  ?.copyWith(
                                      color: AppColors.labelSecondaryDark),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 48,
                      ),
                      Row(
                        children: [
                          Text(
                            'Danh sách vé',
                            style: FontTheme.customStyles['title3Emphasized']
                                ?.copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GotTicketTypeCard(
                        ticketName: 'Vé Thường',
                        ticketPrice: '100000',
                        amount: 2,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GotTicketTypeCard(
                        ticketName: 'Vé VIP',
                        ticketPrice: '200000',
                        amount: 1,
                      ),
                      //   Column(
                      //     children: [
                      //       Icon(Icons.arrow_upward_rounded,
                      //           color: AppColors.labelSecondaryDark, size: 24),
                      //       SizedBox(height: 4),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Text(
                      //             'Vuốt lên để xem nhanh danh sách vé',
                      //             textAlign: TextAlign.center,
                      //             style: FontTheme.customStyles['footnoteRegular']
                      //                 ?.copyWith(
                      //                     color: AppColors.labelSecondaryDark),
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 38),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.2 * 255).toInt()),
                      offset: Offset(0, 0),
                      blurRadius: 32,
                    ),
                  ],
                ),
                child: CupertinoButton(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Text(
                      'Xem Vé',
                      style: FontTheme.customStyles['headlineRegular']
                          ?.copyWith(color: AppColors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/home',
                          arguments: {'initialTab': 'MyTicketScreen'});
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GotTicketTypeCard extends StatelessWidget {
  final String ticketName;
  final String ticketPrice;
  final int amount;

  final currencyFormatter = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');

  GotTicketTypeCard({
    required this.ticketName,
    required this.ticketPrice,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.fillTertiary,
        border: Border(
          bottom: BorderSide(
            width: 0.33,
            color: AppColors.nonOpaqueSeparator,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'lib/assets/icons/leading_icon_ticket.svg',
            width: 24.0,
            height: 24.0,
            placeholderBuilder: (context) => CircularProgressIndicator(),
          ),
          SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      ticketName,
                      style: FontTheme.customStyles['subheadlineRegular']
                          ?.copyWith(
                        color: AppColors.labelSecondaryDark,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '${currencyFormatter.format(int.parse(ticketPrice))} × $amount Vé', // Placeholder for description
                      style:
                          FontTheme.customStyles['caption1Regular']?.copyWith(
                        color: AppColors.labelPrimaryDark,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Text(
            currencyFormatter.format(int.parse(ticketPrice) * amount),
            style: FontTheme.customStyles['subheadlineRegular']
                ?.copyWith(color: AppColors.labelPrimaryDark),
          ),
        ],
      ),
    );
  }
}
