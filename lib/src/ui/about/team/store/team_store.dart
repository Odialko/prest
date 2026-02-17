import 'package:flutter_riverpod/legacy.dart';
import 'package:prest/generated/l10n.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/ui/about/team/models/team_member.dart';

// Стан залишаємо як був
import 'package:freezed_annotation/freezed_annotation.dart';
part 'team_store.freezed.dart';

@freezed
class TeamState with _$TeamState {
  const factory TeamState.loading() = TeamStateLoading;
  const factory TeamState.error({String? message}) = TeamStateError;
  const factory TeamState.loaded({@Default([]) List<TeamMember> members}) = TeamStateLoaded;
}

class TeamNotifier extends StateNotifier<TeamState> {
  // Передаємо S (локалізацію) прямо в конструктор
  TeamNotifier() : super(const TeamState.loading()) {
    _init();
  }

  void _init() async {
    await Future.delayed(const Duration(milliseconds: 500));
    updateLanguage(); // Заповнюємо дані при старті
  }

  void updateLanguage() {
    final s = S.current; // Беремо поточну мову

    state = TeamState.loaded(members: [
      TeamMember(
        name: 'ANNA WSZELAKA',
        role: s.roleSeniorAdvisor, // Переклад відразу тут
        license: s.licenseNumber('28360'),
        phone: '+ 48 690 175 317',
        email: 'anna.wszelaka@prestestate.pl',
        imagePath: ImagesConstants.annaTeam,
      ),
      TeamMember(
        name: 'IWONA WRONECKA',
        role: s.roleSeniorAdvisor,
        license: s.licenseNumber('27033'),
        phone: '+ 48 607 077 870',
        email: 'iwona.wronecka@prestestate.pl',
        imagePath: ImagesConstants.iwonaTeam,
      ),
      TeamMember(
        name: 'MARCIN HOFFMANN',
        role: s.roleSeniorAdvisor,
        license: s.licenseNumber('31596'),
        phone: '+ 48 883 672 894',
        email: 'marcin.hoffmann@prestestate.pl',
        imagePath: ImagesConstants.marcinTeam,
      ),
    ]);
  }
}

// ПРОВАЙДЕР
final teamProvider = StateNotifierProvider<TeamNotifier, TeamState>((ref) {
  return TeamNotifier();
});