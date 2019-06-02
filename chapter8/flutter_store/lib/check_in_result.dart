import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/db_helpers.dart';

class CheckInResult extends StatelessWidget {
  CheckInResult({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("已打卡人员")),
      body: FutureBuilder<List<User>>(
        future: DBProvider.db.getAllUser(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                User item = snapshot.data[index];
                return ListTile(
                  title: Text(item.name),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
