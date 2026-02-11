import 'package:flutter/material.dart';
import 'package:prest/src/prest_theme.dart';

class _PrestButtonBuilder extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color baseBackgroundColor;
  final Color baseBorderColor;
  final Color fillBackgroundColor;
  final Color baseTextColor;
  final Color hoverTextColor;
  final TextStyle labelStyle;
  final double? width;
  final double height;

  const _PrestButtonBuilder({
    required this.label,
    required this.onPressed,
    required this.baseBackgroundColor,
    required this.baseBorderColor,
    required this.fillBackgroundColor,
    required this.baseTextColor,
    required this.hoverTextColor,
    required this.labelStyle,
    this.width,
    required this.height,
  });

  @override
  State<_PrestButtonBuilder> createState() => _PrestButtonBuilderState();
}

class _PrestButtonBuilderState extends State<_PrestButtonBuilder> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = widget.onPressed != null;
    const duration = Duration(milliseconds: 800);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: duration,
          curve: Curves.easeInOutCubic,
          width: widget.width,
          height: widget.height,
          constraints: const BoxConstraints(minWidth: 150),
          decoration: BoxDecoration(
            color: widget.baseBackgroundColor,
            border: Border.all(
              color: _isHovered
                  ? widget.fillBackgroundColor
                  : widget.baseBorderColor,
              width: 0.8,
            ),
          ),
          child: Stack(
            children: [
              // Анімація заповнення фону
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: duration,
                    curve: Curves.easeInOutCubic,
                    width: _isHovered ? 1200 : 0,
                    color: widget.fillBackgroundColor,
                  ),
                ),
              ),
              // Анімація кольору тексту
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AnimatedDefaultTextStyle(
                    duration: duration,
                    textAlign: TextAlign.center,
                    style: widget.labelStyle.copyWith(
                      color: _isHovered
                          ? widget.hoverTextColor
                          : widget.baseTextColor,
                    ),
                    child: SelectionContainer.disabled(child: Text(widget.label, maxLines: 1, softWrap: false)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 1. ЧОРНА КНОПКА (Primary): Чорна -> Біла інверсія
class PrestPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final double height;

  const PrestPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.width,
    this.height = 55,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    return _PrestButtonBuilder(
      label: label,
      onPressed: onPressed,
      width: width,
      height: height,
      baseBackgroundColor: theme.colors.chineseBlack,
      baseBorderColor: theme.colors.chineseBlack,
      fillBackgroundColor: Colors.white,
      baseTextColor: Colors.white,
      hoverTextColor: theme.colors.chineseBlack,
      labelStyle: theme.whiteTextTheme.font7.copyWith(
        letterSpacing: 2.5,
        fontSize: 12,
      ),
    );
  }
}

/// 2. СВІТЛА КНОПКА (Secondary): Біла -> Чорна інверсія
class PrestDarkBorderButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final double height;

  const PrestDarkBorderButton({
    super.key,
    required this.label,
    this.onPressed,
    this.width,
    this.height = 55,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    return _PrestButtonBuilder(
      label: label,
      onPressed: onPressed,
      width: width,
      height: height,
      baseBackgroundColor: Colors.transparent,
      baseBorderColor: theme.colors.chineseBlack,
      fillBackgroundColor: theme.colors.chineseBlack,
      baseTextColor: theme.colors.chineseBlack,
      hoverTextColor: Colors.white,
      labelStyle: theme.blackTextTheme.font7.copyWith(
        letterSpacing: 2.5,
        fontSize: 12,
      ),
    );
  }
}

/// 3. ПРОЗОРА КНОПКА (Hero): Прозора з білою рамкою -> Чорне заповнення
class PrestTransparentButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final double height;

  const PrestTransparentButton({
    super.key,
    required this.label,
    this.onPressed,
    this.width = 220,
    this.height = 55,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    return _PrestButtonBuilder(
      label: label,
      onPressed: onPressed,
      width: width,
      height: height,
      baseBackgroundColor: Colors.transparent,
      baseBorderColor: Colors.white.withValues(alpha: 0.8),
      fillBackgroundColor: theme.colors.chineseBlack,
      baseTextColor: Colors.white,
      hoverTextColor: Colors.white,
      labelStyle: theme.whiteTextTheme.font7.copyWith(
        letterSpacing: 2.5,
        fontSize: 12,
      ),
    );
  }
}
