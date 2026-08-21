import 'package:flutter/material.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import '../tutor/services/tutor_api_service.dart';

class LessonTutorChoice {
  const LessonTutorChoice({required this.tutor, required this.mode});

  final TutorDto tutor;
  /// `talk` or `chat`
  final String mode;
}

Future<LessonTutorChoice?> showLessonTutorSheet(
  BuildContext context, {
  required String lessonTitle,
}) {
  return showModalBottomSheet<LessonTutorChoice>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => _LessonTutorSheet(lessonTitle: lessonTitle),
  );
}

class _LessonTutorSheet extends StatefulWidget {
  const _LessonTutorSheet({required this.lessonTitle});

  final String lessonTitle;

  @override
  State<_LessonTutorSheet> createState() => _LessonTutorSheetState();
}

class _LessonTutorSheetState extends State<_LessonTutorSheet> {
  var _loading = true;
  String? _error;
  List<TutorDto> _tutors = const [];
  String? _selectedId;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final tutors = await TutorApiService.fetchTutors();
      if (!mounted) return;
      setState(() {
        _tutors = tutors;
        _selectedId = tutors.isNotEmpty ? tutors.first.id : null;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = e.toString();
      });
    }
  }

  TutorDto? get _selected {
    for (final t in _tutors) {
      if (t.id == _selectedId) return t;
    }
    return _tutors.isEmpty ? null : _tutors.first;
  }

  void _confirm(String mode) {
    final tutor = _selected;
    if (tutor == null) return;
    Navigator.of(context).pop(LessonTutorChoice(tutor: tutor, mode: mode));
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.lessonPage;
    final bottom = MediaQuery.paddingOf(context).bottom;
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 12, 20, 16 + bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              text.pickTutorTitle,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.lessonTitle,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: 16),
            if (_loading)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(child: CircularProgressIndicator()),
              )
            else if (_error != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    Text(_error!, textAlign: TextAlign.center),
                    TextButton(
                      onPressed: _load,
                      child: Text(AppText.current.common.tryAgain),
                    ),
                  ],
                ),
              )
            else
              SizedBox(
                height: 280,
                child: ListView.separated(
                  itemCount: _tutors.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final tutor = _tutors[index];
                    final selected = tutor.id == _selectedId;
                    final image = tutor.imagePath ?? '';
                    return Material(
                      color: selected
                          ? AppColors.primaryTint10
                          : AppColors.surface,
                      borderRadius: BorderRadius.circular(14),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () => setState(() => _selectedId = tutor.id),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              ClipOval(
                                child: SizedBox(
                                  width: 48,
                                  height: 48,
                                  child: image.isEmpty
                                      ? const ColoredBox(color: Color(0xFFEAEAEA))
                                      : HomeAsset(
                                          image,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  _displayName(tutor),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.ink,
                                  ),
                                ),
                              ),
                              if (selected)
                                const Icon(
                                  Icons.check_circle_rounded,
                                  color: AppColors.primary,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 16),
            SizedBox(
              height: 48,
              child: FilledButton(
                onPressed: _selected == null ? null : () => _confirm('talk'),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(text.startTalk),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _selected == null ? null : () => _confirm('chat'),
              child: Text(
                text.chatInstead,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _displayName(TutorDto tutor) {
    final key = tutor.nameKey;
    final tutors = AppText.current.tutorPage.tutors;
    switch (key) {
      case 'lingola':
        return tutors.lingola;
      case 'zephyrion':
        return tutors.zephyrion;
      case 'vaelen':
        return tutors.vaelen;
      case 'elrion':
        return tutors.elrion;
      case 'ukrath':
        return tutors.ukrath;
      case 'elena':
        return tutors.elena;
      case 'kenji':
        return tutors.kenji;
      case 'freya':
        return tutors.freya;
      case 'camila':
        return tutors.camila;
      case 'marco':
        return tutors.marco;
      case 'julian':
        return tutors.julian;
      case 'ines':
        return tutors.ines;
      case 'felix':
        return tutors.felix;
      case 'diego':
        return tutors.diego;
      case 'amara':
        return tutors.amara;
      case 'erik':
        return tutors.erik;
      case 'katie':
        return tutors.katie;
      case 'morgan':
        return tutors.morgan;
      case 'santa':
        return tutors.santa;
      default:
        return tutor.slug;
    }
  }
}
