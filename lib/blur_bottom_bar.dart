library blur_bottom_bar;

import 'dart:ui';
import 'package:flutter/material.dart';

class BlurBottomView extends StatelessWidget {
  final bool showSelectedLabels;
  final bool showUnselectedLabels;
  final VoidCallback onClick;
  final double filterX;
  final double filterY;
  final double opacity;
  final Color backgroundColor;
  final BottomNavigationBarType bottomNavigationBarType;
  final int currentIndex;
  final List<BottomNavigationBarItem> bottomNavigationBarItems;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Function(int) onIndexChange;

  const BlurBottomView(
      {Key key,
        this.showSelectedLabels   = false,
        this.showUnselectedLabels = false,
        this.onClick,
        this.filterX = 5.0,
        this.filterY = 10.0,
        this.opacity = 0.8,
        this.backgroundColor = Colors.black,
        this.bottomNavigationBarType = BottomNavigationBarType.fixed,
        this.currentIndex = 0,
        this.onIndexChange,
        @required this.bottomNavigationBarItems,
        this.selectedItemColor = Colors.blue,
        this.unselectedItemColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: ClipRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: filterX,
                  sigmaY: filterY,
                ),
                child: Opacity(
                  opacity: opacity,
                  child: BottomNavigationBar(
                    showSelectedLabels: showSelectedLabels,
                    showUnselectedLabels: showUnselectedLabels,
                    backgroundColor: backgroundColor,
                    type: bottomNavigationBarType,
                    items: bottomNavigationBarItems,
                    currentIndex: currentIndex,
                    selectedItemColor: selectedItemColor,
                    unselectedItemColor: unselectedItemColor,
                    onTap: (index) {
                      onIndexChange(index);
                    },
                  ),
                ))));
  }
}
