import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/components/buttons/text_icon_button.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

import 'package:intl/intl.dart';

class TicketConfirmationCard extends StatefulWidget {
  final String ticketName;
  final double ticketPrice;
  final String ticketDescription;
  final double selectedAmount;

  const TicketConfirmationCard({
    Key? key,
    required this.ticketName,
    required this.ticketPrice,
    required this.ticketDescription,
    required this.selectedAmount,
  }) : super(key: key);

  @override
  _TicketConfirmationCardState createState() => _TicketConfirmationCardState();
}

class _TicketConfirmationCardState extends State<TicketConfirmationCard> {
  final currencyFormatter = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');

  int amount = 1;

  void increaseAmount() {
    setState(() {
      amount++;
    });
  }

  void decreaseAmount() {
    if (amount > 1) {
      setState(() {
        amount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.fillSecondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 6),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.33,
                              color: AppColors.nonOpaqueSeparator)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.ticketName,
                              style: FontTheme.customStyles['bodyEmphasized']
                                  ?.copyWith(
                                      color: AppColors.labelPrimaryLight),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          currencyFormatter.format(widget.ticketPrice),
                          style: FontTheme.customStyles['footnoteRegular']
                              ?.copyWith(color: AppColors.labelPrimaryLight),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.ticketDescription,
                        overflow: TextOverflow.ellipsis,
                        style: FontTheme.customStyles['caption1Regular']
                            ?.copyWith(color: AppColors.labelSecondaryLight),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                Text(
                  '${widget.selectedAmount.toInt()} Vé',
                  style: FontTheme.customStyles['subheadlineEmphasized']
                      ?.copyWith(color: AppColors.labelPrimaryLight),
                ),
              ],
            )
          ],
        ));
  }
}
