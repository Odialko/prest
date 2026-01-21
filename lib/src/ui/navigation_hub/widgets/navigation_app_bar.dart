import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/routing/routes.dart';

class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isScrolled;
  final List<Widget> actions;

  const NavigationAppBar({
    super.key,
    required this.isScrolled,
    required this.actions,
  });

  @override
  Size get preferredSize {
    // ЯКЩО СКРОЛИМО - 70, ЯКЩО НІ - 110. Це змусить Scaffold змінити розмір
    return Size.fromHeight(isScrolled ? 70 : 110);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 1150;

    // Робимо висоту, яка збігається з preferredSize
    final double targetHeight = isScrolled ? 70 : (isMobile ? 80 : 110);

    return AnimatedContainer(
      duration: LayoutsConstants.animationHeaderDuration,
      curve: Curves.easeInOut,
      height: targetHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: isScrolled
            ? [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ]
            : [],
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: LayoutsConstants.maxContentWidth,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLogo(context, isMobile, width),
                if (!isMobile)
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: actions, // Передаємо список без розгортки для чистоти
                      ),
                    ),
                  )
                else
                  Builder(
                    builder: (scaffoldContext) => IconButton(
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () => Scaffold.of(scaffoldContext).openEndDrawer(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context, bool isMobile, double width) {
    // Логотип також має реагувати на скрол
    double logoHeight = isScrolled ? 60 : (isMobile ? 70 : 90);
    if (width < 1300 && !isMobile) logoHeight = isScrolled ? 42 : 68;

    return GestureDetector(
      onTap: () => context.go(Routes.home),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: LayoutsConstants.animationHeaderDuration,
          height: logoHeight,
          child: Image.asset(ImagesConstants.mainLogo, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

/// in case if we need to keep glass
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:prest/src/prest_theme.dart';
//
// class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool isScrolled;
//   final List<Widget> actions;
//
//   const NavigationAppBar({
//     super.key,
//     required this.isScrolled,
//     required this.actions,
//   });
//
//   @override
//   Size get preferredSize => const Size.fromHeight(100);
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = context.prestTheme;
//
//     return AnimatedPadding(
//       duration: const Duration(milliseconds: 400),
//       curve: Curves.easeInOutCubic,
//       // При скролі додаємо відступи, щоб хедер "відірвався" від країв
//       padding: EdgeInsets.symmetric(
//         horizontal: isScrolled ? 440.0 : 0.0,
//         vertical: isScrolled ? 12.0 : 0.0,
//       ),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 400),
//         curve: Curves.easeInOutCubic,
//         decoration: BoxDecoration(
//           color: isScrolled
//               ? theme.colors.background.withValues(alpha: 0.4)
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(isScrolled ? 40 : 0),
//           border: Border.all(
//             color: isScrolled
//                 ? theme.colors.gray.withValues(alpha: 0.2)
//                 : Colors.transparent,
//           ),
//           boxShadow: isScrolled ? [
//             BoxShadow(
//               color: Colors.black.withValues(alpha: 0.05),
//               blurRadius: 20,
//               offset: const Offset(0, 10),
//             )
//           ] : [],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(isScrolled ? 40 : 0),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(
//               sigmaX: isScrolled ? 15 : 0,
//               sigmaY: isScrolled ? 15 : 0,
//             ),
//             child: Center( // Центруємо контент для великих екранів
//               child: ConstrainedBox(
//                 constraints: const BoxConstraints(maxWidth: 1200),
//                 child: AppBar(
//                   backgroundColor: Colors.transparent,
//                   elevation: 0,
//                   scrolledUnderElevation: 0,
//                   // Використовуємо логотип
//                   title: Image.asset(
//                     'assets/images/logo-prest.jpeg',
//                     height: isScrolled ? 30 : 40, // Лого трохи зменшується
//                     // color: isScrolled ? theme.colors.black : null, // Стає темним на світлому склі
//                     // colorBlendMode: isScrolled ? BlendMode.srcIn : null,
//                   ),
//                   actions: actions,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
