import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:notroguery/constants/constants.dart';
import 'package:notroguery/models/token.dart';
import 'package:notroguery/models/card_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(
          InitialHomeState(),
        );
  final _storage = FlutterSecureStorage();

  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is InitialHomeEvent) {
      final jwt = await _storage.read(key: Constants.jwt);

      if (jwt != null) {
        final token = Token.fromJson(jsonDecode(jwt));
        final currentToken = token.token;

        var response = await http.get(
          Uri.https(Constants.server_address, Constants.server_cards_address,
              {"row": event.index.toString()}),
          headers: {
            'Authorization': 'JWT $currentToken',
          },
        );
        if (response.statusCode == Constants.server_response_200) {
          final responseDecode = jsonDecode(
            utf8.decode(response.bodyBytes),
          );

          final cardsList = _convertToListCards(responseDecode);

          yield SuccessHomeState(cards: cardsList);
        } else {
          yield FailureHomeState(
            error: response.statusCode.toString(),
          );
        }
      } else {
        yield FailureHomeJWTState();
      }
    }
  }
}

List<CardModel> _convertToListCards(List<dynamic> jsonResponse) {
  return jsonResponse.map((document) => CardModel.fromJson(document)).toList();
}
