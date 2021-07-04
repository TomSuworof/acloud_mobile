import 'package:acloud_mobile/enteties/user.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
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
                          'Admin',
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

  List<User> _users;

  @override
  void initState() {
    super.initState();
    _users = [];
    _users.add(User(id: 0, username: 'noname', role: 'ROLE_ADMIN'));
    _users.add(User(id: 1, username: 'nonamenononononononon', role: 'ROLE_USER'));
    _users.add(User(id: 2, username: 'omgomgomgomgomgogmogm', role: 'ROLE_USER'));
    _users.add(User(id: 3, username: 'aaaaaaaaaaaaaaaaaa', role: 'ROLE_USER'));
  }

  List<TableRow> _getUserRows() {
    List<TableRow> rows = [];
    _users.forEach((user) => {
      rows.add(TableRow(children: [
        _TableCell(value: user.id.toString(), isHeader: false),
        _TableCell(value: user.username.toString(), isHeader: false),
        _TableCell(value: user.role.toString(), isHeader: false),
        Column(children: [
          MaterialButton(
            child: Text('Delete (block)'),
            onPressed: () {
              // send request for deleting
            },
          ),
          MaterialButton(
            child: Text('Make user'),
            onPressed: () {
              // send request for making user
            },
          )
        ]),
      ]))
    });
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: TableBorder.all(color: Theme.of(context).accentColor),
        children: [
          TableRow(children : [
            _TableCell(value: 'ID', isHeader: true),
            _TableCell(value: 'Username', isHeader: true),
            _TableCell(value: 'Role', isHeader: true),
            _TableCell(value: 'Actions', isHeader: true),
          ]),
          ..._getUserRows(),
        ],
      ),
    );
  }
}

class _TableCell extends StatelessWidget {

  final value;
  final isHeader;

  _TableCell({this.value, this.isHeader});

  Text _getText(BuildContext context) {
    if (this.isHeader) {
      return Text(this.value, style: Theme.of(context).textTheme.subtitle2, softWrap: true);
    } else {
      return Text(this.value, softWrap: true,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TableCell(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: _getText(context),
        )
    );
  }
}
