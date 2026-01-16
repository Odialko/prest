import 'package:prest/src/routing/routes.dart';

enum NavItem {
  // POZNAJ NAS (ABOUT US)
  about, team, joinUs,
  // NIERUCHOMOŚCI (PROPERTIES)
  sale, rent, offMarket, allProperties,
  // USŁUGI (SERVICES)
  design, credit, advice, abroad,
  // Buttons and actions
  contact, submitProperty, bookCall
}

extension NavItemExtension on NavItem {
  // Returns the display label for the UI
  String get title {
    switch (this) {
      case NavItem.about: return 'O prEST';
      case NavItem.team: return 'Zespół';
      case NavItem.joinUs: return 'Dołącz do nas';
      case NavItem.allProperties: return 'Wszystkie oferty';
      case NavItem.sale: return 'Sprzedaż';
      case NavItem.rent: return 'Wynajem';
      case NavItem.offMarket: return 'OFFmarket';
      case NavItem.design: return 'prEST design';
      case NavItem.credit: return 'Kredyt';
      case NavItem.advice: return 'Doradztwo';
      case NavItem.abroad: return 'Zakupy за granicą';
      case NavItem.contact: return 'KONTAKT';
      case NavItem.submitProperty: return 'ZGŁOŚ NIERUCHOMOŚĆ';
      case NavItem.bookCall: return 'UMÓW ROZMOWĘ';
    }
  }

  String get description {
    switch (this) {
      case NavItem.about:
        return 'Poznaj historię prEST – już wkrótce!';
      case NavItem.team:
        return 'Nasz zespół specjalistów – już wkrótce!';
      case NavItem.offMarket:
        return 'Dostęp do ofert poza rynkiem – już wkrótce!';
      default:
        return 'Strona w budowie – już wkrótce!';
    }
  }

  // Returns the navigation route path
  String get route {
    switch (this) {
    // Прямі маршрути
      case NavItem.about: return Routes.about;
      case NavItem.team: return Routes.team;
      case NavItem.contact: return Routes.contact;
      case NavItem.submitProperty: return Routes.contact;

    // Група PROPERTIES (через Query-параметри для SEO)
      case NavItem.allProperties: return Routes.offers;
      case NavItem.sale: return '${Routes.offers}?type=sale';
      case NavItem.rent: return '${Routes.offers}?type=rent';
      case NavItem.offMarket: return '${Routes.offers}?type=off-market';

    // Група SERVICES (Вкладені маршрути)
      case NavItem.design: return Routes.servicesDesign;
      case NavItem.credit: return Routes.servicesCredit;
      case NavItem.advice: return Routes.servicesAdvice;
      case NavItem.abroad: return Routes.servicesAbroad;

      default: return Routes.home;
    }
  }
}