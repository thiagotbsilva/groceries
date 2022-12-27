import 'package:mobx/mobx.dart';
import 'package:new_project_test/controllers/product_item_controller.dart';
part 'grocery_list_controller.g.dart';

class GroceryListController = GroceryListControllerBase with _$GroceryListController;

abstract class GroceryListControllerBase with Store {

  GroceryListControllerBase(this.listName, this.date);

  final String listName;
  final DateTime date;

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

}