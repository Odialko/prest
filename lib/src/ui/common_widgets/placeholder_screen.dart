import 'package:flutter/material.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/navigation_hub/models/navigation_items.dart';
import 'package:prest/src/ui/common_widgets/footer_widget.dart';

class PlaceholderScreen extends StatelessWidget {
  final NavItem item;

  const PlaceholderScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    // Ensure content takes at least the full screen height minus footer/header
                    constraints: BoxConstraints(minHeight: screenHeight - 250),
                    width: double.infinity,
                    color: theme.colors.white,
                    // Large top padding to prevent AppBar overlap
                    padding: const EdgeInsets.only(
                      top: 200,
                      bottom: 100,
                      left: 40,
                      right: 40,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Elegant gold accent line
                        Container(
                          width: 50,
                          height: 1,
                          color: theme.colors.gold,
                        ),
                        const SizedBox(height: 50),

                        // MAIN TITLE (Uppercase with wide tracking)
                        Text(
                          item.title.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: theme.blackTextTheme.font1.copyWith(
                            letterSpacing: 16,
                            fontWeight: FontWeight.w300,
                            fontSize: 56, // Bold premium scale
                            height: 1.2,
                          ),
                        ),

                        const SizedBox(height: 30),

                        // STATUS MESSAGE
                        Text(
                          item.description, // "Strona w budowie – już wkrótce!"
                          textAlign: TextAlign.center,
                          style: theme.blackTextTheme.font7.copyWith(
                            color: theme.colors.chineseBlack.withValues(
                              alpha: 0.6,
                            ),
                            letterSpacing: 3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        const SizedBox(height: 60),

                        // BRAND SIGNATURE
                        Text(
                          "prEST • LUXURY REAL ESTATE",
                          style: theme.blackTextTheme.font7.copyWith(
                            color: theme.colors.gold,
                            letterSpacing: 6,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 50),
                        // Closing decorative line
                        Container(
                          width: 50,
                          height: 1,
                          color: theme.colors.gold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const FooterWidget(), // Футер притиснеться до низу завдяки Expanded
            ],
          ),
        ),
      ],

      // return Container(
      //   // Ensure content takes at least the full screen height minus footer/header
      //   constraints: BoxConstraints(minHeight: screenHeight - 250),
      //   width: double.infinity,
      //   color: theme.colors.white,
      //   // Large top padding to prevent AppBar overlap
      //   padding: const EdgeInsets.only(top: 200, bottom: 100, left: 40, right: 40),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       // Elegant gold accent line
      //       Container(
      //         width: 50,
      //         height: 1,
      //         color: theme.colors.gold,
      //       ),
      //       const SizedBox(height: 50),
      //
      //       // MAIN TITLE (Uppercase with wide tracking)
      //       Text(
      //         item.title.toUpperCase(),
      //         textAlign: TextAlign.center,
      //         style: theme.blackTextTheme.font1.copyWith(
      //           letterSpacing: 16,
      //           fontWeight: FontWeight.w300,
      //           fontSize: 56, // Bold premium scale
      //           height: 1.2,
      //         ),
      //       ),
      //
      //       const SizedBox(height: 30),
      //
      //       // STATUS MESSAGE
      //       Text(
      //         item.description, // "Strona w budowie – już wkrótce!"
      //         textAlign: TextAlign.center,
      //         style: theme.blackTextTheme.font7.copyWith(
      //           color: theme.colors.chineseBlack.withValues(alpha: 0.6),
      //           letterSpacing: 3,
      //           fontWeight: FontWeight.w400,
      //         ),
      //       ),
      //
      //       const SizedBox(height: 60),
      //
      //       // BRAND SIGNATURE
      //       Text(
      //         "prEST • LUXURY REAL ESTATE",
      //         style: theme.blackTextTheme.font7.copyWith(
      //           color: theme.colors.gold,
      //           letterSpacing: 6,
      //           fontWeight: FontWeight.w600,
      //         ),
      //       ),
      //
      //       const SizedBox(height: 50),
      //       // Closing decorative line
      //       Container(
      //         width: 50,
      //         height: 1,
      //         color: theme.colors.gold,
      //       ),
      //     ],
      //   ),
    );
  }
}
