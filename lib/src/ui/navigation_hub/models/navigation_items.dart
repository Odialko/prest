import 'package:prest/src/routing/routes.dart';

enum NavItem {
  // POZNAJ NAS (ABOUT US)
  about, team, joinUs,
  // NIERUCHOMOŚCI (PROPERTIES)
  sale, rent, offMarket,
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
      case NavItem.sale: return 'Sprzedaż';
      case NavItem.rent: return 'Wynajem';
      case NavItem.offMarket: return 'OFFmarket';
      case NavItem.design: return 'prEST design';
      case NavItem.credit: return 'Kredyt';
      case NavItem.advice: return 'Doradztwo';
      case NavItem.abroad: return 'Zakupy za granicą';
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
        return 'Strona w budowie – już wkrótce!'; // Default message
    }
  }

  // Returns the navigation route path
  String get route {
    switch (this) {
      case NavItem.about: return Routes.about;
      case NavItem.team: return Routes.team;
      case NavItem.joinUs: return Routes.joinUs;
      case NavItem.sale: return Routes.propertiesSale;
      case NavItem.rent: return Routes.propertiesRent;
      case NavItem.offMarket: return Routes.propertiesOffMarket;
      case NavItem.design: return Routes.servicesDesign;
      case NavItem.credit: return Routes.servicesCredit;
      case NavItem.advice: return Routes.servicesDoradztwo;
      case NavItem.abroad: return Routes.servicesZaGranica;
      case NavItem.contact: return Routes.contact;
      case NavItem.submitProperty: return Routes.contact;
      default: return Routes.home;
    }
  }
}