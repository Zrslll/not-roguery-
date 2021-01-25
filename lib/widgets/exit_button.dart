import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notroguery/constants/constants.dart';
import 'package:notroguery/constants/localization.dart';
import 'package:notroguery/pages/login_page/login_page.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _storage = FlutterSecureStorage();

    return RaisedButton(
      onPressed: () async {
        await _storage.delete(key: Constants.jwt);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
      child: Text(Localization.exit),
    );
  }
}
