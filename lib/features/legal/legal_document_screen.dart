import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../i18n/strings.g.dart';

enum LegalDocumentKind { terms, privacy, cookies }

abstract final class LegalDocuments {
  static String localeFolder() {
    final code = switch (LocaleSettings.currentLocale) {
      AppLocale.tr => 'tr',
      AppLocale.de => 'de',
      AppLocale.fr => 'fr',
      AppLocale.it => 'it',
      AppLocale.ja => 'ja',
      AppLocale.es => 'es',
      AppLocale.ru => 'ru',
      AppLocale.hi => 'hi',
      AppLocale.pt => 'pt',
      AppLocale.zh => 'zh',
      _ => 'en',
    };
    return code;
  }

  static String assetPath(LegalDocumentKind kind) {
    final name = switch (kind) {
      LegalDocumentKind.terms => 'terms',
      LegalDocumentKind.privacy => 'privacy',
      LegalDocumentKind.cookies => 'cookies',
    };
    return 'assets/legal/${localeFolder()}/$name.txt';
  }

  static String titleFor(LegalDocumentKind kind) {
    final auth = AppText.current.auth;
    return switch (kind) {
      LegalDocumentKind.terms => auth.terms,
      LegalDocumentKind.privacy => auth.privacy,
      LegalDocumentKind.cookies => auth.cookies,
    };
  }

  static Future<String> load(LegalDocumentKind kind) async {
    final primary = assetPath(kind);
    try {
      return await rootBundle.loadString(primary);
    } catch (_) {
      return rootBundle.loadString(
        primary.replaceFirst('/${localeFolder()}/', '/en/'),
      );
    }
  }
}

abstract final class LegalDocumentSheet {
  static Future<void> open(BuildContext context, LegalDocumentKind kind) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: .35),
      builder: (sheetContext) => _LegalDocumentSheetBody(kind: kind),
    );
  }
}

class _LegalDocumentSheetBody extends StatefulWidget {
  const _LegalDocumentSheetBody({required this.kind});

  final LegalDocumentKind kind;

  @override
  State<_LegalDocumentSheetBody> createState() =>
      _LegalDocumentSheetBodyState();
}

class _LegalDocumentSheetBodyState extends State<_LegalDocumentSheetBody> {
  String? _body;
  var _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final body = await LegalDocuments.load(widget.kind);
      if (!mounted) return;
      setState(() {
        _body = body;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = LegalDocuments.titleFor(widget.kind);
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return DraggableScrollableSheet(
      initialChildSize: 0.82,
      minChildSize: 0.45,
      maxChildSize: 0.92,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Color(0xFFECECEC), width: 2),
              left: BorderSide(color: Color(0xFFECECEC), width: 2),
              right: BorderSide(color: Color(0xFFECECEC), width: 2),
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFECECEC),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          height: 24 / 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      icon: const Icon(Icons.close_rounded, size: 22),
                      tooltip: AppText.current.common.close,
                      color: AppColors.secondary,
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: Color(0xFFECECEC)),
              Expanded(
                child: _loading
                    ? const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.primary,
                        ),
                      )
                    : SingleChildScrollView(
                        controller: scrollController,
                        padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottomInset),
                        child: Text(
                          _body ?? AppText.current.common.genericError,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            height: 20 / 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondary,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
