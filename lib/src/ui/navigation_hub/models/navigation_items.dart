import 'package:flutter/material.dart';
import 'package:prest/generated/l10n.dart';
import 'package:prest/src/routing/routes.dart';

enum NavItem {
  // POZNAJ NAS (ABOUT US)
  about,
  team,
  joinUs,
  // NIERUCHOMOŚCI (PROPERTIES)
  sale,
  rent,
  offMarket,
  allProperties,
  // USŁUGI (SERVICES)
  forDevelopers,
  design,
  credit,
  advice,
  abroad,
  // Buttons and actions
  contact,
  submitProperty,
  bookCall,
}

extension NavItemExtension on NavItem {
  // Головний метод для отримання назви залежно від мови
  String getTitle(BuildContext context) {
    final s = S.of(context);
    switch (this) {
      case NavItem.about: return s.navAbout;
      case NavItem.team: return s.navTeam;
      case NavItem.joinUs: return s.navJoinUs;
      case NavItem.allProperties: return s.navAllProperties;
      case NavItem.sale: return s.navSale;
      case NavItem.rent: return s.navRent;
      case NavItem.offMarket: return s.navOffMarket;
      case NavItem.forDevelopers: return s.navForDevelopers;
      case NavItem.design: return s.navDesign;
      case NavItem.credit: return s.navCredit;
      case NavItem.advice: return s.navAdvice;
      case NavItem.abroad: return s.navAbroad;
      case NavItem.contact: return s.navKontakt;
      case NavItem.submitProperty: return s.navZglosNieruchomosc;
      case NavItem.bookCall: return s.btnUmowRozmowe;
    }
  }

  // Опис (Description) теж виносимо в локалізацію
  String getDescription(BuildContext context) {
    final s = S.of(context);
    switch (this) {
      case NavItem.about: return s.descAbout;
      case NavItem.team: return s.descTeam;
      case NavItem.offMarket: return s.descOffMarket;
      case NavItem.joinUs: return s.descJoinUs;
      default: return s.descInBuild; // Загальний опис "в розробці"
    }
  }

  String get route {
    switch (this) {
      case NavItem.about: return '/${Routes.about}';
      case NavItem.team: return '/${Routes.team}';
      case NavItem.joinUs: return '/${Routes.joinUs}';
      case NavItem.contact: return '/${Routes.contact}';
      case NavItem.submitProperty: return '/${Routes.contact}';

      case NavItem.allProperties: return '/${Routes.offers}';
      case NavItem.sale: return '/${Routes.offers}?type=sale';
      case NavItem.rent: return '/${Routes.offers}?type=rent';
      case NavItem.offMarket: return '/${Routes.offers}?type=off-market';

      case NavItem.forDevelopers: return '/${Routes.services}/${Routes.forDevelopers}';
      case NavItem.design: return '/${Routes.services}/${Routes.servicesDesign}';
      case NavItem.credit: return '/${Routes.services}/${Routes.servicesCredit}';
      case NavItem.advice: return '/${Routes.services}/${Routes.servicesAdvice}';
      case NavItem.abroad: return '/${Routes.services}/${Routes.servicesAbroad}';

      default: return Routes.home;
    }
  }
}