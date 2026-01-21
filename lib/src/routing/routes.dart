class Routes {
  static const home = '/';

  // --- PROPERTIES (Нерухомість) ---
  static const offers = '/offers';

  static String propertyDetails(String id) => '/offers/$id';

  // --- SERVICES (Послуги) ---
  static const services = '/services';
  static const servicesSegment = 'services';
  static const joinUs = '/join-us';

  static const servicesDesign = '/design';
  static const servicesCredit = '/credit';
  static const servicesAdvice = '/advice';
  static const servicesAbroad = '/abroad';

  // --- OTHER (Самостійні сторінки) ---
  static const about = '/about';
  static const team = '/team';
  static const contact = '/contact';

  // --- LEGAL (Юридичні) ---
  static const legal = '/legal';
  static const privacy = '/legal/privacy';
  static const terms = '/legal/terms';
  static const cookies = '/legal/cookies';
}
