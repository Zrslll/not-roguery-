import 'package:notroguery/constants/localization.dart';

class Constants {
  const Constants._();

  static const server_address = 'trello.backend.tests.nekidaem.ru';

  static const server_login_address =
      'https://trello.backend.tests.nekidaem.ru/api/v1/users/login/';

  static const server_cards_address = '/api/v1/cards/';

  static const username = 'username';

  static const password = 'password';

  static const jwt = 'jwt';

  static const exp = 'exp';

  static const server_response_200 = 200;

  static final List<String> tabCategories = [
    Localization.on_hold,
    Localization.in_progress,
    Localization.needs_review,
    Localization.approved,
  ];
}
