import 'package:flutter/material.dart';

class ExerciseLibraryScreen extends StatefulWidget {
  const ExerciseLibraryScreen({super.key});

  @override
  State<ExerciseLibraryScreen> createState() => _ExerciseLibraryScreenState();
}

class _ExerciseLibraryScreenState extends State<ExerciseLibraryScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<_MuscleGroup> _categories = const [
    _MuscleGroup(
      name: 'Chest Workouts',
      count: 24,
      bonus: 'ATTACK +15',
      imagePath: 'assets/images/chest_workouts.png',
    ),
    _MuscleGroup(
      name: 'Arm Workouts',
      count: 18,
      bonus: 'POWER +18',
      imagePath: 'assets/images/arm_workouts.png',
    ),
    _MuscleGroup(
      name: 'Leg Workouts',
      count: 22,
      bonus: 'DEFENSE +20',
      imagePath: 'assets/images/leg_workouts.png',
    ),
  ];

  List<_MuscleGroup> get _filteredCategories {
    final query = _searchController.text.trim().toLowerCase();

    if (query.isEmpty) {
      return _categories;
    }

    return _categories
        .where((category) => category.name.toLowerCase().contains(query))
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = _filteredCategories;

    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
        children: [
          Text('Library', style: Theme.of(context).textTheme.headlineSmall),

          const SizedBox(height: 18),

          Container(
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFE6E6E6)),
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (_) {
                setState(() {});
              },
              decoration: const InputDecoration(
                hintText: 'Search exercises...',
                prefixIcon: Icon(Icons.search, size: 20),
                suffixIcon: Icon(Icons.tune, size: 18),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),

          const SizedBox(height: 22),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'MUSCLE GROUP CATEGORIES',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF666666),
                ),
              ),
              const Text(
                '84 Total',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFEF5350),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          if (categories.isEmpty)
            const Padding(
              padding: EdgeInsets.all(32),
              child: Center(child: Text('No muscle group found.')),
            )
          else
            ...categories.map(_buildCategoryCard),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(_MuscleGroup category) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE6E6E6)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 122,
            width: double.infinity,
            child: Image.asset(category.imagePath, fit: BoxFit.cover),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 9, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEF5350),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        category.bonus,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const Spacer(),

                    Text(
                      '${category.count} Exercises',
                      style: const TextStyle(
                        fontSize: 9,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 7),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        category.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFE6E6E6)),
                      ),
                      child: const Icon(Icons.chevron_right, size: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MuscleGroup {
  final String name;
  final int count;
  final String bonus;
  final String imagePath;

  const _MuscleGroup({
    required this.name,
    required this.count,
    required this.bonus,
    required this.imagePath,
  });
}
