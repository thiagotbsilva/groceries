import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/services.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import '../../controllers/grocery_list_controller.dart';

class GroceryItem extends StatefulWidget {
  final int index;
  final GroceryListController groceryController;

  const GroceryItem({
    required this.index,
    required this.groceryController,
    Key? key}) : super(key: key);

  @override
  State<GroceryItem> createState() => _GroceryItemState();
}

class _GroceryItemState extends State<GroceryItem> {
  final TextEditingController priceController = TextEditingController();
  late ReactionDisposer reactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reactionDisposer = reaction((_) => widget.groceryController
        .itemsList[widget.index].parcialPrice, (_) {
      widget.groceryController.sumUpTotalPrice();
    });
  }

  @override
  void dispose() {
    reactionDisposer.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Observer(
        builder: (_) {
          return Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: widget.groceryController.itemsList[widget.index].checked,
                    onChanged: (newValue) => widget.groceryController.itemsList[widget.index]
                        .changeChecked(newValue!),
                  ),
                  SizedBox(
                    width: width * .3,
                    child: Text(
                      widget.groceryController.itemsList[widget.index].name,
                    ),
                  ),
                  _quantityButton(isPlus: false, index: widget.index),
                  Text(
                      widget.groceryController.itemsList[widget.index].quantity.toString()
                  ),
                  _quantityButton(isPlus: true, index: widget.index),
                  const SizedBox(width: 5),
                  Container(
                    width: width * .21, height: 25,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: Colors.grey[200],
                    ),
                    child: TextField(
                      controller: priceController,
                      inputFormatters: <TextInputFormatter>[
                        CurrencyTextInputFormatter(
                            locale: 'pt_BR',
                            decimalDigits: 2,
                            symbol: ''
                        ),
                      ],
                      keyboardType: TextInputType.number,
                      onEditingComplete: () {
                        String newValue = priceController.text.replaceAll(',', '.');
                        widget.groceryController.itemsList[widget.index]
                            .changePrice(double.parse(newValue));
                      },
                      /*decoration: InputDecoration.collapsed(
                                            hintText: NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                                                                       .format(groceryController.itemsList[index].price)
                                        ), */
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 15, top: 10, bottom: 20),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Observer(
                        builder: (_) {
                          return Text(
                            'Total item: '
                                '${NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                                .format(widget.groceryController.itemsList[widget.index].parcialPrice)}',
                          );
                        })
                ),
              ),
              Divider(
                  indent: 25, endIndent: 25, height: 15,
                  thickness: 1.0, color: Colors.grey[400]),
              const SizedBox(height: 15),
            ],
          );
        }
    );
  }

  Widget _quantityButton({required bool isPlus, required int index}) {
    return Container(
      height: 28, width: 28,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: FloatingActionButton(
        onPressed: () {
          if(isPlus) {
            widget.groceryController.itemsList[index].quantityPlus();
          } else {
            widget.groceryController.itemsList[index].quantityMinus();
          }
        },
        backgroundColor: Colors.grey[200],
        child: Icon(
          isPlus ? Icons.add : Icons.remove,
          size: 18, color: Colors.black,),
      ),
    );
  }
}
