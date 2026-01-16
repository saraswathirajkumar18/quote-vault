import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_vault/core/widgets/home_bottom_nav.dart';
import 'package:quote_vault/features/explore/view/explore_view.dart';
import 'package:quote_vault/features/home/view/screens/home_view.dart';
import 'package:quote_vault/features/home/viewmodel/navigation_view_model%20.dart';
import 'package:quote_vault/features/library/view/library_view.dart';
import 'package:quote_vault/features/profile/view/profile_view.dart';

class MainNav extends StatelessWidget {
  const MainNav({super.key});

  static final _screens = [
    const HomeView(),
    const ExploreView(),
    const LibraryView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationViewModel>();

    return Scaffold(
      body: _screens[nav.currentIndex],
      bottomNavigationBar: HomeBottomNav(
        currentIndex: nav.currentIndex,
        onTap: nav.changeTab,
      ),
    );
  }
}
