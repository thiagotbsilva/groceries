import 'package:mobx/mobx.dart';
import 'grocery_list_controller.dart';
part 'user_groceries_lists_controller.g.dart';

class _UserListsController = _UserListsControllerBase with _$_UserListsController;

abstract class _UserListsControllerBase with Store {

  ObservableList<GroceryListController> groceriesList = ObservableList<GroceryListController>();

  @action
  setNewItem(String listName, DateTime date) {
    groceriesList.add(GroceryListController(listName, date));
  }

  @action
  deleteItem(int index) {
    groceriesList.removeAt(index);
  }

  fromJson(Map<String, dynamic> json) {
    if (json['userLists'] != null) {
      json['userLists'].forEach((v) {
        groceriesList.add(GroceryListController.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (groceriesList.isNotEmpty) {
      data['userLists'] = groceriesList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

_UserListsController _singleton = _UserListsController();
_UserListsController get singletonControler => _singleton;