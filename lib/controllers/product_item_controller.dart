import 'package:mobx/mobx.dart';
part 'product_item_controller.g.dart';

class ProductItemController = ProductItemControllerBase with _$ProductItemController;

abstract class ProductItemControllerBase with Store {

  ProductItemControllerBase(this.name);

  late final String name;

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

  ProductItemControllerBase.fromJson(Map<String, dynamic> json) {
    name = json['productName'];
    checked = json['checked'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productName'] = name;
    data['checked'] = checked;
    data['price'] = price;
    data['quantity'] = quantity;
    data['partialTime'] = parcialPrice;
    return data;
  }

}

