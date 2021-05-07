import 'package:flutter/material.dart';

class Item {
  final String id;
  final String name;
  final String quantity;
  final String price;

  const Item({
    this.id,
    @required this.name,
    @required this.quantity,
    @required this.price,
  });
}
