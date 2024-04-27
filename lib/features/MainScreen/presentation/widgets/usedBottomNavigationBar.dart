import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utilies/appColors.dart';

class UsedBottomNavBar extends StatelessWidget {
  UsedBottomNavBar({super.key, required this.index, required this.onClick});

  int index;
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: index,
        onTap: (value) {
          onClick(value);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.yellowColor,
        unselectedItemColor: AppColors.grayColor,
        iconSize: 28.sp,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Browse"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: "WatchList"),
        ]);
  }
}
