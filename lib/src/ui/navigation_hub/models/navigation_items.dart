import 'package:prest/src/routing/routes.dart';

import 'package:prest/src/routing/routes.dart';

enum NavItem {
  // POZNAJ NAS
  about,
  team,
  joinUs,
  // NIERUCHOMOŚCI
  sale,
  rent,
  offMarket,
  allProperties,
  // USŁUGI
  design,
  credit,
  advice,
  abroad,
  // Actions
  contact,
  submitProperty,
  bookCall,
  // Legal
  legal,
  privacy,
  terms,
}

extension NavItemExtension on NavItem {
  String get title {
    switch (this) {
      case NavItem.about:
        return 'O prEST';
      case NavItem.team:
        return 'Zespół';
      case NavItem.joinUs:
        return 'Dołącz do nas';
      case NavItem.allProperties:
        return 'Wszystkie oferty';
      case NavItem.sale:
        return 'Sprzedaż';
      case NavItem.rent:
        return 'Wynajem';
      case NavItem.offMarket:
        return 'OFFmarket';
      case NavItem.design:
        return 'prEST design';
      case NavItem.credit:
        return 'Kredyt';
      case NavItem.advice:
        return 'Doradztwo';
      case NavItem.abroad:
        return 'Nieruchomości za granicą';
      case NavItem.contact:
        return 'KONTAKT';
      case NavItem.submitProperty:
        return 'ZGŁOŚ NIERUCHOMOŚĆ';
      case NavItem.bookCall:
        return 'UMÓW ROZMOWĘ';
      case NavItem.legal:
        return 'Nota prawna';
      case NavItem.privacy:
        return 'Polityka prywatności';
      case NavItem.terms:
        return 'Regulamin';
    }
  }

  String get description {
    switch (this) {
      case NavItem.about:
        return 'Poznaj naszą misję i standardy pracy w prEST.';
      case NavItem.team:
        return 'Eksperci, którzy pomogą Ci zrealizować Twoje cele.';
      case NavItem.joinUs:
        return 'Rozwijaj swoją karierę w dynamicznym zespole.';
      case NavItem.allProperties:
        return 'Przeglądaj wszystkie dostępne nieruchomości w naszej bazie.';
      case NavItem.sale:
        return 'Znajdź swój wymarzony dom lub mieszkanie na sprzedaż.';
      case NavItem.rent:
        return 'Najlepsze oferty wynajmu dopasowane do Twoich potrzeb.';
      case NavItem.offMarket:
        return 'Ekskluzywne oferty niedostępne na publicznym rynku.';
      case NavItem.design:
        return 'Profesjonalna aranżacja i wykończenie wnętrz pod klucz.';
      case NavItem.credit:
        return 'Bezpieczne i optymalne finansowanie Twojej nieruchomości.';
      case NavItem.advice:
        return 'Profesjonalne wsparcie na każdym etapie transakcji.';
      case NavItem.abroad:
        return 'Inwestuj bezpiecznie w nieruchomości na całym świecie.';
      case NavItem.contact:
        return 'Skontaktuj się z nami – jesteśmy tutaj, aby pomóc.';
      case NavItem.submitProperty:
        return 'Sprzedaj lub wynajmij swoją nieruchomość z profesjonalistami.';
      case NavItem.bookCall:
        return 'Zarezerwuj termin bezpłatnej konsultacji telefonicznej.';
      case NavItem.legal:
        return 'Informacje prawne dotyczące korzystania z serwisu.';
      case NavItem.privacy:
        return 'Twoje dane są u nas bezpieczne. Poznaj zasady ochrony.';
      case NavItem.terms:
        return 'Zasady korzystania z usług i serwisu prEST.';
    }
  }

  String get route {
    switch (this) {
      case NavItem.about:
        return Routes.about;
      case NavItem.team:
        return Routes.team;
      case NavItem.contact:
        return Routes.contact;
      case NavItem.joinUs:
        return Routes.joinUs;
      case NavItem.submitProperty:
        return Routes.contact;
      case NavItem.allProperties:
        return Routes.offers;
      case NavItem.sale:
        return '${Routes.offers}?type=sale';
      case NavItem.rent:
        return '${Routes.offers}?type=rent';
      case NavItem.offMarket:
        return '${Routes.offers}?type=off-market';
      case NavItem.design:
        return Routes.servicesDesign;
      case NavItem.credit:
        return Routes.servicesCredit;
      case NavItem.advice:
        return Routes.servicesAdvice;
      case NavItem.abroad:
        return Routes.servicesAbroad;
      case NavItem.legal:
        return Routes.legal;
      case NavItem.privacy:
        return Routes.privacy;
      case NavItem.terms:
        return Routes.terms;
      default:
        return Routes.home;
    }
  }
}
