import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

import 'package:lyme_app/data/services/api/models/tickets_service.dart';
import 'package:lyme_app/domain/models/ticket.dart';
import 'package:lyme_app/ui/home/widgets/home_trail_button.dart';
import 'package:lyme_app/ui/my_ticket/widgets/ticket_card.dart';
import 'package:lyme_app/ui/my_ticket/widgets/label_filter.dart';

class MyTicketScreen extends StatefulWidget {
  @override
  State<MyTicketScreen> createState() => _MyTicketScreenState();
}

class _MyTicketScreenState extends State<MyTicketScreen> {
  late Future<List<Ticket>> _ticketsFuture;

  List<Map<String, dynamic>> dummyData = [
    {'label': 'Tất cả', 'isSelected': true},
    {'label': 'Chưa dùng', 'isSelected': false},
    {'label': 'Đã nhận', 'isSelected': false},
    {'label': 'Đã dùng', 'isSelected': false},
    {'label': 'Đã chia sẻ', 'isSelected': false},
  ];

  @override
  void initState() {
    super.initState();
    _ticketsFuture = _initializeTickets();
  }

  void toggleSelection(int index) {
    setState(() {
      for (var item in dummyData) {
        item['isSelected'] = false;
      }
      dummyData[index]['isSelected'] = true;
    });
  }

  Future<List<Ticket>> _initializeTickets() async {
    await TicketsService.connect();
    final data = await TicketsService.getAllTickets();
    if (data.isEmpty) {
      print('No events found in the database.');
      return [];
    }
    return data.map((map) => Ticket.fromMap(map)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.backgroundPrimary,
      navigationBar: CupertinoNavigationBar(
        trailing: MainTrailButton(context: context),
        leading: Row(
          mainAxisSize: MainAxisSize.min, // Ensure minimal width
          children: [
            Text(
              'Vé Của Tôi',
              style: FontTheme.customStyles['title3Emphasized']
                  ?.copyWith(color: AppColors.labelPrimaryLight),
            ),
            SizedBox(width: 8),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/vector.png'), // Fixed path
                  fit: BoxFit.fill,
                  scale: 1.5,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.backgroundPrimary, // More readable opacity
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dummyData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: index == 0
                                  ? 16
                                  : 8, // First item left padding
                              right: index == dummyData.length - 1
                                  ? 16
                                  : 0, // Last item right padding
                            ),
                            child: GestureDetector(
                              onTap: () => toggleSelection(index),
                              child: LabelFilter(
                                label: dummyData[index]['label'],
                                isSelected: dummyData[index]['isSelected'],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16), // Add 16 units of space
              // FutureBuilder to handle async data and build UI accordingly
              FutureBuilder<List<Ticket>>(
                future: _ticketsFuture,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Ticket>> snapshot) {
                  // Check for loading state
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CupertinoActivityIndicator());
                  }
                  // Check for error state
                  else if (snapshot.hasError) {
                    return Center(child: Text('Something went wrong!'));
                  }
                  // Check if there is data
                  else if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Center(child: Text('No tickets available.'));
                    }
                    // Display the list of tickets using TicketCard
                    return ListView.builder(
                      shrinkWrap:
                          true, // To ensure the list view does not take up unnecessary space
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16,
                              0), // Add 16 units of space at the bottom
                          child: TicketCard(ticket: snapshot.data![index]),
                        );
                      },
                    );
                  }
                  // Default case
                  return Center(child: Text('No tickets available.'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
