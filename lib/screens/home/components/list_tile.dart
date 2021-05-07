import 'package:desafio_flutter/models/item.dart';
import 'package:desafio_flutter/provider/items.dart';
import 'package:desafio_flutter/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoListTile extends StatelessWidget {
  final Item item;

  const TodoListTile({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final icon = Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Icon(Icons.shopping_cart_outlined),
    );
    return ListTile(
      leading: icon,
      title: Text(item.name),
      subtitle: Row(
        children: [
          Text(item.quantity + 'un'),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          Text(r'R$' + item.price),
        ],
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.edit,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.ITEM_FORM,
                  arguments: item,
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('Excluir Item?'),
                          content: Text('Isso excluíra permanentemente!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Não'),
                            ),
                            TextButton(
                              onPressed: () {
                                Provider.of<Items>(context, listen: false)
                                    .removeItem(item);
                                Navigator.of(context).pop();
                              },
                              child: Text('Sim'),
                            ),
                          ],
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
