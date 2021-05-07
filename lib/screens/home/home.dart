import 'package:challenge_flutter/constants.dart';
import 'package:challenge_flutter/provider/items.dart';
import 'package:challenge_flutter/routes/app_routes.dart';
import 'package:challenge_flutter/screens/home/components/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Items data = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: whiteColor,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.ITEM_FORM);
              },
            )
          ],
          title: Text(
            'Lista de itens',
            style: TextStyle(color: whiteColor),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          itemBuilder: (ctx, index) => TodoListTile(
            item: data.indexCount(index),
          ),
          itemCount: data.count,
        ));
  }
}
