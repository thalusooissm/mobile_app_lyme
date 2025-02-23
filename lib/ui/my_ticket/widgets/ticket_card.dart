import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/ui/setting/widgets/setting_item.dart';

import 'package:lyme_app/domain/models/ticket.dart';

class TicketCard extends StatefulWidget {
  final Ticket ticket;

  TicketCard({ required this.ticket});

  @override
  _TicketCardState createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/view_ticket');
    },
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isHovered ? AppColors.gray4 : AppColors.backgroundPrimary,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(width: 0.33, color: AppColors.nonOpaqueSeparator),
            boxShadow: [
              BoxShadow(
                color: AppColors.nonOpaqueSeparator,
                blurRadius: 32,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(6, 5, 6, 4),
                decoration: BoxDecoration(
                  border: Border(
                  bottom: BorderSide(width: 0.33, color: AppColors.nonOpaqueSeparator),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Mã vé: ',
                          style: FontTheme.customStyles['caption1Regular']?.copyWith(color: AppColors.labelSecondaryLight,)
                        ),
                        Text(widget.ticket.identityCode,
                        style: FontTheme.customStyles['caption1Regular']?.copyWith(color: AppColors.labelPrimaryLight,),)
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: AppColors.green
                      ),
                      child: Text(
                        'Chưa dùng',
                        style: FontTheme.customStyles['caption1Emphasized']?.copyWith(color: AppColors.labelPrimaryLight,),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(4, 8, 4, 4),
                decoration: BoxDecoration(),
                child: Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg'),
                        fit: BoxFit.fill
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: Border.all(width: 0.33, color: AppColors.nonOpaqueSeparator)
                    ),),
                    SizedBox(width: 8,),
                    Expanded(child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                            'Đây là tên sự kiện',
                            style: FontTheme.customStyles['subheadlineEmphasized']?.copyWith(color: AppColors.labelPrimaryLight,),
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                      SizedBox(height: 6,),
                      Row(
                        children: [
                          Icon(Icons.schedule_rounded, size: 16, color: AppColors.labelTertiaryLight,),
                          SizedBox(width: 4,),
                          Text(
                            '20:00, 20/10',
                            style: FontTheme.customStyles['caption1Regular']?.copyWith(color: AppColors.labelSecondaryLight,),
                          ),
                        ],
                      ),Row(
                        children: [
                          Icon(Icons.explore_rounded, size: 16, color: AppColors.labelTertiaryLight,),
                          SizedBox(width: 4,),
                          Text(
                            'TP.Hồ Chí Minh',
                            style: FontTheme.customStyles['caption1Regular']?.copyWith(color: AppColors.labelSecondaryLight,),
                          ),
                        ],
                      ),
                      ],
                    )),
                                        SizedBox(width: 8,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.fillTertiary,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            child: Center(
                              child: Row(
                                children: [
                                                            Text(
                            'Khu: ',
                            style: FontTheme.customStyles['footnoteEmphasized']?.copyWith(color: AppColors.labelPrimaryLight,),
                          ),
                          Text(
                            widget.ticket.area,
                            style: FontTheme.customStyles['footnoteEmphasized']?.copyWith(color: AppColors.labelPrimaryLight,),
                          ),

                                ],
                              ),
                            ),
                          ),
                                                    Container(
                            padding: EdgeInsets.symmetric(vertical: 2),
decoration: BoxDecoration(
  border: Border(
    bottom: BorderSide(
      color: AppColors.nonOpaqueSeparator, // Set the color of the bottom border
      width: 0.33, // Set the width of the bottom border
    ),
  ),
),                            child: Center(
                              child: Row(
                                children: [
                                                            Text(
                            'Hàng: ',
                            style: FontTheme.customStyles['footnoteEmphasized']?.copyWith(color: AppColors.labelPrimaryLight,),
                          ),
                          Text(
                            widget.ticket.row,
                            style: FontTheme.customStyles['footnoteEmphasized']?.copyWith(color: AppColors.labelPrimaryLight,),
                          ),

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

