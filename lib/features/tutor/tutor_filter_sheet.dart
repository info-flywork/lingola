import 'package:flutter/material.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import 'tutor_filter.dart';

Future<TutorFilter?> showTutorFilterSheet(
  BuildContext context, {
  required TutorFilter initial,
}) {
  return showModalBottomSheet<TutorFilter>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _TutorFilterSheet(initial: initial),
  );
}

class _TutorFilterSheet extends StatefulWidget {
  const _TutorFilterSheet({required this.initial});

  final TutorFilter initial;

  @override
  State<_TutorFilterSheet> createState() => _TutorFilterSheetState();
}

class _TutorFilterSheetState extends State<_TutorFilterSheet> {
  late Set<String> _selectedFlags;
  late Set<String> _selectedTagKeys;

  @override
  void initState() {
    super.initState();
    _selectedFlags = {...widget.initial.flagAssets};
    _selectedTagKeys = {...widget.initial.tagKeys};
  }

  void _toggleFlag(String flagAsset) {
    setState(() {
      if (_selectedFlags.contains(flagAsset)) {
        _selectedFlags.remove(flagAsset);
      } else {
        _selectedFlags.add(flagAsset);
      }
    });
  }

  void _toggleTag(String key) {
    setState(() {
      if (_selectedTagKeys.contains(key)) {
        _selectedTagKeys.remove(key);
      } else {
        _selectedTagKeys.add(key);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.tutorPage;
    final countries = [
      ...TutorFilterOptions.primaryCountries,
      ...TutorFilterOptions.extraCountries,
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                text.filter,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                text.country,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final country in countries)
                    _FlagCircle(
                      flag: country.emoji,
                      selected: _selectedFlags.contains(country.flagAsset),
                      onTap: () => _toggleFlag(country.flagAsset),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                text.focus,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final key in TutorFilterOptions.focusTagKeys)
                    _FocusChip(
                      label: TutorFilterOptions.tagLabel(text.tags, key),
                      selected: _selectedTagKeys.contains(key),
                      onTap: () => _toggleTag(key),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(height: 1, color: AppColors.border),
              const SizedBox(height: 16),
              PrimaryButton(
                label: text.save,
                onPressed: () {
                  Navigator.of(context).pop(
                    TutorFilter(
                      flagAssets: _selectedFlags,
                      tagKeys: _selectedTagKeys,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FlagCircle extends StatelessWidget {
  const _FlagCircle({
    required this.flag,
    required this.selected,
    required this.onTap,
  });

  final String flag;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.primaryTint10 : Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: selected ? AppColors.primary : AppColors.border,
              width: selected ? 2 : 1,
            ),
          ),
          child: Text(flag, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}

class _FocusChip extends StatelessWidget {
  const _FocusChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.primary : Colors.white,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: selected ? AppColors.primary : AppColors.border,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: selected ? Colors.white : AppColors.ink,
            ),
          ),
        ),
      ),
    );
  }
}
