import 'package:mobx/mobx.dart';
import 'package:new_project_test/controllers/product_item_controller.dart';
part 'grocery_list_controller.g.dart';

class GroceryListController = GroceryListControllerBase with _$GroceryListController;

abstract class GroceryListControllerBase with Store {

  GroceryListControllerBase(this.listName, this.date);

  late final String listName;
  late final DateTime date;

  ObservableList<ProductItemController> itemsList = ObservableList<ProductItemController>();

  @observable
  double totalPrice = 0.0;

  @action
  setNewItem(String productName) {
    itemsList.add(ProductItemController(productName));
  }

  @action
  deleteProduct(int index) {
    itemsList.removeAt(index);
  }

  @action
  sumUpTotalPrice() {
    double partialValue = 0.0;
    for (ProductItemController element in itemsList) {
      partialValue += element.parcialPrice;
    }
    totalPrice = partialValue;
  }

  GroceryListControllerBase.fromJson(Map<String, dynamic> json) {
    listName = json['listName'];
    date = DateTime.now();
    if (json['listOfItems'] != null) {
      json['listOfItems'].forEach((v) {
        itemsList.add(ProductItemController.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['listName'] = listName;
    data['date'] = '2022-10-06T19:10:00';
    if (itemsList.isNotEmpty) {
      data['listOfItems'] = itemsList.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = totalPrice;
    return data;
  }

}