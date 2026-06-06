import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PosterNova',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Modern Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchBar(
                hintText: 'Search templates...',
                leading: const Icon(Icons.search),
                elevation: WidgetStateProperty.all(0),
                backgroundColor: WidgetStateProperty.all(
                  theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            // Horizontal Categories
            const _CategoryList(),

            const SizedBox(height: 24),

            // Trending Templates Section
            _SectionHeader(
              title: 'Trending Templates',
              onTap: () {},
            ),
            const _HorizontalTemplateList(seedOffset: 10),

            const SizedBox(height: 24),

            // Recently Added Section
            _SectionHeader(
              title: 'Recently Added',
              onTap: () {},
            ),
            const _HorizontalTemplateList(seedOffset: 20),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList();

  final List<String> categories = const [
    'Festival',
    'Business',
    'WhatsApp',
    'Premium',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Text(categories[index]),
              onSelected: (bool value) {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _SectionHeader({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          TextButton(
            onPressed: onTap,
            child: const Text('See all'),
          ),
        ],
      ),
    );
  }
}

class _HorizontalTemplateList extends StatelessWidget {
  final int seedOffset;
  const _HorizontalTemplateList({required this.seedOffset});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(
                  'https://picsum.photos/seed/${index + seedOffset}/300/450',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: IconButton.filledTonal(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border, size: 20),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}