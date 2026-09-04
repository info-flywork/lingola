import 'package:flutter/material.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import '../onboarding/language_flag.dart';
import 'profile_emoji.dart';

class ProfileOption {
  const ProfileOption({
    required this.id,
    required this.label,
    this.emoji,
    this.flagCode,
    this.iconAsset,
    this.disabled = false,
    this.comingSoon = false,
  });

  final String id;
  final String label;
  final String? emoji;
  final String? flagCode;
  final String? iconAsset;
  final bool disabled;
  final bool comingSoon;
}

Future<String?> showProfileOptionSheet(
  BuildContext context, {
  required String title,
  String? titleIcon,
  required List<ProfileOption> options,
  required String selectedId,
  int? columns,
  bool compact = false,
  bool gridIcons = false,
  bool readOnly = false,
  /// Figma: üst köşe radius yok, düz bottom sheet.
  bool flat = false,
}) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.45),
    shape: flat
        ? const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
        : null,
    builder: (sheetContext) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(sheetContext).bottom,
        ),
        child: _ProfileOptionSheet(
          title: title,
          titleIcon: titleIcon,
          options: options,
          selectedId: selectedId,
          columns: columns,
          compact: compact,
          gridIcons: gridIcons,
          readOnly: readOnly,
          flat: flat,
        ),
      );
    },
  );
}

class _ProfileOptionSheet extends StatefulWidget {
  const _ProfileOptionSheet({
    required this.title,
    this.titleIcon,
    required this.options,
    required this.selectedId,
    this.columns,
    this.compact = false,
    this.gridIcons = false,
    this.readOnly = false,
    this.flat = false,
  });

  final String title;
  final String? titleIcon;
  final List<ProfileOption> options;
  final String selectedId;
  final int? columns;
  final bool compact;
  final bool gridIcons;
  final bool readOnly;
  final bool flat;

  @override
  State<_ProfileOptionSheet> createState() => _ProfileOptionSheetState();
}

class _ProfileOptionSheetState extends State<_ProfileOptionSheet> {
  late String _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = widget.selectedId;
  }

  int _columnCount(double maxWidth) {
    if (widget.columns != null) return widget.columns!.clamp(1, 6);

    final opts = widget.options;
    if (opts.isEmpty) return 1;
    if (widget.compact) return 3;

    final longest =
        opts.map((o) => o.label.length).reduce((a, b) => a > b ? a : b);
    if (opts.any((o) => o.flagCode != null)) return 1;
    if (opts.length <= 3 && longest <= 14) return opts.length;
    if (longest <= 8) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.flat) {
      return _buildFlatSheet(context);
    }
    return _buildRoundedSheet(context);
  }

  Widget _buildFlatSheet(BuildContext context) {
    final text = AppText.current.profilePage;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final columns = widget.columns ?? 2;
    // Dil Seviyesi / Günlük Hedef (compact): dengeli boşluk.
    final titleGap = widget.compact ? 24.0 : 16.0;
    final buttonGap = widget.compact ? 40.0 : 24.0;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFECECEC), width: 2),
        ),
      ),
      padding: EdgeInsets.fromLTRB(16, 24, 16, 30 + bottomInset),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(iconSize: 32, fontSize: 16, fontWeight: FontWeight.w500),
          SizedBox(height: titleGap),
          _FlatOptionGrid(
            options: widget.options,
            columns: columns,
            selectedId: _selectedId,
            readOnly: widget.readOnly,
            compact: widget.compact,
            onSelect: widget.readOnly
                ? (_) {}
                : (id) => setState(() => _selectedId = id),
          ),
          SizedBox(height: buttonGap),
          PrimaryButton(
            label: text.reminderSave,
            onPressed: () => Navigator.of(context).pop(
              widget.readOnly ? null : _selectedId,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundedSheet(BuildContext context) {
    final text = AppText.current.profilePage;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final maxSheetHeight = MediaQuery.sizeOf(context).height * 0.78;
    const horizontalPad = 16.0;
    const spacing = 8.0;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxHeight: maxSheetHeight),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 33,
            height: 5,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPad),
            child: _buildTitle(
              iconSize: 22,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 18),
          Flexible(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final columns = _columnCount(constraints.maxWidth);
                final contentWidth = constraints.maxWidth - horizontalPad * 2;
                final itemWidth = columns <= 1
                    ? contentWidth
                    : (contentWidth - spacing * (columns - 1)) / columns;

                return SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: horizontalPad),
                  child: columns > 1
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (var i = 0;
                                i < widget.options.length;
                                i += columns)
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: i + columns < widget.options.length
                                      ? spacing
                                      : 0,
                                ),
                                child: _OptionGridRow(
                                  options: widget.options
                                      .sublist(
                                        i,
                                        (i + columns).clamp(
                                          0,
                                          widget.options.length,
                                        ),
                                      )
                                      .toList(),
                                  columns: columns,
                                  itemWidth: itemWidth,
                                  spacing: spacing,
                                  rowWidth: columns * itemWidth +
                                      spacing * (columns - 1),
                                  selectedId: _selectedId,
                                  compact: widget.compact,
                                  gridIcons: widget.gridIcons,
                                  readOnly: widget.readOnly,
                                  onSelect: widget.readOnly
                                      ? (_) {}
                                      : (id) =>
                                          setState(() => _selectedId = id),
                                ),
                              ),
                          ],
                        )
                      : Wrap(
                          spacing: spacing,
                          runSpacing: spacing,
                          alignment: WrapAlignment.start,
                          children: [
                            for (final option in widget.options)
                              SizedBox(
                                width: itemWidth,
                                child: _ProfileOptionChip(
                                  option: option,
                                  selected: option.id == _selectedId,
                                  compact: widget.compact,
                                  gridIcons: widget.gridIcons,
                                  readOnly: widget.readOnly,
                                  onTap: widget.readOnly || option.disabled
                                      ? null
                                      : () => setState(
                                          () => _selectedId = option.id,
                                        ),
                                ),
                              ),
                          ],
                        ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPad,
              12,
              horizontalPad,
              16 + bottomInset,
            ),
            child: PrimaryButton(
              label: text.reminderSave,
              onPressed: () => Navigator.of(context).pop(
                widget.readOnly ? null : _selectedId,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle({
    required double iconSize,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    final hasIcon = widget.titleIcon?.trim().isNotEmpty == true;
    if (!hasIcon) {
      return Text(
        widget.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: fontSize,
          height: 1,
          fontWeight: fontWeight,
          color: AppColors.ink,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeAsset(
          widget.titleIcon!.trim(),
          width: iconSize,
          height: iconSize,
        ),
        const SizedBox(width: 8),
        Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: fontSize,
            height: 1,
            fontWeight: fontWeight,
            color: AppColors.ink,
          ),
        ),
      ],
    );
  }
}

/// Figma Hedef Dil / Dil Seviyesi: hug veya sabit chip’ler, ortalanmış, gap 10.
class _FlatOptionGrid extends StatelessWidget {
  const _FlatOptionGrid({
    required this.options,
    required this.columns,
    required this.selectedId,
    required this.readOnly,
    required this.onSelect,
    this.compact = false,
  });

  final List<ProfileOption> options;
  final int columns;
  final String selectedId;
  final bool readOnly;
  final bool compact;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < options.length; i += columns) ...[
          if (i > 0) const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var j = 0;
                  j < columns && i + j < options.length;
                  j++) ...[
                if (j > 0) const SizedBox(width: 10),
                _FlatOptionChip(
                  option: options[i + j],
                  selected: options[i + j].id == selectedId,
                  readOnly: readOnly,
                  compact: compact,
                  onTap: readOnly || options[i + j].disabled
                      ? null
                      : () => onSelect(options[i + j].id),
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }
}

class _FlatOptionChip extends StatelessWidget {
  const _FlatOptionChip({
    required this.option,
    required this.selected,
    required this.readOnly,
    this.compact = false,
    this.onTap,
  });

  final ProfileOption option;
  final bool selected;
  final bool readOnly;
  final bool compact;
  final VoidCallback? onTap;

  static const _unselectedBorder = Color(0xFFE2E2E2);

  @override
  Widget build(BuildContext context) {
    final isPassive = readOnly && !selected;
    final isDisabled = option.disabled && !readOnly;
    final muted = isPassive || isDisabled;

    final labelColor = selected
        ? Colors.white
        : muted
            ? AppColors.secondary
            : AppColors.ink;

    final label = Text(
      option.label,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: compact ? 16 : 14,
        height: compact ? 24 / 16 : 1,
        fontWeight: compact ? FontWeight.w600 : FontWeight.w500,
        color: labelColor,
      ),
    );

    Widget content;
    if (compact &&
        option.flagCode == null &&
        option.iconAsset == null &&
        option.emoji == null) {
      // Dil Seviyesi / Günlük Hedef: hug, yükseklik 48, padding 12
      content = ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 100, minHeight: 48),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Center(child: label),
        ),
      );
    } else {
      content = Container(
        height: 48,
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (option.flagCode != null)
              Opacity(
                opacity: muted ? 0.45 : 1,
                child: LanguageFlag.badge(option.flagCode!, size: 16),
              )
            else if (option.iconAsset != null)
              HomeAsset(
                option.iconAsset!,
                width: 16,
                height: 16,
                color: selected ? Colors.white : AppColors.ink,
              )
            else if (option.emoji != null)
              Opacity(
                opacity: muted ? 0.45 : 1,
                child: profileEmoji(option.emoji!, size: 15),
              ),
            if (option.flagCode != null ||
                option.iconAsset != null ||
                option.emoji != null)
              const SizedBox(width: 10),
            label,
          ],
        ),
      );
    }

    return Material(
      color: selected ? AppColors.primary : Colors.white,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected ? AppColors.primary : _unselectedBorder,
            ),
          ),
          child: content,
        ),
      ),
    );
  }
}

class _OptionGridRow extends StatelessWidget {
  const _OptionGridRow({
    required this.options,
    required this.columns,
    required this.itemWidth,
    required this.spacing,
    required this.rowWidth,
    required this.selectedId,
    required this.compact,
    required this.gridIcons,
    required this.readOnly,
    required this.onSelect,
  });

  final List<ProfileOption> options;
  final int columns;
  final double itemWidth;
  final double spacing;
  final double rowWidth;
  final String selectedId;
  final bool compact;
  final bool gridIcons;
  final bool readOnly;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    final partialRow = options.length < columns;
    return SizedBox(
      width: rowWidth,
      child: Row(
        mainAxisAlignment:
            partialRow ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          for (var i = 0; i < options.length; i++) ...[
            if (i > 0) SizedBox(width: spacing),
            SizedBox(
              width: itemWidth,
              child: _ProfileOptionChip(
                option: options[i],
                selected: options[i].id == selectedId,
                compact: compact,
                gridIcons: gridIcons,
                readOnly: readOnly,
                onTap: readOnly || options[i].disabled
                    ? null
                    : () => onSelect(options[i].id),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ProfileOptionChip extends StatelessWidget {
  const _ProfileOptionChip({
    required this.option,
    required this.selected,
    this.compact = false,
    this.gridIcons = false,
    this.readOnly = false,
    this.onTap,
  });

  final ProfileOption option;
  final bool selected;
  final bool compact;
  final bool gridIcons;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    if (gridIcons) {
      return _buildLearnAChip(context);
    }
    return _buildDefaultChip(context);
  }

  Widget _buildLearnAChip(BuildContext context) {
    final isPassive = readOnly && !selected;
    final isDisabled = option.disabled && !readOnly;
    final labelColor = selected
        ? Colors.white
        : isPassive
            ? AppColors.secondary
            : isDisabled
                ? AppColors.secondary
                : AppColors.ink;

    final borderColor = selected
        ? AppColors.primary
        : isPassive
            ? AppColors.border
            : isDisabled
                ? AppColors.border
                : AppColors.primary;

    final backgroundColor = selected
        ? AppColors.primary
        : isPassive
            ? const Color(0xFFF6F7FB)
            : Colors.white;

    Widget chipContent = Row(
      children: [
        if (option.flagCode != null)
          Opacity(
            opacity: isPassive ? 0.45 : 1,
            child: LanguageFlag.badge(option.flagCode!, size: 16),
          )
        else if (option.iconAsset != null)
          HomeAsset(
            option.iconAsset!,
            width: 16,
            height: 16,
            color: selected
                ? Colors.white
                : isPassive
                    ? AppColors.secondary
                    : AppColors.primary,
          )
        else if (option.emoji != null)
          SizedBox(
            width: 18,
            child: Center(
              child: Opacity(
                opacity: isPassive ? 0.45 : 1,
                child: profileEmoji(option.emoji!, size: 15),
              ),
            ),
          ),
        if (option.flagCode != null ||
            option.iconAsset != null ||
            option.emoji != null)
          const SizedBox(width: 4),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              option.label,
              maxLines: 1,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                height: 1,
                fontWeight: isPassive ? FontWeight.w500 : FontWeight.w600,
                color: labelColor,
              ),
            ),
          ),
        ),
      ],
    );

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor),
          ),
          child: chipContent,
        ),
      ),
    );
  }

  Widget _buildDefaultChip(BuildContext context) {
    final isDisabled = option.disabled;
    final labelColor = selected
        ? Colors.white
        : isDisabled
            ? AppColors.secondary
            : AppColors.ink;

    final borderColor = selected
        ? AppColors.primary
        : isDisabled
            ? AppColors.border
            : AppColors.primary;

    return Material(
      color: selected ? AppColors.primary : Colors.white,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 8 : 12,
            vertical: compact ? 12 : 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            mainAxisAlignment:
                compact && option.flagCode == null && option.iconAsset == null
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (option.flagCode != null) ...[
                LanguageFlag(option.flagCode!, width: 22, height: 16),
                const SizedBox(width: 8),
              ] else if (option.iconAsset != null) ...[
                HomeAsset(option.iconAsset!, width: 18, height: 18),
                const SizedBox(width: 6),
              ],
              Flexible(
                child: Text(
                  option.label,
                  textAlign: compact ? TextAlign.center : TextAlign.start,
                  maxLines: compact ? 1 : 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: compact ? 14 : 13,
                    height: compact ? 18 / 14 : 16 / 13,
                    fontWeight: FontWeight.w600,
                    color: labelColor,
                  ),
                ),
              ),
              if (option.comingSoon && !selected) ...[
                const SizedBox(width: 6),
                Text(
                  AppText.current.language.comingSoonBadge,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    height: 12 / 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
