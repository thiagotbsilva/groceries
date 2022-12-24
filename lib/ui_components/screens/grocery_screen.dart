import 'package:flutter/material.dart';
import '../../controllers/grocery_list_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import '../widgets/grocery_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  GroceryListController groceryController = GroceryListController();
  final TextEditingController _productController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Observer(
              builder: (_) {
                return SizedBox(
                  height:height * .81,
                  child: ListView.builder(
                      itemCount: groceryController.itemsList.length,
                      itemBuilder: (context, index) {
                        return GroceryItem(
                            groceryController: groceryController,
                            index: index);
                      }),
                );
              }
            ),
            Center(
                child: Observer(
                    builder: (_) {
                      return Text(
                        'Total Compra: '
                            '${NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                            .format(groceryController.totalPrice)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
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