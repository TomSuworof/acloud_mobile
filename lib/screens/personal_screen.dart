import 'dart:math';

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
      return 'admin';
    } else {
      return 'user';
    }
  }

  _isAdmin() => _userStatus == 'admin';

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
                        onPressed: () => Navigator.pushNamed(context, '/unknown'),
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

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          TextFormField(
            initialValue: 'noname',
            enabled: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              hintText: 'Your username'
            ),
          ),
          TextFormField(
            initialValue: 'example@example.com',
            enabled: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: 'Your email'
            ),
          ),
          TextFormField(
            obscureText: true,
            initialValue: '12345678',
            enabled: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: 'Current password'
            ),
          ),
          TextFormField(
            obscureText: true,
            enabled: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: 'New password'
            ),
          ),
          TextFormField(
            obscureText: true,
            enabled: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: 'Confirm new password'
            ),
          ),
          MaterialButton(
            child: Text('Confirm'),
            onPressed: () {},
          ),
          MaterialButton(
            child: Text('Log out'),
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false),
          ),
          MaterialButton(
            child: Text('Delete account'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

}
