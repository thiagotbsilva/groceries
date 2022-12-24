// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GroceryListController on GroceryListControllerBase, Store {
  late final _$totalPriceAtom =
      Atom(name: 'GroceryListControllerBase.totalPrice', context: context);

  @override
  double get totalPrice {
    _$totalPriceAtom.reportRead();
    return super.totalPrice;
  }

  @override
  set totalPrice(double value) {
    _$totalPriceAtom.reportWrite(value, super.totalPrice, () {
      super.totalPrice = value;
    });
  }

  late final _$GroceryListControllerBaseActionController =
      ActionController(name: 'GroceryListControllerBase', context: context);

  @override
  dynamic setNewItem(String productName) {
    final _$actionInfo = _$GroceryListControllerBaseActionController
        .startAction(name: 'GroceryListControllerBase.setNewItem');
    try {
      return super.setNewItem(productName);
    } finally {
      _$GroceryListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sumUpTotalPrice() {
    final _$actionInfo = _$GroceryListControllerBaseActionController
        .startAction(name: 'GroceryListControllerBase.sumUpTotalPrice');
    try {
      return super.sumUpTotalPrice();
    } finally {
      _$GroceryListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
totalPrice: ${totalPrice}
    ''';
  }
}
