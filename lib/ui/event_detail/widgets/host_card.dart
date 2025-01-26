import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';


import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

import 'package:lyme_app/domain/models/host.dart';

class HostCard extends StatefulWidget {
  final Host host;

  HostCard({required this.host});

  @override
  _HostCardState createState() => _HostCardState();
}

class _HostCardState extends State<HostCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 0.33,
              color: AppColors.nonOpaqueSeparator,
            ),
            image: DecorationImage(
              image: NetworkImage(widget.host.avatar),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.33,
                  color: AppColors.nonOpaqueSeparator,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.host.fullName,
                          style: FontTheme.customStyles['subheadlineEmphasized']?.copyWith(
                            color: AppColors.labelPrimaryDark,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                                            Text(
                      ' / ',
                      style: FontTheme.customStyles['footnoteRegular']?.copyWith(
                        color: AppColors.labelSecondaryDark,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.host.hostType,
                      style: FontTheme.customStyles['footnoteRegular']?.copyWith(
                        color: AppColors.labelSecondaryDark,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                      ],
                    ),
                    SizedBox(height: 2),
                        Text(
                          widget.host.bio ?? '',
                          style: FontTheme.customStyles['footnoteRegular']?.copyWith(
                            color: AppColors.labelSecondaryDark,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                  ],
                )
                ),
                SizedBox(width: 8),
                Row(children: [
                  widget.host.fbLink != null ? GestureDetector(
                    child: SvgPicture.asset('icons/fb_icon.svg'),
                    onTap: () {
                      // Open Facebook link
                    },
                  ) : SizedBox(),
                  SizedBox(width: 8),
                  widget.host.instaLink != null ? GestureDetector(
                    child: SvgPicture.asset('icons/insta_icon.svg'),
                    onTap: () {
                      // Open Instagram link
                    },
                  ) : SizedBox(),
                  SizedBox(width: 8),
                  widget.host.xLink != null ? GestureDetector(
                    child: SvgPicture.asset('icons/x_icon.svg'),
                    onTap: () {
                      // Open X link
                    },
                  ) : SizedBox(),
                ],)
              ],
            ),
          )
        ),
      ],
    );
  }
}