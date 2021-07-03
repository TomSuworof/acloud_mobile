import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MainScreen extends StatelessWidget {
  Future<String> getResponseBody() async {
    final params = {
      'clientId': dotenv.env['CLIENT_ID'],
      'clientName': dotenv.env['CLIENT_NAME'],
      'clientSecret': dotenv.env['CLIENT_SECRET']
    };
    print('params: $params');
    final url = Uri.https('acl0ud.herokuapp.com', '/api', params);
    final response = await http.get(url);
    String body = response.body;
    print('body: $body');
    return body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future(() async {
          var text;
          var number;
          await getResponseBody().then((value) {
            text = jsonDecode(value)['msg'];
            number = jsonDecode(value)['number'];
          });
          assert(text == 'This shit is working' && number >= 0);
          Navigator.pushReplacementNamed(context, '/login');
        }),
        builder: (context, snapshot) {
          return TitleWidget();
        },
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'acloud',
                style: Theme
                  .of(context)
                  .textTheme
                  .headline1,
              )
            ],
          ),
        ),
    );
  }
}