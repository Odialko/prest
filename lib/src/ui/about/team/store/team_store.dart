import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/ui/about/team/models/team_member.dart';

part 'team_store.freezed.dart';

// Стан для команди (аналогічно OffersState)
@freezed
abstract class TeamState with _$TeamState {
  const factory TeamState.loading() = TeamStateLoading;
  const factory TeamState.error({String? message}) = TeamStateError;
  const factory TeamState.loaded({@Default([]) List<TeamMember> members}) = TeamStateLoaded;
}

class TeamNotifier extends StateNotifier<TeamState> {
  TeamNotifier() : super(const TeamState.loading()) {
    _init();
  }

  void _init() async {
    // Імітуємо завантаження для плавності анімацій
    await Future.delayed(const Duration(milliseconds: 500));

    state = TeamState.loaded(members: [
      TeamMember(
        name: 'ANNA WSZELAKA',
        role: 'Senior Real Estate Advisor',
        license: 'Nr licencji 28360',
        phone: '+ 48 690 175 317',
        email: 'anna.wszelaka@prestestate.pl',
        imagePath: ImagesConstants.house5,
      ),
      TeamMember(
        name: 'IWONA WRONECKA',
        role: 'Senior Real Estate Advisor',
        license: 'Nr licencji 28360',
        phone: '+ 48 690 175 317',
        email: 'iwona.wronecka@prestestate.pl',
        imagePath: ImagesConstants.house5,
      ),
      TeamMember(
        name: 'MARCIN HOFFMANN',
        role: 'Senior Real Estate Advisor',
        license: 'Nr licencji 28360',
        phone: '+ 48 690 175 317',
        email: 'marcin.hoffmann@prestestate.pl',
        imagePath: ImagesConstants.house5,
      ),
    ]);
  }
}

// ПРОВАЙДЕР
final teamProvider = StateNotifierProvider<TeamNotifier, TeamState>((ref) {
  return TeamNotifier();
});