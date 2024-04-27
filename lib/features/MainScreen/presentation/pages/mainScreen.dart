import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/Browse/presentation/pages/browseTab.dart';
import 'package:movies/features/Home/presentation/pages/homeTab.dart';
import 'package:movies/features/MainScreen/presentation/widgets/searchAppBar.dart';
import 'package:movies/features/Search/presentation/pages/searchTab.dart';
import 'package:movies/features/WatchList/presentation/pages/watchListTab.dart';

import '../../../../core/utilies/appColors.dart';
import '../widgets/usedBottomNavigationBar.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [HomeTab(), SearchTab(), BrowseTab(), WatchListTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: UsedBottomNavBar(
        index: selectedIndex,
        onClick: (value) {
          selectedIndex = value;
          setState(() {});
        },
      ),
      body: tabs[selectedIndex],
    );
  }
}
