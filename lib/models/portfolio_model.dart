class PortfolioModel {
  final String name;
  final String title;
  final String email;
  final String bio;
  final int experience;
  final int clients;
  final int projectsCompleted;
  final List<SocialLink> socialLinks;
  final List<ProjectItem> projects;

  const PortfolioModel({
    required this.name,
    required this.title,
    required this.email,
    required this.bio,
    required this.experience,
    required this.clients,
    required this.projectsCompleted,
    required this.socialLinks,
    required this.projects,
  });
}

class SocialLink {
  final String platform;
  final String label;
  final String handle;
  final String iconAsset;

  const SocialLink({
    required this.platform,
    required this.label,
    required this.handle,
    required this.iconAsset,
  });
}

class ProjectItem {
  final String title;
  final String description;
  final String category;
  final String imageAsset;

  const ProjectItem({
    required this.title,
    required this.description,
    required this.category,
    required this.imageAsset,
  });
}

final demoPortfolio = PortfolioModel(
  name: 'Prince Raily Laurel',
  title: 'Computer Science | Multimedia Specialist | Data Analyst',
  email: 'princeraily2810@gmail.com',
  bio:
      "As a computer science innovator, front-end developer, and multimedia specialist, I am dedicated to pushing the boundaries of digital experiences. "
      "My academic journey at MSEUF has provided me with a rigorous technical foundation in Cisco networking and database architecture, allowing me to build applications that are as stable and secure as they are beautiful. "
      "By combining the logic of a data analyst with the eye of a multimedia artist, I specialize in creating narrative-driven digital art and high-performance user interfaces. "
      "I strive to innovate at the intersection of complex back-end systems and intuitive front-end design, turning abstract data into engaging visual stories.",
  experience: 1,
  clients: 10,
  projectsCompleted: 15,
  socialLinks: [
    SocialLink(
        platform: 'Instagram',
        label: 'Follow Me',
        handle: 'https://www.instagram.com/rhylii_e/',
        iconAsset: 'assets/insta.png'),
    SocialLink(
        platform: 'GitHub',
        label: 'See My Code',
        handle: 'https://github.com/DaRhyliee',
        iconAsset: 'assets/gitshub.png'),
    SocialLink(
        platform: 'Facebook',
        label: 'Connect',
        handle: 'https://www.facebook.com/raily.laurel.3',
        iconAsset: 'assets/face.png'),
  ],
  projects: [
    ProjectItem(
      title: 'EUventure',
      description:
          'Digitizing Euthenics courses and university orientation, AdaVizion turns passive learning into an active, location-based adventure. Students dont just read about university history—they explore it, unlock it, and earn achievements for mastering it.',
      category: 'App',
      imageAsset: 'assets/Euventured.png',
    ),
    ProjectItem(
      title: 'Gala',
      description:
          'An AI travelling start-up that optimizes your tourism experience. Awarded as the best pitchdeck design in Enverga Innovation Challenge and a Top 15 start-up in Philippine Start up Competition Region 4A, having the award of thee best logo start-up.',
      category: 'Startup',
      imageAsset: 'assets/Galad.png',
    ),
  ],
);
