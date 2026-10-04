import 'package:flutter/material.dart';
import '../controllers/workout_controller.dart';
import '../theme/app_theme.dart';
import 'category_workout_list_screen.dart';

class ExerciseLibraryScreen extends StatefulWidget {
  final WorkoutController workoutController;

  const ExerciseLibraryScreen({super.key, required this.workoutController});

  @override
  State<ExerciseLibraryScreen> createState() => _ExerciseLibraryScreenState();
}

class _ExerciseLibraryScreenState extends State<ExerciseLibraryScreen> {
  final TextEditingController _searchController = TextEditingController();

  String _query = '';

  final List<_LibraryCategory> _categories = const [
    _LibraryCategory(
      name: 'Chest Workouts',
      category: 'Chest',
      count: 24,
      badge: 'ATTACK +15',
      image: 'docs/assets/images/chest_workouts.png',
    ),
    _LibraryCategory(
      name: 'Arm Workouts',
      category: 'Arms',
      count: 18,
      badge: 'POWER +18',
      image: 'docs/assets/images/arm_workouts.png',
    ),
    _LibraryCategory(
      name: 'Legs Workouts',
      category: 'Legs',
      count: 22,
      badge: 'DEFENSE +20',
      image: 'docs/assets/images/leg_workouts.png',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      setState(() {
        _query = _searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<_LibraryCategory> get _filteredCategories {
    if (_query.isEmpty) {
      return _categories;
    }

    return _categories
        .where((category) => category.name.toLowerCase().contains(_query))
        .toList();
  }

  void _openCategory(_LibraryCategory category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CategoryWorkoutListScreen(
          category: category.category,
          title: category.name,
          workoutController: widget.workoutController,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = _filteredCategories;

    final totalExercises = _categories.fold<int>(
      0,
      (sum, category) => sum + category.count,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Exercise Library')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.screen),
        children: [
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search muscle groups',
              prefixIcon: Icon(Icons.search),
            ),
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MUSCLE GROUP CATEGORIES',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.6,
                ),
              ),
              Text(
                '$totalExercises Total',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),

          const SizedBox(height: 14),

          if (categories.isEmpty)
            Container(
              padding: const EdgeInsets.all(24),
              decoration: AppTheme.cardDecoration(context, radius: 18),
              child: const Text(
                'No muscle group matched your search.',
                textAlign: TextAlign.center,
              ),
            )
          else
            for (final category in categories) ...[
              _CategoryCard(
                category: category,
                onTap: () => _openCategory(category),
              ),
              const SizedBox(height: 14),
            ],
        ],
      ),
    );
  }
}

class _LibraryCategory {
  final String name;
  final String category;
  final int count;
  final String badge;
  final String image;

  const _LibraryCategory({
    required this.name,
    required this.category,
    required this.count,
    required this.badge,
    required this.image,
  });
}

class _CategoryCard extends StatelessWidget {
  final _LibraryCategory category;
  final VoidCallback onTap;

  const _CategoryCard({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: AppTheme.cardDecoration(context, radius: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              category.image,
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 170,
                  color: Colors.grey.shade300,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image_not_supported_outlined,
                    size: 48,
                  ),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${category.count} exercises',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.secondary.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      category.badge,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
