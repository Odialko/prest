// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `POZNAJ NAS`
  String get navPoznajNas {
    return Intl.message('POZNAJ NAS', name: 'navPoznajNas', desc: '', args: []);
  }

  /// `NIERUCHOMOŚCI`
  String get navNieruchomosci {
    return Intl.message(
      'NIERUCHOMOŚCI',
      name: 'navNieruchomosci',
      desc: '',
      args: [],
    );
  }

  /// `USŁUGI`
  String get navUslugi {
    return Intl.message('USŁUGI', name: 'navUslugi', desc: '', args: []);
  }

  /// `ZGŁОŚ`
  String get navZglos {
    return Intl.message('ZGŁОŚ', name: 'navZglos', desc: '', args: []);
  }

  /// `Nieruchomość`
  String get navZglosNieruchomosc {
    return Intl.message(
      'Nieruchomość',
      name: 'navZglosNieruchomosc',
      desc: '',
      args: [],
    );
  }

  /// `Poszukiwanie`
  String get navZglosPoszukiwanie {
    return Intl.message(
      'Poszukiwanie',
      name: 'navZglosPoszukiwanie',
      desc: '',
      args: [],
    );
  }

  /// `KONTAKT`
  String get navKontakt {
    return Intl.message('KONTAKT', name: 'navKontakt', desc: '', args: []);
  }

  /// `UMÓW ROZMOWĘ`
  String get btnUmowRozmowe {
    return Intl.message(
      'UMÓW ROZMOWĘ',
      name: 'btnUmowRozmowe',
      desc: '',
      args: [],
    );
  }

  /// `Zgłoś {val}`
  String dialogZglosTitle(Object val) {
    return Intl.message(
      'Zgłoś $val',
      name: 'dialogZglosTitle',
      desc: '',
      args: [val],
    );
  }

  /// `Definiujemy standardy luksusu na rynku nieruchomości premium w Polsce.`
  String get footerSlogan {
    return Intl.message(
      'Definiujemy standardy luksusu na rynku nieruchomości premium w Polsce.',
      name: 'footerSlogan',
      desc: '',
      args: [],
    );
  }

  /// `Polityka prywatności`
  String get footerPrivacy {
    return Intl.message(
      'Polityka prywatności',
      name: 'footerPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `All rights reserved.`
  String get footerRights {
    return Intl.message(
      'All rights reserved.',
      name: 'footerRights',
      desc: '',
      args: [],
    );
  }

  /// `O prEST`
  String get navAbout {
    return Intl.message('O prEST', name: 'navAbout', desc: '', args: []);
  }

  /// `Zespół`
  String get navTeam {
    return Intl.message('Zespół', name: 'navTeam', desc: '', args: []);
  }

  /// `Dołącz do nas`
  String get navJoinUs {
    return Intl.message('Dołącz do nas', name: 'navJoinUs', desc: '', args: []);
  }

  /// `Wszystkie oferty`
  String get navAllProperties {
    return Intl.message(
      'Wszystkie oferty',
      name: 'navAllProperties',
      desc: '',
      args: [],
    );
  }

  /// `Sprzedaż`
  String get navSale {
    return Intl.message('Sprzedaż', name: 'navSale', desc: '', args: []);
  }

  /// `Wynajem`
  String get navRent {
    return Intl.message('Wynajem', name: 'navRent', desc: '', args: []);
  }

  /// `OFFmarket`
  String get navOffMarket {
    return Intl.message('OFFmarket', name: 'navOffMarket', desc: '', args: []);
  }

  /// `Dla deweloperów`
  String get navForDevelopers {
    return Intl.message(
      'Dla deweloperów',
      name: 'navForDevelopers',
      desc: '',
      args: [],
    );
  }

  /// `prEST design`
  String get navDesign {
    return Intl.message('prEST design', name: 'navDesign', desc: '', args: []);
  }

  /// `Doradztwo kredytowe`
  String get navCredit {
    return Intl.message(
      'Doradztwo kredytowe',
      name: 'navCredit',
      desc: '',
      args: [],
    );
  }

  /// `Doradztwo inwestycyjne`
  String get navAdvice {
    return Intl.message(
      'Doradztwo inwestycyjne',
      name: 'navAdvice',
      desc: '',
      args: [],
    );
  }

  /// `Zakupy za granicą`
  String get navAbroad {
    return Intl.message(
      'Zakupy za granicą',
      name: 'navAbroad',
      desc: '',
      args: [],
    );
  }

  /// `Poznaj historię prEST – już wkrótce!`
  String get descAbout {
    return Intl.message(
      'Poznaj historię prEST – już wkrótce!',
      name: 'descAbout',
      desc: '',
      args: [],
    );
  }

  /// `Nasz zespół specjalistów – już вkrótce!`
  String get descTeam {
    return Intl.message(
      'Nasz zespół specjalistów – już вkrótce!',
      name: 'descTeam',
      desc: '',
      args: [],
    );
  }

  /// `Dostęp do ofert poza rynkiem – już вkrótce!`
  String get descOffMarket {
    return Intl.message(
      'Dostęp do ofert poza rynkiem – już вkrótce!',
      name: 'descOffMarket',
      desc: '',
      args: [],
    );
  }

  /// `Stań się częścią naszej wizji – już вkrótce!`
  String get descJoinUs {
    return Intl.message(
      'Stań się częścią naszej wizji – już вkrótce!',
      name: 'descJoinUs',
      desc: '',
      args: [],
    );
  }

  /// `Strona w budowie – już вkrótce!`
  String get descInBuild {
    return Intl.message(
      'Strona w budowie – już вkrótce!',
      name: 'descInBuild',
      desc: '',
      args: [],
    );
  }

  /// `ZOBACZ OFERTĘ`
  String get btnZobaczOferte {
    return Intl.message(
      'ZOBACZ OFERTĘ',
      name: 'btnZobaczOferte',
      desc: '',
      args: [],
    );
  }

  /// `Już wkrótce...`
  String get descSoon {
    return Intl.message('Już wkrótce...', name: 'descSoon', desc: '', args: []);
  }

  /// `O nas`
  String get aboutSectionLabel {
    return Intl.message('O nas', name: 'aboutSectionLabel', desc: '', args: []);
  }

  /// `Luksus zdefiniowany na nowo`
  String get aboutSectionTitle {
    return Intl.message(
      'Luksus zdefiniowany na nowo',
      name: 'aboutSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `PrEST to butikowa agencja nieruchomości premium, gdzie pasja do architektury łączy się z najwyższym standardem obsługi klienta.`
  String get aboutSectionDesc {
    return Intl.message(
      'PrEST to butikowa agencja nieruchomości premium, gdzie pasja do architektury łączy się z najwyższym standardem obsługi klienta.',
      name: 'aboutSectionDesc',
      desc: '',
      args: [],
    );
  }

  /// `Oferty specjalne`
  String get homeOffersLabel {
    return Intl.message(
      'Oferty specjalne',
      name: 'homeOffersLabel',
      desc: '',
      args: [],
    );
  }

  /// `Nieruchomości`
  String get homeOffersTitle {
    return Intl.message(
      'Nieruchomości',
      name: 'homeOffersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Błąd ładowania danych`
  String get errorLoading {
    return Intl.message(
      'Błąd ładowania danych',
      name: 'errorLoading',
      desc: '',
      args: [],
    );
  }

  /// `Senior Real Estate Advisor`
  String get roleSeniorAdvisor {
    return Intl.message(
      'Senior Real Estate Advisor',
      name: 'roleSeniorAdvisor',
      desc: '',
      args: [],
    );
  }

  /// `Nr licencji {number}`
  String licenseNumber(Object number) {
    return Intl.message(
      'Nr licencji $number',
      name: 'licenseNumber',
      desc: '',
      args: [number],
    );
  }

  /// `Wierzymy w siłę zespołu.`
  String get aboutBelieveInTeam {
    return Intl.message(
      'Wierzymy w siłę zespołu.',
      name: 'aboutBelieveInTeam',
      desc: '',
      args: [],
    );
  }

  /// `Skuteczna sprzedaż.\nPrzemyślany zakup.`
  String get aboutHeroTitle {
    return Intl.message(
      'Skuteczna sprzedaż.\nPrzemyślany zakup.',
      name: 'aboutHeroTitle',
      desc: '',
      args: [],
    );
  }

  /// `Zajmujemy się sprzedażą i wynajmem nieruchomości. Takich transakcji mamy na koncie najwięcej. Ponadto wyszukujemy dla Klientów perełki na specjalne zamówienie.`
  String get aboutHeroDesc1 {
    return Intl.message(
      'Zajmujemy się sprzedażą i wynajmem nieruchomości. Takich transakcji mamy na koncie najwięcej. Ponadto wyszukujemy dla Klientów perełki na specjalne zamówienie.',
      name: 'aboutHeroDesc1',
      desc: '',
      args: [],
    );
  }

  /// `prEST to spotkanie kontrastujących osobowości i pozornie różnych światów, ale łączy nas zamiłowanie do sprzedaży i pracy z ludźmi, a także pasja do nieruchomości.`
  String get aboutHeroDesc2 {
    return Intl.message(
      'prEST to spotkanie kontrastujących osobowości i pozornie różnych światów, ale łączy nas zamiłowanie do sprzedaży i pracy z ludźmi, a także pasja do nieruchomości.',
      name: 'aboutHeroDesc2',
      desc: '',
      args: [],
    );
  }

  /// `Dlatego każdą sprzedażą zajmuje się u nas nie jedna osoba, lecz kilkuosobowy zespół specjalistów, którzy wspólnie dbają o każdy detal procesu. `
  String get aboutTeamPowerP1 {
    return Intl.message(
      'Dlatego każdą sprzedażą zajmuje się u nas nie jedna osoba, lecz kilkuosobowy zespół specjalistów, którzy wspólnie dbają o każdy detal procesu. ',
      name: 'aboutTeamPowerP1',
      desc: '',
      args: [],
    );
  }

  /// `Łączymy wiedzę rynkową, doświadczenie inwestycyjne, skuteczny marketing i mądre, spokojne negocjacje.`
  String get aboutTeamPowerP2Bold {
    return Intl.message(
      'Łączymy wiedzę rynkową, doświadczenie inwestycyjne, skuteczny marketing i mądre, spokojne negocjacje.',
      name: 'aboutTeamPowerP2Bold',
      desc: '',
      args: [],
    );
  }

  /// `Pracujemy uważnie i z zaangażowaniem, słuchamy, analizujemy, doradzamy. Prowadzimy klientów przez cały proces krok po kroku, tak aby czuli się pewnie, bezpiecznie i po prostu dobrze zaopiekowani.`
  String get aboutTeamPowerP3 {
    return Intl.message(
      'Pracujemy uważnie i z zaangażowaniem, słuchamy, analizujemy, doradzamy. Prowadzimy klientów przez cały proces krok po kroku, tak aby czuli się pewnie, bezpiecznie i po prostu dobrze zaopiekowani.',
      name: 'aboutTeamPowerP3',
      desc: '',
      args: [],
    );
  }

  /// `Bo dla nas nieruchomości to nie tylko transakcje. `
  String get aboutTeamPowerP4 {
    return Intl.message(
      'Bo dla nas nieruchomości to nie tylko transakcje. ',
      name: 'aboutTeamPowerP4',
      desc: '',
      args: [],
    );
  }

  /// `To ważne decyzje i realne historie ludzi, którym towarzyszymy od pierwszej rozmowy aż do finalnego podpisu.`
  String get aboutTeamPowerP5Bold {
    return Intl.message(
      'To ważne decyzje i realne historie ludzi, którym towarzyszymy od pierwszej rozmowy aż do finalnego podpisu.',
      name: 'aboutTeamPowerP5Bold',
      desc: '',
      args: [],
    );
  }

  /// `Umów rozmowę`
  String get btnScheduleCall {
    return Intl.message(
      'Umów rozmowę',
      name: 'btnScheduleCall',
      desc: '',
      args: [],
    );
  }

  /// `DOSKONAŁA obsługa rodzi skuteczne transakcje dzięki nieprzeciętnym `
  String get joinMainIntro1 {
    return Intl.message(
      'DOSKONAŁA obsługa rodzi skuteczne transakcje dzięki nieprzeciętnym ',
      name: 'joinMainIntro1',
      desc: '',
      args: [],
    );
  }

  /// `LUDZIOM.`
  String get joinMainIntro2Bold {
    return Intl.message(
      'LUDZIOM.',
      name: 'joinMainIntro2Bold',
      desc: '',
      args: [],
    );
  }

  /// `Nasz zespół to nasz największy kapitał.`
  String get joinTeamTitle {
    return Intl.message(
      'Nasz zespół to nasz największy kapitał.',
      name: 'joinTeamTitle',
      desc: '',
      args: [],
    );
  }

  /// `Jako zaufani doradcy najbardziej wymagających klientów prywatnych i instytucjonalnych, nasi agenci każdego dnia potwierdzają, że ich profesjonalizm, zaangażowanie i skuteczność realnie przekładają się na sukcesy naszych klientów.`
  String get joinTeamDesc {
    return Intl.message(
      'Jako zaufani doradcy najbardziej wymagających klientów prywatnych i instytucjonalnych, nasi agenci każdego dnia potwierdzają, że ich profesjonalizm, zaangażowanie i skuteczność realnie przekładają się na sukcesy naszych klientów.',
      name: 'joinTeamDesc',
      desc: '',
      args: [],
    );
  }

  /// `Szukamy talentów. Pasjonatów sprzedaży. Ludzi, którzy chcą grać w pierwszej lidze.`
  String get joinTeamQuote {
    return Intl.message(
      'Szukamy talentów. Pasjonatów sprzedaży. Ludzi, którzy chcą grać w pierwszej lidze.',
      name: 'joinTeamQuote',
      desc: '',
      args: [],
    );
  }

  /// `Pomagamy realnie osiągać cele sprzedażowe.`
  String get joinGoalsTitle {
    return Intl.message(
      'Pomagamy realnie osiągać cele sprzedażowe.',
      name: 'joinGoalsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dołączając do zespołu prEST, stajesz się częścią dynamicznego, ambitnego środowiska, które ceni kreatywność, zaangażowanie i rozwój. Budujemy wiedzę, szlifujemy warsztat i wspieramy w tworzeniu silnej marki osobistej.\n\n`
  String get joinGoalsDescP1 {
    return Intl.message(
      'Dołączając do zespołu prEST, stajesz się częścią dynamicznego, ambitnego środowiska, które ceni kreatywność, zaangażowanie i rozwój. Budujemy wiedzę, szlifujemy warsztat i wspieramy w tworzeniu silnej marki osobistej.\n\n',
      name: 'joinGoalsDescP1',
      desc: '',
      args: [],
    );
  }

  /// `W prEST pomagamy Agentom nie tylko efektywnie sprzedawać. `
  String get joinGoalsDescP2 {
    return Intl.message(
      'W prEST pomagamy Agentom nie tylko efektywnie sprzedawać. ',
      name: 'joinGoalsDescP2',
      desc: '',
      args: [],
    );
  }

  /// `Pomagamy im rosnąć, rozwijać skrzydła i błyszczeć własnymi sukcesami.`
  String get joinGoalsDescP2Bold {
    return Intl.message(
      'Pomagamy im rosnąć, rozwijać skrzydła i błyszczeć własnymi sukcesami.',
      name: 'joinGoalsDescP2Bold',
      desc: '',
      args: [],
    );
  }

  /// `Wypełnij formularz`
  String get joinFormTitle {
    return Intl.message(
      'Wypełnij formularz',
      name: 'joinFormTitle',
      desc: '',
      args: [],
    );
  }

  /// `Wyślij nam swoje CV, a my skontaktujemy się z Tobą wkrótce.`
  String get joinFormSubtitle {
    return Intl.message(
      'Wyślij nam swoje CV, a my skontaktujemy się z Tobą wkrótce.',
      name: 'joinFormSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Wgraj CV`
  String get btnUploadCv {
    return Intl.message('Wgraj CV', name: 'btnUploadCv', desc: '', args: []);
  }

  /// `POLITYKA PRYWATNOŚCI`
  String get privacyTitle {
    return Intl.message(
      'POLITYKA PRYWATNOŚCI',
      name: 'privacyTitle',
      desc: '',
      args: [],
    );
  }

  /// `1. Informacje ogólne`
  String get privacySec1Title {
    return Intl.message(
      '1. Informacje ogólne',
      name: 'privacySec1Title',
      desc: '',
      args: [],
    );
  }

  /// `Dbamy o Twoją prywatność oraz bezpieczeństwo danych osobowych. Niniejsza Polityka Prywatności określa zasady przetwarzania danych osobowych przez PREST spółka z ograniczoną odpowiedzialnością, w związku z prowadzeniem działalności w zakresie pośrednictwa w obrocie nieruchomościami, zgodnie z obowiązującymi przepisami prawa.`
  String get privacySec1P1 {
    return Intl.message(
      'Dbamy o Twoją prywatność oraz bezpieczeństwo danych osobowych. Niniejsza Polityka Prywatności określa zasady przetwarzania danych osobowych przez PREST spółka z ograniczoną odpowiedzialnością, w związku z prowadzeniem działalności w zakresie pośrednictwa w obrocie nieruchomościami, zgodnie z obowiązującymi przepisami prawa.',
      name: 'privacySec1P1',
      desc: '',
      args: [],
    );
  }

  /// `Polityka została sporządzona w szczególności na podstawie: RODO, ustawy o ochronie danych osobowych, ustawy o gospodarce nieruchomościami, ustawy o świadczeniu usług drogą elektroniczną та ustawy o przeciwdziałaniu praniu pieniędzy (AML).`
  String get privacySec1P2 {
    return Intl.message(
      'Polityka została sporządzona w szczególności na podstawie: RODO, ustawy o ochronie danych osobowych, ustawy o gospodarce nieruchomościami, ustawy o świadczeniu usług drogą elektroniczną та ustawy o przeciwdziałaniu praniu pieniędzy (AML).',
      name: 'privacySec1P2',
      desc: '',
      args: [],
    );
  }

  /// `2. Administrator danych osobowych`
  String get privacySec2Title {
    return Intl.message(
      '2. Administrator danych osobowych',
      name: 'privacySec2Title',
      desc: '',
      args: [],
    );
  }

  /// `Administratorem danych osobowych jest: PREST spółka z ograniczoną odpowiedzialnością z siedzibą w Polsce (dalej: „Administrator”).`
  String get privacySec2P1 {
    return Intl.message(
      'Administratorem danych osobowych jest: PREST spółka z ograniczoną odpowiedzialnością z siedzibą w Polsce (dalej: „Administrator”).',
      name: 'privacySec2P1',
      desc: '',
      args: [],
    );
  }

  /// `Administrator przetwarza dane osobowe z należytą starannością, stosując odpowiednie środki techniczne i organizacyjne zapewniające ich ochronę.`
  String get privacySec2P2 {
    return Intl.message(
      'Administrator przetwarza dane osobowe z należytą starannością, stosując odpowiednie środki techniczne i organizacyjne zapewniające ich ochronę.',
      name: 'privacySec2P2',
      desc: '',
      args: [],
    );
  }

  /// `3. Zakres przetwarzanych danych`
  String get privacySec3Title {
    return Intl.message(
      '3. Zakres przetwarzanych danych',
      name: 'privacySec3Title',
      desc: '',
      args: [],
    );
  }

  /// `W zależności od relacji, Administrator może przetwarzać w szczególności: imię i nazwisko, adres e-mail, numer telefonu, adres zamieszkania, dane dotyczące nieruchomości (księga wieczysta, powierzchnia), dane transakcyjne та dane wymagane przepisami AML.`
  String get privacySec3P1 {
    return Intl.message(
      'W zależności od relacji, Administrator może przetwarzać w szczególności: imię i nazwisko, adres e-mail, numer telefonu, adres zamieszkania, dane dotyczące nieruchomości (księga wieczysta, powierzchnia), dane transakcyjne та dane wymagane przepisami AML.',
      name: 'privacySec3P1',
      desc: '',
      args: [],
    );
  }

  /// `4. Cele, podstawy prawne i okres przetwarzania`
  String get privacySec4Title {
    return Intl.message(
      '4. Cele, podstawy prawne i okres przetwarzania',
      name: 'privacySec4Title',
      desc: '',
      args: [],
    );
  }

  /// `4.1. Pośrednictwo: art. 6 ust. 1 lit. b RODO (wykonanie umowy). Przetwarzane przez czas trwania umowy oraz okres przedawnienia roszczeń.`
  String get privacySec4P1 {
    return Intl.message(
      '4.1. Pośrednictwo: art. 6 ust. 1 lit. b RODO (wykonanie umowy). Przetwarzane przez czas trwania umowy oraz okres przedawnienia roszczeń.',
      name: 'privacySec4P1',
      desc: '',
      args: [],
    );
  }

  /// `4.2. Komunikacja: art. 6 ust. 1 lit. f RODO (uzasadniony interes). Do czasu zakończenia komunikacji lub sprzeciwu.`
  String get privacySec4P2 {
    return Intl.message(
      '4.2. Komunikacja: art. 6 ust. 1 lit. f RODO (uzasadniony interes). Do czasu zakończenia komunikacji lub sprzeciwu.',
      name: 'privacySec4P2',
      desc: '',
      args: [],
    );
  }

  /// `4.3. Obowiązki prawne i AML: art. 6 ust. 1 lit. c RODO. Dokumenty księgowe – 6 lat, dane AML – 5 lat.`
  String get privacySec4P3 {
    return Intl.message(
      '4.3. Obowiązki prawne i AML: art. 6 ust. 1 lit. c RODO. Dokumenty księgowe – 6 lat, dane AML – 5 lat.',
      name: 'privacySec4P3',
      desc: '',
      args: [],
    );
  }

  /// `4.4. Marketing: art. 6 ust. 1 lit. f RODO + zgoda użytkownika. Do momentu cofnięcia zgody.`
  String get privacySec4P4 {
    return Intl.message(
      '4.4. Marketing: art. 6 ust. 1 lit. f RODO + zgoda użytkownika. Do momentu cofnięcia zgody.',
      name: 'privacySec4P4',
      desc: '',
      args: [],
    );
  }

  /// `5. Odbiorcy danych`
  String get privacySec5Title {
    return Intl.message(
      '5. Odbiorcy danych',
      name: 'privacySec5Title',
      desc: '',
      args: [],
    );
  }

  /// `Dane mogą być przekazywane: notariuszom, kancelariom prawnym, biurom rachunkowym, dostawcom usług IT oraz organom publicznym на podstawie przepisów prawa.`
  String get privacySec5P1 {
    return Intl.message(
      'Dane mogą być przekazywane: notariuszom, kancelariom prawnym, biurom rachunkowym, dostawcom usług IT oraz organom publicznym на podstawie przepisów prawa.',
      name: 'privacySec5P1',
      desc: '',
      args: [],
    );
  }

  /// `6. Prawa osób, których dane dotyczą`
  String get privacySec6Title {
    return Intl.message(
      '6. Prawa osób, których dane dotyczą',
      name: 'privacySec6Title',
      desc: '',
      args: [],
    );
  }

  /// `Każdej osobie przysługuje prawo do: dostępu do danych, sprostowania, usunięcia, ograniczenia przetwarzania, wniesienia sprzeciwu, przenoszenia danych та cofnięcia zgody.`
  String get privacySec6P1 {
    return Intl.message(
      'Każdej osobie przysługuje prawo do: dostępu do danych, sprostowania, usunięcia, ograniczenia przetwarzania, wniesienia sprzeciwu, przenoszenia danych та cofnięcia zgody.',
      name: 'privacySec6P1',
      desc: '',
      args: [],
    );
  }

  /// `Przysługuje również prawo wniesienia skargi do Prezesa Urzędu Ochrony Danych Osobowych.`
  String get privacySec6P2 {
    return Intl.message(
      'Przysługuje również prawo wniesienia skargi do Prezesa Urzędu Ochrony Danych Osobowych.',
      name: 'privacySec6P2',
      desc: '',
      args: [],
    );
  }

  /// `7. Pliki cookies`
  String get privacySec7Title {
    return Intl.message(
      '7. Pliki cookies',
      name: 'privacySec7Title',
      desc: '',
      args: [],
    );
  }

  /// `Strona wykorzystuje pliki cookies w celach technicznych, statystycznych (Google Analytics) oraz marketingowych. Użytkownik może samodzielnie zarządzać cookies w ustawieniach przeglądarki.`
  String get privacySec7P1 {
    return Intl.message(
      'Strona wykorzystuje pliki cookies w celach technicznych, statystycznych (Google Analytics) oraz marketingowych. Użytkownik może samodzielnie zarządzać cookies w ustawieniach przeglądarki.',
      name: 'privacySec7P1',
      desc: '',
      args: [],
    );
  }

  /// `8. Postanowienia końcowe`
  String get privacySec8Title {
    return Intl.message(
      '8. Postanowienia końcowe',
      name: 'privacySec8Title',
      desc: '',
      args: [],
    );
  }

  /// `Administrator zastrzega sobie prawo do aktualizacji Polityki Prywatności w przypadku zmiany przepisów prawa lub sposobu działania strony internetowej.`
  String get privacySec8P1 {
    return Intl.message(
      'Administrator zastrzega sobie prawo do aktualizacji Polityki Prywatności w przypadku zmiany przepisów prawa lub sposobu działania strony internetowej.',
      name: 'privacySec8P1',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
