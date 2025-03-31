import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class ViewTicketScreen extends StatefulWidget {
  @override
  _ViewTicketScreenState createState() => _ViewTicketScreenState();
}

class _ViewTicketScreenState extends State<ViewTicketScreen> {
  void openShareBottomSheet(BuildContext context) {
    print('Opening bottom sheet...');
    setState(() {
      _isDialogOpen = true;
    });
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              height: 600,
              width: double.infinity,
              color: AppColors.backgroundPrimary,
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gửi vé',
                        style: FontTheme.customStyles['title3Emphasized']
                            ?.copyWith(color: AppColors.labelPrimaryLight),
                      ),
                      CupertinoButton(
                        minSize: 0.0,
                        color: AppColors.fillSecondary,
                        padding: EdgeInsets.all(4),
                        borderRadius: BorderRadius.circular(20),
                        onPressed: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.close_rounded,
                          color: AppColors.labelSecondaryLight,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  CupertinoSearchTextField(
                    itemColor: AppColors.labelPrimaryLight,
                    placeholder: 'Tìm kiếm',
                    autofocus: false,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                      child: SingleChildScrollView(
                          child: buildDummyFriendList(context))),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  bool _isDialogOpen = false;

  Widget _buildFriendCard(
      {required String name,
      required String imageUrl,
      required String email,
      required String userName,
      required Function() onTap}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                width: 0.33,
                color: AppColors.nonOpaqueSeparator,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: FontTheme.customStyles['subheadlineEmphasized']
                          ?.copyWith(color: AppColors.labelPrimaryLight),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      userName,
                      style: FontTheme.customStyles['footnoteRegular']
                          ?.copyWith(color: AppColors.primary),
                    ),
                    Expanded(
                      child: Text(
                        ' / $email',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: FontTheme.customStyles['footnoteRegular']
                            ?.copyWith(color: AppColors.labelSecondaryLight),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          CupertinoButton(
            minSize: 0.0,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            borderRadius: BorderRadius.circular(20),
            color: AppColors.primary,
            onPressed: () => openShareConfirmDialog(context, name),
            child: Text(
              'Gửi',
              style: FontTheme.customStyles['subheadlineRegular']
                  ?.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }

  void closeAllDialogs(BuildContext context) {
    if (_isDialogOpen) {
      Navigator.of(context).pop(); // Close the CupertinoAlertDialog
      setState(() {
        _isDialogOpen = false;
      });
    }
    Navigator.of(context).pop(); // Close the Bottom Sheet
  }

  void openShareConfirmDialog(BuildContext context, String selectedFriendName) {
    setState(() {
      _isDialogOpen = true;
    });
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          "Gửi vé cho $selectedFriendName",
          style: FontTheme.customStyles['headlineRegular']
              ?.copyWith(color: AppColors.labelPrimaryLight),
        ),
        content: Text(
          "Sau khi gửi, bạn chỉ có thể nhận lại vé khi người được gửi Từ chối.",
          style: FontTheme.customStyles['footnoteRegular']
              ?.copyWith(color: AppColors.labelPrimaryLight),
        ),
        actions: [
          CupertinoDialogAction(
            child: Text(
              'Huỷ',
              style: FontTheme.customStyles['bodyRegular']
                  ?.copyWith(color: AppColors.primary),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text(
              'Gửi',
              style: FontTheme.customStyles['bodyEmphasized']
                  ?.copyWith(color: AppColors.primary),
            ),
            onPressed: () {
              closeAllDialogs(context);
              setState(() {
                _hasShared = true;
              });
              showCustomOverlayToast(
                  context,
                  "Vé vừa được gửi tới $selectedFriendName. Nhớ nhắc nhở bạn ấy phản hồi Vé đã gửi nhé Lực ơi!",
                  Icons.done_all);
            },
          ),
        ],
      ),
    );
  }

  void showCustomOverlayToast(
      BuildContext context, String message, IconData icon) {
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned(
            bottom: 60,
            left: 16,
            right: 16,
            child: Material(
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12), // Rounded corners
                child: BackdropFilter(
                  filter:
                      ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur on Toast
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha((0.5 * 255).toInt()),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha((0.3 * 255).toInt()),
                          blurRadius: 100,
                          offset: Offset(0, 10), // Shadow effect
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(icon,
                            color: AppColors.labelSecondaryLight, size: 24),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            message,
                            style: FontTheme.customStyles['footnoteRegular']
                                ?.copyWith(
                                    color: AppColors.labelSecondaryLight),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  bool _hasShared = false;

  Widget buildDummyFriendList(BuildContext context) {
    final List<Map<String, String>> dummyFriends = [
      {
        'name': 'Trần Mỹ Lan',
        'imageUrl':
            'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-6/487395788_1334465281036132_7457939977975030324_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=WhqXB_leM5YQ7kNvgGxU6YM&_nc_oc=Adm0q_00GJkbPa0PIPjZkX8Sj4gfCSYQRcxj3FRKxXWyvMhNGsxjiivSykpWfhB0mmU&_nc_zt=23&_nc_ht=scontent.fsgn2-4.fna&_nc_gid=uBgz7FUbDd17YpwZXD-dvw&oh=00_AYGURUP4KB5VM4ULSpjDlcDlPVInrKp2tmG0TPzeeBRmfQ&oe=67EF079C',
        'email': 'mymancute.johnson@example.com',
        'userName': 'mymancute'
      },
      {
        'name': 'Trần Mỹ Lệ',
        'imageUrl':
            'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-6/487395788_1334465281036132_7457939977975030324_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=WhqXB_leM5YQ7kNvgGxU6YM&_nc_oc=Adm0q_00GJkbPa0PIPjZkX8Sj4gfCSYQRcxj3FRKxXWyvMhNGsxjiivSykpWfhB0mmU&_nc_zt=23&_nc_ht=scontent.fsgn2-4.fna&_nc_gid=uBgz7FUbDd17YpwZXD-dvw&oh=00_AYGURUP4KB5VM4ULSpjDlcDlPVInrKp2tmG0TPzeeBRmfQ&oe=67EF079C',
        'email': 'mylecutene.williams@example.com',
        'userName': 'mylecutene'
      },
      {
        'name': 'Trần Mỹ Hạnh',
        'imageUrl':
            'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-6/487395788_1334465281036132_7457939977975030324_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=WhqXB_leM5YQ7kNvgGxU6YM&_nc_oc=Adm0q_00GJkbPa0PIPjZkX8Sj4gfCSYQRcxj3FRKxXWyvMhNGsxjiivSykpWfhB0mmU&_nc_zt=23&_nc_ht=scontent.fsgn2-4.fna&_nc_gid=uBgz7FUbDd17YpwZXD-dvw&oh=00_AYGURUP4KB5VM4ULSpjDlcDlPVInrKp2tmG0TPzeeBRmfQ&oe=67EF079C',
        'email': 'mylancutene.brown@example.com',
        'userName': 'mylancutene'
      },
    ];

    return Column(
      children: dummyFriends.map((friend) {
        return _buildFriendCard(
          name: friend['name']!,
          imageUrl: friend['imageUrl']!,
          email: friend['email']!,
          userName: friend['userName']!,
          onTap: () => openShareConfirmDialog(context, friend['name']!),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticBackgroundVisibility: false,
        backgroundColor: Colors.transparent,
        border: Border(),
        middle: Text(
          'Vé',
          style: FontTheme.customStyles['bodyEmphasized']
              ?.copyWith(color: AppColors.labelPrimaryDark),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.labelPrimaryDark,
            size: 20,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
                children: [
                  SizedBox(height: 16),
                  _buildEventInfoSection(),
                  SizedBox(height: 8),
                  _buildTicketSection(),
                  SizedBox(height: 8),
                  _buildButtonSection(this.context),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomButton(),
          )
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
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
              'Sử dụng vé',
              style: FontTheme.customStyles['headlineRegular']
                  ?.copyWith(color: AppColors.white),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/qr');
            }),
      ),
    );
  }

  Widget _buildEventInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.backgroundBlur75,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.33, color: AppColors.nonOpaqueSeparator),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Triển lãm Những Địa hạt Phù du',
              style: FontTheme.customStyles['subheadlineEmphasized']
                  ?.copyWith(color: AppColors.labelPrimaryLight),
              softWrap: true,
              maxLines: 2,
            ),
            const SizedBox(height: 4),
            Divider(
              thickness: 0.33,
              color: AppColors.nonOpaqueSeparator,
            ),
            const SizedBox(height: 8),
            _buildEventDetail(
              icon: Icons.alarm_rounded,
              title: 'Hôm nay, 21 Tháng 12, 2024',
              subtitle: '20:00 - 23:00',
            ),
            const SizedBox(height: 12),
            _buildEventDetail(
              icon: Icons.location_on_outlined,
              title: 'Nhà hát ABCD',
              subtitle:
                  '120/32 Thích Quảng Đức, Phường 5, Quận Phú Nhuận, TP. Hồ Chí Minh',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventDetail(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIconContainer(icon),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: FontTheme.customStyles['footnoteRegular']
                    ?.copyWith(color: AppColors.labelPrimaryLight),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                softWrap: true,
                style: FontTheme.customStyles['footnoteRegular']
                    ?.copyWith(color: AppColors.labelSecondaryLight),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconContainer(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 0.33, color: AppColors.nonOpaqueSeparator),
        borderRadius: BorderRadius.circular(12),
        color: AppColors.fillQuaternary,
      ),
      child: Icon(
        icon,
        size: 20,
        color: AppColors.labelPrimaryLight,
      ),
    );
  }

  Widget _buildTicketSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1.0, // Ensures the container is a square
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    width: 0.33, color: AppColors.nonOpaqueSeparator),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(12)),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY: 15), // Reduce blur for better readability
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundBlur75,
                    border: Border(
                      top: BorderSide(
                          width: 0.33, color: AppColors.nonOpaqueSeparator),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTicketInfoText('Vé mua ngày 12/12/2024.',
                          FontTheme.customStyles['caption1Regular']),
                      const SizedBox(height: 4),
                      _buildTicketDetailRow('Loại vé:', 'Đỉnh nóc'),
                      const SizedBox(height: 4),
                      Divider(
                          color: AppColors.nonOpaqueSeparator, thickness: 0.33),
                      const SizedBox(height: 8),
                      _buildTicketDetailRow('Khu vực', 'A / Hàng 12'),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTicketDetailRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: FontTheme.customStyles['subheadlineRegular']
              ?.copyWith(color: AppColors.labelSecondaryLight),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: FontTheme.customStyles['subheadlineEmphasized']
              ?.copyWith(color: AppColors.labelPrimaryLight),
        ),
      ],
    );
  }

  Widget _buildTicketInfoText(String text, TextStyle? style) {
    return Text(
      text,
      style: style?.copyWith(color: AppColors.labelSecondaryLight),
    );
  }

  Widget _buildButtonSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: _buildButton(
              icon: Icons.festival_rounded,
              label: 'Xem sự kiện',
              onPressed: () => Navigator.of(context).pushNamed('/event_detail'),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildButton(
              icon: Icons.arrow_circle_up_rounded,
              label: 'Gửi vé',
              onPressed:
                  _hasShared ? null : () => openShareBottomSheet(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed, // Make it nullable
  }) {
    final bool isDisabled = onPressed == null;
    return CupertinoButton(
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      color: AppColors.gray5,
      padding: const EdgeInsets.symmetric(vertical: 16),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              color: isDisabled
                  ? AppColors.labelSecondaryLight
                  : AppColors.primary,
              size: 22),
          const SizedBox(width: 4),
          Text(
            label,
            style: FontTheme.customStyles['headlineRegular']?.copyWith(
              color: isDisabled
                  ? AppColors.labelSecondaryLight
                  : AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
