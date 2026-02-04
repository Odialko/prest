import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/ui/about/team/views/team_mobile_view.dart';
import 'package:prest/src/ui/about/team/views/team_web_view.dart';


abstract class TeamScreen extends ConsumerWidget {
  const TeamScreen({super.key});

  /// FACTORY
  /// This is the entry point that decides which platform view to return
  factory TeamScreen.create({Key? key}) {
    if (kIsWeb) {
      return TeamScreenWebView(key: key);
    }
    return TeamScreenMobileView(key: key);
  }
}
