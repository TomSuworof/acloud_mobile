import 'dart:io';

import 'package:acloud_mobile/userFile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: FloatAppBar(),
      body: Center(
        child: Content(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        onPressed: () async {
          FilePickerResult result = await FilePicker.platform.pickFiles();

          if (result != null) {
            File file = File(result.files.single.path);
            print(file.uri);
          } else {
            // User canceled the picker
          }
        },
      ),
    );
  }
}

class FloatAppBar extends StatefulWidget with PreferredSizeWidget{
  @override
  _FloatAppBarState createState() => _FloatAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _FloatAppBarState extends State<FloatAppBar>  {

  FocusNode _searchFieldFocusNode;

  @override
  void initState() {
    super.initState();
    _searchFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchFieldFocusNode.dispose();
    super.dispose();
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
                  //               border: Border.all(color: Colors.grey),
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
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // print('going to text field...');
                          _searchFieldFocusNode.requestFocus();
                        },
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        focusNode: _searchFieldFocusNode,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            hintText: "Search..."
                        ),
                      ),
                    ),
                    Material(
                      type: MaterialType.transparency,
                      child: IconButton(
                        icon: Icon(Icons.person),
                        onPressed: () => Navigator.pushNamed(context, '/personal'),
                        // onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonalPage())),
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

  final List<UserFile> files = [
    UserFile(filename: 'Book about the princess', canBeDownloadedPublicly: true),
    UserFile(filename: 'Yandex book', canBeDownloadedPublicly: true),
    UserFile(filename: 'Simple doc', canBeDownloadedPublicly: false),
    UserFile(filename: 'Simple doc', canBeDownloadedPublicly: false),
    UserFile(filename: 'Simple doc', canBeDownloadedPublicly: false),
    UserFile(filename: 'Simple doc', canBeDownloadedPublicly: false),
    UserFile(filename: 'Simple doc', canBeDownloadedPublicly: false),
    UserFile(filename: 'Simple doc', canBeDownloadedPublicly: false),
    UserFile(filename: 'Simple doc', canBeDownloadedPublicly: false),
    UserFile(filename: 'Simple doc', canBeDownloadedPublicly: false),
    UserFile(filename: 'Simple doc', canBeDownloadedPublicly: false),

  ];

  List<UserFileWidget> _getWidgetsOfFiles() {
    List<UserFile> userFiles = files; //jsonDecode(File('lib/files.json').readAsStringSync())['files'];
    List<UserFileWidget> userFilesWidgets = [];
    for (UserFile userFile in userFiles) {
      userFilesWidgets.add(UserFileWidget(userFile));
    }
    return userFilesWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      margin: EdgeInsets.symmetric(horizontal: 9),
      child: GridView.count(
        mainAxisSpacing: 9,
        crossAxisSpacing: 9,
        crossAxisCount: 2,
        children: _getWidgetsOfFiles(),
      ),
    );
  }
}

class UserFileWidget extends StatelessWidget {
  final UserFile userFile;
  var menuPublicDownloadText;

  UserFileWidget(this.userFile) {
    this.menuPublicDownloadText = userFile.canBeDownloadedPublicly ? 'Disable downloading' : 'Share';
  }

  Widget _isShared() {
    bool can = userFile.canBeDownloadedPublicly;
    var icon = can ? Icons.insert_link : Icons.lock_outline;
    var text = can ? 'Shared' : 'Private';

    return Container(
      child: Row(
        children: [
          Icon(icon, size: 18),
          Text(text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FocusedMenuHolder(
      blurBackgroundColor: Colors.grey,
      duration: Duration(milliseconds: 300),
      animateMenuItems: false,
      blurSize: 0.1,
      menuBoxDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      onPressed: () {
        print('downloading...');
      },
      menuItems: [
        FocusedMenuItem(
            title: Text('Download'),
            onPressed: () {
              print('downloading...');
            }
        ),
        FocusedMenuItem(
            title: Text('Delete'),
            onPressed: () {
              print('deleting...');
            }
        ),
        FocusedMenuItem(
            title: Text(this.menuPublicDownloadText), // should depend on availability of file
            onPressed: () {
              if (userFile.canBeDownloadedPublicly) {
                print('disabling...');
              } else {
                print('sharing...');
              }
            }
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        margin: EdgeInsets.all(7),
        padding: EdgeInsets.all(15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  userFile.filename,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              _isShared(),
            ]
        ),
      ),
    );
  }
}