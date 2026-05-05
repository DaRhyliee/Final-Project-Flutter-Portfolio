import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/portfolio_model.dart';
import 'profile_screen.dart';
import 'portfolio_screen.dart';
import 'academic_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ProfileScreen(portfolio: demoPortfolio),
    AcademicScreen(portfolio: demoPortfolio),
    PortfolioScreen(portfolio: demoPortfolio),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        selectedItemColor: AppTheme.primary,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'About Me'),
          BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined), label: 'Academic'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined), label: 'Portfolio'),
        ],
      ),
    );
  }
}
