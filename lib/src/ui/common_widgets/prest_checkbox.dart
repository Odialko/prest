import 'package:flutter/material.dart';
import 'package:prest/src/prest_theme.dart';

class PrestCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final TextSpan label;

  const PrestCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;

    return InkWell(
      onTap: () => onChanged(!value),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: theme.colors.chineseBlack,
              checkColor: Colors.white,
              // Прямі кути для преміального вигляду
              side: BorderSide(
                color: theme.colors.chineseBlack.withOpacity(0.4),
                width: 1,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: theme.arsenicTextTheme.font9.copyWith(
                  fontSize: 12,
                  height: 1.4,
                ),
                children: [label],
              ),
            ),
          ),
        ],
      ),
    );
  }
}