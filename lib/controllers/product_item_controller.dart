import 'package:mobx/mobx.dart';

import 'grocery_list_controller.dart';
part 'product_item_controller.g.dart';

class ProductItemController = ProductItemControllerBase with _$ProductItemController;

abstract class ProductItemControllerBase with Store {

  ProductItemControllerBase(this.name);

  final String name;

  @observable
  bool checked = false;

  @observable
  double price = 0.0;

  @observable
  int quantity = 1;

  @computed
  double get parcialPrice => price * quantity;

  @action
  changeChecked(bool newValue) {
    checked = newValue;
  }

  @action
  changePrice(double newValue) {
    price = newValue;
  }

  @action
  quantityPlus() {
    quantity++;
  }

  @action
  quantityMinus() {
    if(quantity > 1) {
      quantity--;
    }
  }

}

