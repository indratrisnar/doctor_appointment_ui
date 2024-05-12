import 'package:doctor_appointment_ui/dashboard_fragments/schedule_fragment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'dashboard_fragments/home_fragment.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int index = 0;

  List menu = [
    {
      'icon': 'assets/ic_home.png',
      'icon_active': 'assets/ic_home_active.png',
      'label': 'Home',
      'fragment': const HomeFragment(),
    },
    {
      'icon': 'assets/ic_calendar.png',
      'icon_active': 'assets/ic_calendar_active.png',
      'label': 'Schedule',
      'fragment': const ScheduleFragment(),
    },
    {
      'icon': 'assets/ic_message.png',
      'icon_active': 'assets/ic_message.png',
      'label': 'Chats',
      'fragment': const Center(child: Text('Chats')),
    },
    {
      'icon': 'assets/ic_profile.png',
      'icon_active': 'assets/ic_profile.png',
      'label': 'Profile',
      'fragment': const Center(child: Text('Profile')),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menu[index]['fragment'] as Widget,
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SalomonBottomBar(
          currentIndex: index,
          onTap: (newIndex) {
            index = newIndex;
            setState(() {});
          },
          itemShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          itemPadding: const EdgeInsets.all(12),
          selectedItemColor: const Color(0xff63B4FF),
          items: menu.map((item) {
            return SalomonBottomBarItem(
              icon: Image.asset(
                item['icon'],
                width: 24,
                height: 24,
              ),
              activeIcon: Image.asset(
                item['icon_active'],
                width: 24,
                height: 24,
              ),
              title: Text(
                item['label'],
                style: GoogleFonts.nunito().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              selectedColor: const Color(0xff63B4FF),
              unselectedColor: const Color(0xff8696BB),
            );
          }).toList(),
        ),
      ),
    );
  }
}
