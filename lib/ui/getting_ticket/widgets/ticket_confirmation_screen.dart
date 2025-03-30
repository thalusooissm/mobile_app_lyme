import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/components/buttons/text_icon_button.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/ui/getting_ticket/widgets/step_indicator.dart';
import 'package:lyme_app/ui/getting_ticket/widgets/ticket_confirmation_card.dart';
import 'package:lyme_app/ui/getting_ticket/widgets/ticket_type_select_card.dart';
import 'package:intl/intl.dart';

enum PaymentMethod { visa, napas, vnpay }

class TicketConfirmationScreen extends StatefulWidget {
  const TicketConfirmationScreen({Key? key}) : super(key: key);

  @override
  _TicketConfirmationScreenState createState() =>
      _TicketConfirmationScreenState();
}

class _TicketConfirmationScreenState extends State<TicketConfirmationScreen> {
  PaymentMethod? _selectedPaymentMethod = PaymentMethod.visa;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.backgroundPrimary,
      navigationBar: CupertinoNavigationBar(
        leading: GestureDetector(
          onTap: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.labelPrimaryLight,
            size: 20,
          ),
        ),
        middle: Text(
          'Xác nhận',
          style: FontTheme.customStyles['title3Emphasized']
              ?.copyWith(color: AppColors.labelPrimaryLight),
        ),
        backgroundColor: AppColors.backgroundPrimary,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: 100), // Ensure space for Summary Section
              child: Column(
                children: [
                  SizedBox(height: 16),
                  _buildEventInfo(),
                  SizedBox(height: 32),
                  _buildCountdownTimer(),
                  SizedBox(height: 32),
                  _buildTicketOptions(),
                  SizedBox(height: 32),
                  _buildPaymentSection(),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildSummarySection(), // Now sticks to the bottom
          ),
        ],
      ),
    );
  }

  Widget _buildEventInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ngày hội Bình đẳng giới được tổ chức bởi WTTTO',
                  style: FontTheme.customStyles['headlineRegular']
                      ?.copyWith(color: AppColors.labelPrimaryLight),
                  maxLines: 2,
                  softWrap: true,
                ),
                SizedBox(height: 4),
                Text(
                  '19:00 - 21:00, 21/08 (Ngày mai)',
                  style: FontTheme.customStyles['footnoteRegular']
                      ?.copyWith(color: AppColors.labelSecondaryLight),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownTimer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.fillPrimary,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Text(
              'Thời gian còn lại trước khi hết lượt mua này',
              style: FontTheme.customStyles['subheadlineRegular']
                  ?.copyWith(color: AppColors.labelPrimaryLight),
            ),
            SizedBox(height: 4),
            Text(
              '10:00',
              style: FontTheme.customStyles['title1Emphasized']
                  ?.copyWith(color: AppColors.labelPrimaryLight),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketOptions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 4),
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
                Text(
                  'Vé đã chọn',
                  style: FontTheme.customStyles['calloutEmphasized']
                      ?.copyWith(color: AppColors.labelSecondaryLight),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          TicketConfirmationCard(
            ticketName: 'Vé thường',
            ticketPrice: 50000,
            ticketDescription: 'Vé thường cho mọi người.',
            selectedAmount: 2,
          ),
          SizedBox(height: 8),
          TicketConfirmationCard(
            ticketName: 'Vé VIP',
            ticketPrice: 50000,
            ticketDescription: 'Vé với tầm nhìn đặt biệt.',
            selectedAmount: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 4),
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
                Text(
                  'Phương thức thanh toán',
                  style: FontTheme.customStyles['calloutEmphasized']
                      ?.copyWith(color: AppColors.labelSecondaryLight),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.fillSecondary,
            ),
            child: Column(
              children: <Widget>[
                _buildPaymentOption(
                    PaymentMethod.visa, 'Thanh toán bằng thẻ VISA'),
                _buildPaymentOption(
                    PaymentMethod.napas, 'Thanh toán bằng thẻ Napas'),
                _buildPaymentOption(
                    PaymentMethod.vnpay, 'Thanh toán bằng mã QR VNPAY'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(PaymentMethod method, String title) {
    return CupertinoListTile(
      padding: EdgeInsets.symmetric(vertical: 12),
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: FontTheme.customStyles['bodyRegular']
            ?.copyWith(color: AppColors.labelPrimaryLight),
      ),
      leading: CupertinoRadio<PaymentMethod>(
        fillColor: AppColors.primary,
        activeColor: AppColors.primary,
        value: method,
        groupValue: _selectedPaymentMethod,
        onChanged: (PaymentMethod? value) {
          setState(() {
            _selectedPaymentMethod = value;
          });
        },
      ),
    );
  }

  Widget _buildSummarySection() {
    return Stack(
      children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
                // decoration: BoxDecoration(
                //   color:
                //       AppColors.backgroundBlur75, // Ensure semi-transparent blur
                // ),
                ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 38),
          decoration: BoxDecoration(
            color:
                AppColors.backgroundBlur75, // Maintain blur effect visibility
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(16)), // Optional rounded corners
          ),
          child: Column(
            children: [
              StepIndicator(currentStep: 2),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow('Số vé: ', '4 VÉ'),
                        _buildInfoRow('Thanh toán: ', '1.500.000₫'),
                      ],
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    color: AppColors.primary,
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/payment_forward_request');
                    },
                    child: Text(
                      'Thanh Toán',
                      style: FontTheme.customStyles['headlineRegular']
                          ?.copyWith(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: FontTheme.customStyles['subheadlineRegular']
              ?.copyWith(color: AppColors.labelSecondaryLight),
        ),
        SizedBox(width: 4), // Add spacing for better readability
        Text(
          value,
          style: FontTheme.customStyles['bodyEmphasized']
              ?.copyWith(color: AppColors.labelPrimaryLight),
        ),
      ],
    );
  }
}
