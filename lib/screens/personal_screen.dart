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
  State<StatefulWidget> createState() => _FloatAppBarState(preferredSize);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _FloatAppBarState extends State<FloatAppBar> {

  Size preferredSize;

  _FloatAppBarState(this.preferredSize);

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
              height: preferredSize.height * 0.8,
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
    return ListView(
      padding: EdgeInsets.all(15),
      children: [
        Text('Username:', style: Theme
            .of(context)
            .textTheme
            .headline6),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: TextFormField(
            initialValue: this._user.username,
            enabled: false,
            decoration: InputDecoration(
                hintText: 'Your username'
            ),
          ),
        ),
        Text('Email:', style: Theme
            .of(context)
            .textTheme
            .headline6),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: TextFormField(
            initialValue: this._user.email,
            enabled: true,
            decoration: InputDecoration(
                hintText: 'Your email'
            ),
          ),
        ),
        Text('Password:', style: Theme
            .of(context)
            .textTheme
            .headline6),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: TextFormField(
            obscureText: true,
            initialValue: this._user.password,
            enabled: true,
            decoration: InputDecoration(
                hintText: 'Current password'
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: TextFormField(
            obscureText: true,
            enabled: true,
            decoration: InputDecoration(
                hintText: 'New password'
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: TextFormField(
            obscureText: true,
            enabled: true,
            decoration: InputDecoration(
                hintText: 'Confirm your new password'
            ),
          ),
        ),
        Center(
          child: MaterialButton(
            color: Theme
                .of(context)
                .colorScheme
                .onPrimary,
            child: Text('Submit'),
            onPressed: () {
              // send request for updating
              // load new content page
              Navigator.of(context).pop();
            },
          ),
        ),
        Center(
          child: MaterialButton(
            color: Theme
                .of(context)
                .buttonColor,
            child: Text('Log out'),
            onPressed: () =>
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', (Route<dynamic> route) => false),
          ),
        ),
        Center(
          child: MaterialButton(
            color: Theme
                .of(context)
                .buttonColor,
            child: Text('Delete account'),
            onPressed: () {
              // send request to admin
            },
          ),
        ),
      ],
    );
  }
}
