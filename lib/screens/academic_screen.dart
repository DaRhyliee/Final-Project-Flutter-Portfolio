import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/portfolio_model.dart';
import '../widgets/app_bar_widget.dart';

class AcademicScreen extends StatelessWidget {
  final PortfolioModel portfolio;
  const AcademicScreen({super.key, required this.portfolio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: AppBarWidget(name: portfolio.name)),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const Text('Academic Background', style: AppTheme.titleStyle),
                const SizedBox(height: 20),

                _buildAcademicItem(
                  'Bachelor of Science in Computer Science',
                  'Manuel S. Enverga University Foundation',
                  '2024 - Present',
                ),

                _buildAcademicItem(
                  'Senior High School',
                  'Manuel S. Enverga Memorial School of Arts and Trades',
                  '2022 - 2023',
                ),

                _buildAcademicItem(
                  'Junior High School',
                  'Cagsiay 1 National High School',
                  '2018 - 2021',
                ),

                _buildAcademicItem(
                  'Junior High School',
                  'Poten Elisseo M. Quisada Memorial National High School',
                  '2016 - 2017',
                ),

                _buildAcademicItem(
                  'Elementary',
                  'Cagsiay 1 Elementary School',
                  '2010 - 2015',
                ),

                const Divider(height: 40),
                const Text('Skills & Expertise', style: AppTheme.titleStyle),
                const SizedBox(height: 16),

                // Keeping the Accordion for Skills
                _buildSkillAccordion('Leadership',
                    'Experienced in student government and project management.'),
                _buildSkillAccordion('Critical Thinking Skills',
                    'Applied in database design and logic simplification.'),
                _buildSkillAccordion('Creativity',
                    'Narrative-driven digital doodle art and storytelling.'),
                _buildSkillAccordion('Innovator',
                    'Blending technical infrastructure with intuitive design.'),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAcademicItem(String degree, String school, String years) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(degree,
              style: AppTheme.sectionHeaderStyle.copyWith(fontSize: 15)),
          Text(school, style: AppTheme.bodyStyle.copyWith(fontSize: 13)),
          Text(years, style: AppTheme.labelStyle),
        ],
      ),
    );
  }

  Widget _buildSkillAccordion(String skill, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppTheme.primaryPastel,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: const Icon(Icons.check_circle_outline,
              size: 20, color: AppTheme.primary),
          title: Text(
            skill,
            style: AppTheme.bodyStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(52, 0, 16, 16),
              child: Text(description, style: AppTheme.bodyStyle),
            ),
          ],
        ),
      ),
    );
  }
}
