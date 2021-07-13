import 'package:flutter/material.dart';

class PasswordResetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: FloatAppBar(),
      body: Content(),
    );
  }
}

class FloatAppBar extends StatelessWidget with PreferredSizeWidget {

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

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
                        icon: Icon(Icons.account_circle),
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Password reset',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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

  bool _showEmail;
  String _email;

  @override
  void initState() {
    super.initState();
    _showEmail = false;
    _email = 'e*******@example.com';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Enter your username:', style: Theme
              .of(context)
              .textTheme
              .headline6),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: TextFormField(
              decoration: InputDecoration(
                // border: InputBorder.none,
                  hintText: 'Your username'
              ),
            ),
          ),
          Center(
            child:
            MaterialButton(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onPrimary,
              child: Text('Submit'),
              onPressed: () {
                // send request
                // change visibility
                setState(() {
                  _showEmail = true;
                });
              },
            ),
          ),
          Visibility(
              visible: _showEmail,
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Message was sent to $_email',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6,
                  softWrap: true,
                ), // todo
              )
          )
        ],
      ),
    );
  }
}