import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/portfolio_model.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/social_pill.dart';
import '../widgets/project_card.dart';

class PortfolioScreen extends StatelessWidget {
  final PortfolioModel portfolio;
  const PortfolioScreen({super.key, required this.portfolio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: _buildHeroImage(context)),
          SliverToBoxAdapter(child: _buildSocialRow()),
          SliverToBoxAdapter(child: _buildExperiencesSection()),
          SliverToBoxAdapter(child: _buildProjectsSection()),
        ],
      ),
    );
  }

  Widget _buildHeroImage(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppTheme.primaryPastel,
                AppTheme.primary.withOpacity(0.4),
              ],
            ),
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/port.png',
                      fit: BoxFit.cover,
                      alignment: const Alignment(0, -0.6),
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppTheme.primary.withOpacity(0.1),
                          child: const Icon(
                            Icons.person,
                            size: 80,
                            color: AppTheme.primary,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBarWidget(name: portfolio.name),
        ),
      ],
    );
  }

  Widget _buildSocialRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            portfolio.socialLinks.map((s) => SocialPill(link: s)).toList(),
      ),
    );
  }

  Widget _buildExperiencesSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Professional Path', style: AppTheme.sectionHeaderStyle),
          const SizedBox(height: 4),
          const Text('Key Roles & Milestones', style: AppTheme.titleStyle),
          const SizedBox(height: 16),
          _buildAccordionItem(
            icon: Icons.rocket_launch_outlined,
            title: 'Start-up Innovator',
            subtitle: 'Founder & Tech Lead',
            content:
                'Led the development of digital products and managed cross-functional teams to deliver high-performance user interfaces.',
          ),
          _buildAccordionItem(
            icon: Icons.article_outlined,
            title: 'Journalist',
            subtitle: 'Multimedia Specialist',
            content:
                'Crafted narrative-driven stories and visual content, covering university events and student government elections.',
          ),
          _buildAccordionItem(
            icon: Icons.code_rounded,
            title: 'Hackathon Competitor',
            subtitle: 'Full-stack Developer',
            content:
                'Designed complex database architectures and solved algorithm logic puzzles under tight deadlines.',
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Download Full Resume'),
            ),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }

  Widget _buildAccordionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppTheme.primaryPastel.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primary.withOpacity(0.1)),
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Icon(icon, color: AppTheme.primary),
          title: Text(title,
              style: AppTheme.sectionHeaderStyle
                  .copyWith(color: AppTheme.textDark, fontSize: 14)),
          subtitle: Text(subtitle, style: AppTheme.labelStyle),
          iconColor: AppTheme.primary,
          collapsedIconColor: AppTheme.textLight,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(content, style: AppTheme.bodyStyle),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Recognized', style: AppTheme.sectionHeaderStyle),
          const SizedBox(height: 4),
          const Text('Selected Projects', style: AppTheme.titleStyle),
          const SizedBox(height: 8),
          Text(
            "It's time to see some work. Here are a my best projects tha I've been apart with.",
            style: AppTheme.bodyStyle,
          ),
          const SizedBox(height: 20),
          ...portfolio.projects.map((p) => ProjectCard(project: p)).toList(),
        ],
      ),
    );
  }
}
