import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../../controllers/user_groceries_lists_controller.dart';
import '../../models/dbJson.dart';
import 'grocery_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _listController = TextEditingController();
  late DateFormat dateF;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await initializeDateFormatting('pt_BR');
    dateF = DateFormat('dd-MMM-yy', 'pt_BR');
    DbController.instance.getDbData();
    DbController.instance.fetchDocument();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Minhas Listas'),
      ),
      body: _listsWidget(),
    );
  }

  Widget _listsWidget() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Observer(
        builder: (_) {
          int itensQtd = singletonControler.groceriesList.length;
          return SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                SizedBox(
                  height:height * .82,
                  child: itensQtd > 0
                      ? ListView.builder(
                      itemCount: itensQtd,
                      itemBuilder: (context, index) {
                        return _listItem(index);
                      })
                      : Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                        child: const Text(
                          'Clique no botão abaixo para fazer sua primeira lista',
                            textAlign: TextAlign.center
                        )
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _saveButton(),
                      const SizedBox(width: 50),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.blue, // foreground
                        ),
                        onPressed: () => _listDialog(context),
                        child: const Text('Nova Lista'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  Widget _listItem(int index) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GroceryScreen(
              groceryList: singletonControler.groceriesList[index])),
        );
      },
      title: Text(
          singletonControler.groceriesList[index].listName
      ),
      subtitle: Text(
        'Criado em ${dateF.format(singletonControler.groceriesList[index].date)}'
      ),
      trailing: _deleteIcon(index)
    );
  }
  
  Widget _deleteIcon(int index) {
    return InkWell(
      onTap: () {
        singletonControler.deleteItem(index);
      },
      splashColor: Colors.grey[200],
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            color: Colors.grey[200]),
        child: const Icon(
          Icons.delete_forever,
          size: 20,
        ),
      ),
    );
  }

  Future<void> _listDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Insira o nome da lista'),
            content: TextField(
                autofocus: true,
                controller: _listController,
                onEditingComplete: () => _insertNewList()
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
                onPressed: () {
                  _insertNewList();
                  Navigator.of(context).pop();
                },       // function used to perform after pressing the button
                child: const Text('INSERIR'),
              ),
            ],
          );
        });
  }

  Widget _saveButton() {
    return InkWell(
      onTap: () {
        DbController.instance.createDbInstance().then((value) {
          showDialog(context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                      value
                          ? 'Salvo com sucesso'
                          : 'Erro ao salvar, tente novamente'
                  ),
                );
              });
        });
      },
      splashColor: Colors.grey[300],
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            color: Colors.grey[200]),
        child: const Icon(
          Icons.save,
          size: 20,
        ),
      ),
    );
  }

  void _insertNewList() {
    if(_listController.text != '') {
      singletonControler.setNewItem(_listController.text, DateTime.now());
      _listController.text = '';
    }
    Future.delayed(const Duration(milliseconds: 400), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GroceryScreen(
            groceryList: singletonControler.groceriesList.last)),
      );
    });
  }
}
