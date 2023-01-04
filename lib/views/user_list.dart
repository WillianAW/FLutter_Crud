import 'package:crud_flutter/data/dummy_users.dart';
import 'package:flutter/material.dart';
import 'package:crud_flutter/provider/users.dart';
import 'package:crud_flutter/components/user_tile.dart';
import 'package:provider/provider.dart';
import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/provider/users.dart';
import 'package:crud_flutter/routes/app_routes.dart';


class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users user = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Lista de usuários '),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                 Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM,
                arguments: user,
              );
               
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: user.count,
          itemBuilder: (ctx, i) => UserTile(user.byIndex(i)),
        ));
  }
}
