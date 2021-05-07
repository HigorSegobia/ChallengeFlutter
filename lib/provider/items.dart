import 'dart:math';

import 'package:challenge_flutter/data/data_base.dart';
import 'package:challenge_flutter/models/item.dart';
import 'package:flutter/cupertino.dart';

class Items with ChangeNotifier {
  Map<String, Item> _items = {...DATA_BASE};

  List<Item> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Item indexCount(int x) {
    return _items.values.elementAt(x);
  }

  Future<void> putItem(Item item) async {
    if (item == null) {
      return;
    }

    if (_items.containsKey(item.id)) {
      _items.update(
          item.id,
          (_) => Item(
                id: item.id,
                name: item.name,
                quantity: item.quantity,
                price: item.price,
              ));
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Item(
          id: id,
          name: item.name,
          quantity: item.quantity,
          price: item.price,
        ),
      );
    }

    notifyListeners();
  }

  void removeItem(Item item) {
    if (item != null && item.id != null) {
      _items.remove(item.id);
      notifyListeners();
    }
  }
}
