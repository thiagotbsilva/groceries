// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductItemController on ProductItemControllerBase, Store {
  Computed<double>? _$parcialPriceComputed;

  @override
  double get parcialPrice =>
      (_$parcialPriceComputed ??= Computed<double>(() => super.parcialPrice,
              name: 'ProductItemControllerBase.parcialPrice'))
          .value;

  late final _$checkedAtom =
      Atom(name: 'ProductItemControllerBase.checked', context: context);

  @override
  bool get checked {
    _$checkedAtom.reportRead();
    return super.checked;
  }

  @override
  set checked(bool value) {
    _$checkedAtom.reportWrite(value, super.checked, () {
      super.checked = value;
    });
  }

  late final _$priceAtom =
      Atom(name: 'ProductItemControllerBase.price', context: context);

  @override
  double get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$quantityAtom =
      Atom(name: 'ProductItemControllerBase.quantity', context: context);

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$ProductItemControllerBaseActionController =
      ActionController(name: 'ProductItemControllerBase', context: context);

  @override
  dynamic changeChecked(bool newValue) {
    final _$actionInfo = _$ProductItemControllerBaseActionController
        .startAction(name: 'ProductItemControllerBase.changeChecked');
    try {
      return super.changeChecked(newValue);
    } finally {
      _$ProductItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePrice(double newValue) {
    final _$actionInfo = _$ProductItemControllerBaseActionController
        .startAction(name: 'ProductItemControllerBase.changePrice');
    try {
      return super.changePrice(newValue);
    } finally {
      _$ProductItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic quantityPlus() {
    final _$actionInfo = _$ProductItemControllerBaseActionController
        .startAction(name: 'ProductItemControllerBase.quantityPlus');
    try {
      return super.quantityPlus();
    } finally {
      _$ProductItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic quantityMinus() {
    final _$actionInfo = _$ProductItemControllerBaseActionController
        .startAction(name: 'ProductItemControllerBase.quantityMinus');
    try {
      return super.quantityMinus();
    } finally {
      _$ProductItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
checked: ${checked},
price: ${price},
quantity: ${quantity},
parcialPrice: ${parcialPrice}
    ''';
  }
}
