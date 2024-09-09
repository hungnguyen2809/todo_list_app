import 'package:flutter/material.dart';
import 'package:todo_list_app/contains/ui.dart';
import 'package:todo_list_app/ui/calendar/calendar.dart';
import 'package:todo_list_app/ui/focuse/focuse.dart';
import 'package:todo_list_app/ui/home/home.dart';
import 'package:todo_list_app/ui/profile/profile.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late int _tabIndex;
  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();

    _tabIndex = 0;
    _tabs = [
      const HomeScreen(),
      const CalendarScreen(),
      Container(),
      const FocuseScreen(),
      const ProfileScreen(),
    ];
  }

  void _onChangeTab(int index) {
    if (index == 2) return;

    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIContains.blackBackground,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onChangeTab,
        currentIndex: _tabIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF363636),
        unselectedItemColor: Colors.white,
        selectedItemColor: UIContains.colorPrimary,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            backgroundColor: const Color(0xFF363636),
            icon: Image.asset(UIContains.tab_bar_home),
            activeIcon: Image.asset(UIContains.tab_bar_home, color: UIContains.colorPrimary),
          ),
          BottomNavigationBarItem(
            label: "Calendar",
            backgroundColor: const Color(0xFF363636),
            icon: Image.asset(UIContains.tab_bar_calendar),
            activeIcon: Image.asset(UIContains.tab_bar_calendar, color: UIContains.colorPrimary),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(),
            backgroundColor: const Color(0xFF363636),
          ),
          BottomNavigationBarItem(
            label: "Focuse",
            backgroundColor: const Color(0xFF363636),
            icon: Image.asset(UIContains.tab_bar_clock),
            activeIcon: Image.asset(UIContains.tab_bar_clock, color: UIContains.colorPrimary),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            backgroundColor: const Color(0xFF363636),
            icon: Image.asset(UIContains.tab_bar_user),
            activeIcon: Image.asset(UIContains.tab_bar_user, color: UIContains.colorPrimary),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: UIContains.colorPrimary,
          borderRadius: BorderRadius.circular(32),
        ),
        child: IconButton(onPressed: () {}, icon: const Icon(Icons.add, size: 30, color: Colors.white)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _tabs[_tabIndex],
    );
  }
}
