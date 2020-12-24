import 'dart:developer';
import 'package:demo_flutter/models/user.dart';
import 'package:demo_flutter/models/user_list_response.dart';
import 'package:demo_flutter/services/user_service.dart';
import 'package:demo_flutter/utils/error_handaling.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  Future<UserListResponse> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = UserService.userList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List")),
      body: Center(
        child: FutureBuilder<UserListResponse>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.isSuccess) {
                return getUserListView(snapshot.data.users);
              } else {
                return Text(snapshot.data.message);
              }
            } else if (snapshot.hasError) {
              return Text(ErrorHandling.SOMETHINF_IS_WRONG);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget getUserListView(List<User> userList) {
    return ListView.separated(
      itemCount: userList.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          key: Key(userList[index].id.toString()),
          title: Text(userList[index].name),
          trailing: Icon(Icons.arrow_forward_ios),
          leading: Icon(Icons.message),
        );
      },
    );
  }
}
