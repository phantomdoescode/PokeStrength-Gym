import 'package:flutter/material.dart';
import '../controllers/trainer_controller.dart';

class EditProfileScreen extends StatefulWidget {
  final TrainerController trainerController;

  const EditProfileScreen({super.key, required this.trainerController});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _nameController;

  late final TextEditingController _ageController;

  late final TextEditingController _heightController;

  late final TextEditingController _weightController;

  late String _fitnessLevel;

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();

    final member = widget.trainerController.member!;

    // Populate the fields using the currently saved trainer data.
    _nameController = TextEditingController(text: member.name);

    _ageController = TextEditingController(text: member.age.toString());

    _heightController = TextEditingController(text: member.height.toString());

    _weightController = TextEditingController(text: member.weight.toString());

    _fitnessLevel = member.fitnessLevel;
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();

    final age = int.tryParse(_ageController.text);

    final height = double.tryParse(_heightController.text);

    final weight = double.tryParse(_weightController.text);

    // Validate the values before saving them.
    if (name.isEmpty ||
        age == null ||
        height == null ||
        weight == null ||
        age <= 0 ||
        height <= 0 ||
        weight <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter valid trainer information.'),
        ),
      );
      return;
    }

    setState(() {
      _isSaving = true;
    });

    // The controller updates the Member and saves it locally.
    await widget.trainerController.updateProfile(
      name: name,
      age: age,
      height: height,
      weight: weight,
      fitnessLevel: _fitnessLevel,
    );

    if (!mounted) {
      return;
    }

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Trainer Card')),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'Trainer Information',
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 6),

            Text(
              'Update the information shown on your Trainer Card.',
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 24),

            TextField(
              controller: _nameController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Trainer Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: _heightController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Height (cm)',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: _weightController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: _fitnessLevel,
              decoration: const InputDecoration(
                labelText: 'Fitness Level',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Beginner', child: Text('Beginner')),
                DropdownMenuItem(
                  value: 'Intermediate',
                  child: Text('Intermediate'),
                ),
                DropdownMenuItem(value: 'Advanced', child: Text('Advanced')),
              ],
              onChanged: (value) {
                if (value == null) {
                  return;
                }

                setState(() {
                  _fitnessLevel = value;
                });
              },
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 46,
              child: FilledButton(
                onPressed: _isSaving ? null : _save,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFEF5350),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                child: Text(_isSaving ? 'Saving...' : 'Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
