import 'package:localstore/localstore.dart';
import '../controllers/user_groceries_lists_controller.dart';

class DbController {
  static DbController instance = DbController();

  final db = Localstore.instance;

  Future<bool> createDbInstance() async {
    // gets new id
    //final id = db.collection('groceriesLists').doc().id;
    /// TODO
    /// o certo seria gerar um id único. Para manter uma lista, deveria
    /// apagar a anterior e manter essa

    try {
      // save the item
      await db.collection('groceriesLists').doc('35uux0nr7').set(
          singletonControler.toJson()
      );
      return true;
    } catch(e) {
      return false;
    }
  }

  void getDbData() async {
    final data = await db.collection('groceriesLists').doc('35uux0nr7').get();
    singletonControler.fromJson(data!);
  }

  void deleteList(String id) {
    db.collection('groceriesLists').doc(id).delete();
  }


  /// TODO
  /// preciso fazer o fetch e reconhecer o id do último item salvo
  void fetchDocument() async {
    final items = await db.collection('groceriesLists').get();
    print('aqui items: $items');
  }

}





