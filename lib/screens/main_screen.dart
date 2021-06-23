import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  RefreshController _refreshController = RefreshController(initialRefresh: true);

  var _luckyText = '';
  var _luckyNumber = '';

  Future<String> getResponseBody() async {
    var url = Uri.parse('https://acl0ud.herokuapp.com/api');
    var response = await http.get(url);
    String body = response.body;
    return body;
  }

  void _onRefresh() async {
    getResponseBody().then((value) =>
        setState(() {
          _luckyText = jsonDecode(value)['msg'];
          _luckyNumber = jsonDecode(value)['number'].toString();
        }));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Center(
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
                ),
                SizedBox(
                  height: 24,
                ),
                MaterialButton(
                  child: Text('start'),
                  onPressed: () {
                    // entering app
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
                SizedBox(height: 80),
                Text(_luckyText),
                SizedBox(height: 20),
                Text('Your lucky number is $_luckyNumber')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ApiWidget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => ApiWidgetState();
// }
//
// class ApiWidgetState extends State<ApiWidget> {
//
//   var _luckyText = '';
//   var _luckyNumber = '';
//
//   ApiWidgetState() {
//     print('i do something helpful');
//     getText().then((value) => setState(() {
//       _luckyText = jsonDecode(value)['msg'];
//       _luckyNumber = jsonDecode(value)['number'].toString();
//     }));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//
//       ],
//     );
//   }


// }