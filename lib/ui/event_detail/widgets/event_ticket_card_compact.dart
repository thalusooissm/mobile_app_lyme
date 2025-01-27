import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyme_app/domain/models/event_ticket.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';



class EventTicketCardCompact extends StatefulWidget {
  final EventTicket eventTicket;

  EventTicketCardCompact({required this.eventTicket});

  @override
  _EventTicketCardCompactState createState() => _EventTicketCardCompactState();
}

class _EventTicketCardCompactState extends State<EventTicketCardCompact> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'lib/assets/icons/leading_icon_ticket.svg',
          width: 24.0,
          height: 24.0,
          placeholderBuilder: (context) => CircularProgressIndicator(),
        ),
        SizedBox(width: 8),
        Expanded( // Wrap this container in an Expanded to allow flexible width
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
                    children: [
                      Row(
                        children: [
                        Text(
                              widget.eventTicket.typeName,
                              style: FontTheme.customStyles['subheadlineEmphasized']?.copyWith(
                                color: AppColors.labelPrimaryDark,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          Text(
                            ' • Còn ',
                            style: FontTheme.customStyles['footnoteRegular']?.copyWith(
                              color: AppColors.labelSecondaryDark,
                            ),
                          ),
                          Text(
                            '${widget.eventTicket.soldAmount}/${widget.eventTicket.capacity}',
                            style: FontTheme.customStyles['footnoteRegular']?.copyWith(
                              color: AppColors.labelSecondaryDark,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.eventTicket.description,
                        style: FontTheme.customStyles['caption1Regular']?.copyWith(
                          color: AppColors.labelSecondaryDark,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Row(
                  children: [
                    Text(
                      widget.eventTicket.ifFree
                          ? 'Miễn phí'
                          : '${widget.eventTicket.price}đ',
                      style: FontTheme.customStyles['subheadlineEmphasized']?.copyWith(
                        color: AppColors.labelPrimaryDark,
                      ),
                    ),
                    SizedBox(width: 8),
                    CupertinoButton(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(50),
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      onPressed: () {},
                      child: Text(
                        'Đặt',
                        style: FontTheme.customStyles['subheadlineRegular']?.copyWith(
                          color: AppColors.labelPrimaryDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}