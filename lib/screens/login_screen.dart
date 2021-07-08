import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(80.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Welcome',
//                 style: Theme.of(context).textTheme.headline2,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'Username',
//                 ),
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                 ),
//                 obscureText: true,
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               MaterialButton(
//                 child: Text('LOGIN'),
//                 onPressed: () {
//                   // entering app
//                   Navigator.pushReplacementNamed(context, '/dashboard');
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class LoginScreen extends StatelessWidget {
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
                          'Login',
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

class Content extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Username:', style: Theme
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
          Text('Password:', style: Theme
              .of(context)
              .textTheme
              .headline6),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: TextFormField(
              decoration: InputDecoration(
                // border: InputBorder.none,
                hintText: 'Password',
              ),
              obscureText: true,
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onPrimary,
                  child: Text('Log In'),
                  onPressed: () {
                    // entering app
                    Navigator.pushReplacementNamed(context, '/dashboard');
                  },
                ),
                MaterialButton(
                  color: Theme
                      .of(context)
                      .buttonColor,
                  child: Text('Sign Up'),
                  onPressed: () {
                    // entering app
                    Navigator.pushNamed(context, '/registration');
                  },
                )
              ]
          )
        ],
      ),
    );
  }
}