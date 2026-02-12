class Routes {
  static const home = '/';
  static const offers = 'offers';
  static const services = 'services';
  static const servicesDesign = 'design';
  static const servicesCredit = 'credit';
  static const servicesAdvice = 'advice';
  static const servicesAbroad = 'abroad';
  static const forDevelopers = 'for-developers';
  static const about = 'about';
  static const team = 'team';
  static const joinUs = 'join-us';
  static const contact = 'contact';
  static const privacyPolicy = '/privacy-policy';

  // Хелпер для навігації на деталі оферти
  static String offerDetails(int id) => '/offers/$id';
}