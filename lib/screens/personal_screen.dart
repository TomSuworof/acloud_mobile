import 'dart:math';

import 'package:acloud_mobile/enteties/user.dart';
import 'package:flutter/material.dart';

class PersonalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: FloatAppBar(),
      body: Content(),
    );
  }
}

class FloatAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  State<StatefulWidget> createState() => _FloatAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _FloatAppBarState extends State<FloatAppBar> {

  var _userStatus;

  _getUserStatus() {
    if (Random().nextInt(10) > 5) {
      return 'ROLE_ADMIN';
    } else {
      return 'ROLE_USER';
    }
  }

  _isAdmin() => _userStatus == 'ROLE_ADMIN';

  @override
  void initState() {
    super.initState();
    _userStatus = _getUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              right: 15,
              left: 15,
              height: 45,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Material(
                      type: MaterialType.transparency,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Account info',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    if (_isAdmin()) Material(
                      type: MaterialType.transparency,
                      child: IconButton(
                        icon: Icon(Icons.admin_panel_settings),
                        onPressed: () => Navigator.pushNamed(context, '/admin'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}

class Content extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContentState();
}

class _ContentState extends State<Content> {

  User _user;

  @override
  void initState() {
    super.initState();
    _user = User(
        id: 0,
        username: 'noname',
        email: 'example@example.com',
        password: '12345678',
        role: 'ROLE_ADMIN'
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Username:', style: Theme.of(context).textTheme.subtitle1),
          TextFormField(
            initialValue: this._user.username,
            enabled: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Your username'
            ),
          ),
          Text('Email:', style: Theme.of(context).textTheme.subtitle1),
          TextFormField(
            initialValue: this._user.email,
            enabled: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Your email'
            ),
          ),
          Text('Password:', style: Theme.of(context).textTheme.subtitle1),
          TextFormField(
            obscureText: true,
            initialValue: this._user.password,
            enabled: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Current password'
            ),
          ),
          TextFormField(
            obscureText: true,
            enabled: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'New password'
            ),
          ),
          TextFormField(
            obscureText: true,
            enabled: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Confirm your new password'
            ),
          ),
          MaterialButton(
            child: Text('Submit'),
            onPressed: () {},
          ),
          MaterialButton(
            child: Text('Log out'),
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false),
          ),
          MaterialButton(
            child: Text('Delete account'),
            onPressed: () {
              // send request to admin
            },
          ),
        ],
      ),
    );
  }
}
