import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/portfolio_model.dart';
import '../widgets/app_bar_widget.dart';

class ProfileScreen extends StatelessWidget {
  final PortfolioModel portfolio;
  const ProfileScreen({super.key, required this.portfolio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildHeader(context),
            _buildInfoCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const double headerHeight = 400.0;

    return SizedBox(
      height: headerHeight,
      width: screenWidth,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppTheme.primaryPastel, AppTheme.background],
                ),
              ),
            ),
          ),

          Positioned(
            left: -screenWidth * 0.2,
            top: -50,
            child: _buildDecorCircle(screenWidth * 0.8, 0.15),
          ),
          Positioned(
            right: -screenWidth * 0.1,
            bottom: 20,
            child: _buildDecorCircle(screenWidth * 0.6, 0.2),
          ),

          Positioned(
            bottom: 20,
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 8),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const ClipOval(
                child: Image(
                  image: AssetImage('assets/profile.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment(0, -0.6),
                ),
              ),
            ),
          ),

          // 4. App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBarWidget(name: portfolio.name),
          ),
        ],
      ),
    );
  }

  // Helper for more visible decorative circles
  Widget _buildDecorCircle(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            const Color.fromARGB(255, 8, 88, 141).withOpacity(opacity),
            AppTheme.primary.withOpacity(0),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(portfolio.name, style: AppTheme.nameStyle),
          const SizedBox(height: 4),
          Text(
            portfolio.title,
            style: AppTheme.titleStyle.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 16),
          Text(portfolio.bio, style: AppTheme.bodyStyle),
          const SizedBox(height: 32),
          const Text("Specializations",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildSkillChip("UI/UX Designer"),
              _buildSkillChip("Front-end Developer"),
              _buildSkillChip("Data Analyst"),
              _buildSkillChip("Research Expert"),
            ],
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.primaryPastel.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primary.withOpacity(0.2)),
      ),
      child: Text(label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }
}
