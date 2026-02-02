class Routes {
  static const home = '/';

  // --- PROPERTIES ---
  static const offers = 'offers';
  static String propertyDetails(String id) => 'offers/$id';

  // --- SERVICES ---
  static const services = 'services';
  static const servicesDesign = 'design'; // сегмент
  static const servicesCredit = 'credit'; // сегмент
  static const servicesAdvice = 'advice'; // сегмент
  static const servicesAbroad = 'abroad'; // сегмент

  // --- OTHER ---
  static const about = 'about';
  static const team = 'team';
  static const joinUs = 'join-us';
  static const contact = 'contact';

  // --- LEGAL ---
  static const legal = 'legal';
}