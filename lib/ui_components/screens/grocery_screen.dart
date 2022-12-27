import 'package:flutter/material.dart';
import '../../controllers/grocery_list_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import '../widgets/grocery_item.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key, required this.groceryList});

  final GroceryListController groceryList;

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {

  late GroceryListController groceryController;
  final TextEditingController _productController = TextEditingController();

  @override
  void initState() {
    super.initState();
    groceryController = widget.groceryList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(groceryController.listName),
      ),
      body: _screenList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _callDialog(context),
        tooltip: 'Novo item',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _screenList() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Column(
          children: [
            Observer(
              builder: (_) {
                int productsQtd = groceryController.itemsList.length;
                return SizedBox(
                  height:height * .81,
                  child: productsQtd > 0
                      ? ListView.builder(
                        itemCount: productsQtd,
                        itemBuilder: (context, index) {
                          return GroceryItem(
                              groceryController: groceryController,
                              index: index);
                      })
                      : Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                        child: const Text(
                            'Nenhum produto na lista',
                          textAlign: TextAlign.center
                      )
                  ),
                );
              }
            ),
            Center(
                child: Observer(
                    builder: (_) {
                      return Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Total Compra: '
                              '${NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                              .format(groceryController.totalPrice)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      );
                    })
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _callDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Insira um produto'),
            content: TextField(
              autofocus: true,
              controller: _productController,
              onEditingComplete: () => _insertNewProduct()
            ),
            actions: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () => Navigator.of(context).pop(),             // function used to perform after pressing the button
                child: const Text('FECHAR'),
              ),
              TextButton(                     // FlatButton widget is used to make a text to work like a button
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () => _insertNewProduct(),             // function used to perform after pressing the button
                child: const Text('INSERIR'),
              ),
            ],
          );
        });
  }

  void _insertNewProduct() {
    if(_productController.text != '') {
      groceryController.setNewItem(_productController.text);
      _productController.text = '';
    }
  }

}