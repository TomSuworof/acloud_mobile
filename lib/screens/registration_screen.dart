import 'package:acloud_mobile/enteties/user.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
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
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Sign up',
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

  User _user;

  bool _agreed;

  @override
  void initState() {
    super.initState();
    _agreed = false;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15),
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Username:', style: Theme
            .of(context)
            .textTheme
            .headline6),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: TextFormField(
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
            decoration: InputDecoration(
                hintText: 'Password'
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Confirm your password'
            ),
          ),
        ),
        Text('Secret question:', style: Theme
            .of(context)
            .textTheme
            .headline6),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: 'Enter your secret question'
            ),
          ),
        ),
        Text('Secret answer:', style: Theme
            .of(context)
            .textTheme
            .headline6),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: 'Enter answer on your secret question'
            ),
          ),
        ),
        Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  onChanged: (agree) {
                    setState(() {
                      _agreed = !_agreed;
                    });
                  },
                  value: _agreed,
                ),
                Text('I agree with '),
                InkWell(
                  child: Text('Terms of use'),
                  onTap: () {
                    showDialog(context: context, builder: (_) {
                      return AlertDialog(
                        scrollable: true,
                        title: Text('Terms of use'),
                        content: Column(
                          children: [
                            Text(
                                '1. By clicking the "I agree" button, I express my voluntary, unambiguous and informed consent that my data will be transferred by the acloud service to Heroku for storage and processing.'),
                            Text(''),
                            Text(
                                '2. I agree that by transferring and storing data in this service, I am fully responsible for their content in accordance with the legislation of the Russian Federation.')
                            // todo replace it with API function
                          ],
                        ),
                        actions: [
                          TextButton(
                              child: Text(
                                'Don\'t agree', style: TextStyle(color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onSecondary),),
                              onPressed: () {
                                setState(() {
                                  _agreed = false;
                                });
                                Navigator.of(context).pop();
                              }
                          ),
                          TextButton(
                              child: Text('Agree', style: TextStyle(color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onSecondary),),
                              onPressed: () {
                                setState(() {
                                  _agreed = true;
                                });
                                Navigator.of(context).pop();
                              }
                          ),
                        ],
                      );
                    });
                  },
                )
              ]
          ),
        ),
        Center(
          child: MaterialButton(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onPrimary,
              child: Text('Submit'),
              onPressed: !_agreed ? null : () {
                // send request
                Navigator.pushReplacementNamed(context, '/dashboard');
              }
          ),
        ),
      ],
    );
  }
}