import 'package:challenge_flutter/constants.dart';
import 'package:challenge_flutter/models/item.dart';
import 'package:challenge_flutter/provider/items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemForm extends StatefulWidget {
  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final _formValue = GlobalKey<FormState>();
  final Map<String, String> _itemMap = {};

  void _valueItemData(Item item) {
    if (item != null) {
      _itemMap['id'] = item.id;
      _itemMap['name'] = item.name;
      _itemMap['quantity'] = item.quantity;
      _itemMap['price'] = item.price;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Item item = ModalRoute.of(context).settings.arguments;
    _valueItemData(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Cadastrar item',
          style: TextStyle(color: whiteColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              final isValid = _formValue.currentState.validate();
              if (isValid) {
                _formValue.currentState.save();
                await Provider.of<Items>(context, listen: false).putItem(
                  Item(
                    id: _itemMap['id'].toString(),
                    name: _itemMap['name'].toString(),
                    quantity: _itemMap['quantity'].toString(),
                    price: _itemMap['price'].toString(),
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
            key: _formValue,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _itemMap['name'],
                  decoration: InputDecoration(labelText: 'Nome'),
                  onSaved: (value) => _itemMap['name'] = value,
                ),
                TextFormField(
                  initialValue: _itemMap['quantity'],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Quantidade'),
                  onSaved: (value) => _itemMap['quantity'] = value,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  initialValue: _itemMap['price'],
                  decoration: InputDecoration(labelText: 'Preço'),
                  onSaved: (value) => _itemMap['price'] = value,
                ),
              ],
            )),
      ),
    );
  }
}
