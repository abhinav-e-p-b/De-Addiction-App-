enum ContentType { quote, story, tip, resource, program, video }

class ContentItem {
  final String id;
  final ContentType type;
  final String title;
  final String? subtitle;
  final String? author;
  final String? readTime;
  final String? imageUrl;
  final bool isFeatured;
  final DateTime publishedAt;

  const ContentItem({
    required this.id,
    required this.type,
    required this.title,
    this.subtitle,
    this.author,
    this.readTime,
    this.imageUrl,
    this.isFeatured = false,
    required this.publishedAt,
  });

  String get typeLabel => switch (type) {
    ContentType.quote    => 'Quote',
    ContentType.story    => 'Story',
    ContentType.tip      => 'Tip',
    ContentType.resource => 'Resource',
    ContentType.program  => 'Program',
    ContentType.video    => 'Video',
  };
}

/// Static seed data — replace with API/Firestore in production
class ContentRepository {
  static List<ContentItem> get ujjwalFeed => [
    ContentItem(
      id: 'aff_001',
      type: ContentType.quote,
      title: 'Every moment sober is a victory worth celebrating.',
      author: 'Daily Affirmation',
      isFeatured: true,
      publishedAt: DateTime.now(),
    ),
    ContentItem(
      id: 'story_001',
      type: ContentType.story,
      title: 'Finding My Shore',
      subtitle:
          'How meditation became a cornerstone of recovery for Sarah after ten years of struggle.',
      author: 'Sarah J.',
      readTime: '8 min read',
      publishedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    ContentItem(
      id: 'quote_001',
      type: ContentType.quote,
      title: '"The comeback is always stronger than the setback."',
      author: '— Recovery Wisdom',
      publishedAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    ContentItem(
      id: 'quote_002',
      type: ContentType.quote,
      title: '"Progress, not perfection."',
      author: '— AA Principle',
      publishedAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
    ContentItem(
      id: 'quote_003',
      type: ContentType.quote,
      title: '"You are braver than you believe."',
      author: '— A.A. Milne',
      publishedAt: DateTime.now().subtract(const Duration(days: 4)),
    ),
    ContentItem(
      id: 'quote_004',
      type: ContentType.quote,
      title: '"One day at a time — some days, one moment at a time."',
      author: '— Anon',
      publishedAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
  ];

  static List<ContentItem> get hubContent => [
    ContentItem(
      id: 'hub_story_001',
      type: ContentType.story,
      title: 'Finding stillness in the noise',
      subtitle:
          'How meditation became a cornerstone of recovery for Sarah after ten years of struggle.',
      author: 'By Sarah J.',
      readTime: '8 min read',
      isFeatured: true,
      publishedAt: DateTime.now(),
    ),
    ContentItem(
      id: 'hub_tip_001',
      type: ContentType.tip,
      title: 'The 5-minute rule',
      subtitle:
          'Cravings peak and fade within 15–20 minutes. Wait just 5 minutes and you\'re halfway there.',
      publishedAt: DateTime.now(),
    ),
    ContentItem(
      id: 'hub_resource_001',
      type: ContentType.resource,
      title: 'Journal Prompts',
      publishedAt: DateTime.now(),
    ),
    ContentItem(
      id: 'hub_program_001',
      type: ContentType.program,
      title: 'Local Meetups',
      publishedAt: DateTime.now(),
    ),
    ContentItem(
      id: 'hub_program_002',
      type: ContentType.program,
      title: 'Breathwork 101: A Beginner\'s Path',
      subtitle: 'Starting tomorrow · 6:00 PM',
      publishedAt: DateTime.now(),
    ),
  ];
}
