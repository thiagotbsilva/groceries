import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 60,
          itemBuilder: (context, index) {
            return Item(index: index);
          }),
    );
  }
}

class Item extends StatefulWidget {
  final int index;

  const Item({
    required this.index,
    Key? key,}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool isEnabledButton = true;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 1500),
        opacity: isEnabledButton ? 1.0 : 0.0,
        child: GestureDetector(
          onTap: () {
            setState(() async {
              isEnabledButton = !isEnabledButton;
              await _callDialog(context);
            });
          },
          child: Container(
            height: 300, width: 300,
            color: Colors.green,
            child: CachedNetworkImage(
                height: 300,
                width: 300,
                imageUrl: images[widget.index],
                alignment: Alignment.topCenter,
                fit: BoxFit.fitHeight,
                placeholder: (_, __) => Container(),
                errorWidget: (_, __, ___) => Container()),
          ),
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
                onEditingComplete: () {}
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
                onPressed: () {},             // function used to perform after pressing the button
                child: const Text('INSERIR'),
              ),
            ],
          );
        });
  }
}

const List<String> images = [
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_HIIT.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_HIIT.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_HIIT.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_HIIT.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_HIIT.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_HIIT.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_MONTANHA.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_MONTANHA.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_MONTANHA.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_MONTANHA.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_MONTANHA.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_MONTANHA.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/User/2c5672d8-855b-4908-aef4-d96bb4985b48.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/User/2c5672d8-855b-4908-aef4-d96bb4985b48.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/User/2c5672d8-855b-4908-aef4-d96bb4985b48.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/User/2c5672d8-855b-4908-aef4-d96bb4985b48.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/User/2c5672d8-855b-4908-aef4-d96bb4985b48.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/User/2c5672d8-855b-4908-aef4-d96bb4985b48.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/1fcd2c97-ad96-436e-ba65-1257047b082f.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/1fcd2c97-ad96-436e-ba65-1257047b082f.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/1fcd2c97-ad96-436e-ba65-1257047b082f.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/1fcd2c97-ad96-436e-ba65-1257047b082f.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/1fcd2c97-ad96-436e-ba65-1257047b082f.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/1fcd2c97-ad96-436e-ba65-1257047b082f.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/13c273bb-29a7-4c6c-8045-e64a78d91bb0.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/13c273bb-29a7-4c6c-8045-e64a78d91bb0.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/13c273bb-29a7-4c6c-8045-e64a78d91bb0.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/13c273bb-29a7-4c6c-8045-e64a78d91bb0.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/13c273bb-29a7-4c6c-8045-e64a78d91bb0.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/13c273bb-29a7-4c6c-8045-e64a78d91bb0.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_HIIT.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_HIIT.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_HIIT.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_HIIT.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_HIIT.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_HIIT.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_MONTANHA.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_MONTANHA.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_MONTANHA.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_MONTANHA.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_MONTANHA.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/CategoriaFotos/CAPA_MODO_ESCURO_MONTANHA.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/User/2c5672d8-855b-4908-aef4-d96bb4985b48.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/User/2c5672d8-855b-4908-aef4-d96bb4985b48.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/User/2c5672d8-855b-4908-aef4-d96bb4985b48.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/User/2c5672d8-855b-4908-aef4-d96bb4985b48.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/User/2c5672d8-855b-4908-aef4-d96bb4985b48.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/User/2c5672d8-855b-4908-aef4-d96bb4985b48.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/1fcd2c97-ad96-436e-ba65-1257047b082f.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/1fcd2c97-ad96-436e-ba65-1257047b082f.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/1fcd2c97-ad96-436e-ba65-1257047b082f.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/1fcd2c97-ad96-436e-ba65-1257047b082f.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/1fcd2c97-ad96-436e-ba65-1257047b082f.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/1fcd2c97-ad96-436e-ba65-1257047b082f.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/13c273bb-29a7-4c6c-8045-e64a78d91bb0.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/13c273bb-29a7-4c6c-8045-e64a78d91bb0.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/13c273bb-29a7-4c6c-8045-e64a78d91bb0.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/13c273bb-29a7-4c6c-8045-e64a78d91bb0.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/13c273bb-29a7-4c6c-8045-e64a78d91bb0.png',
  'https://d2xtv0xxjiegsq.cloudfront.net/ProgramBanner/13c273bb-29a7-4c6c-8045-e64a78d91bb0.png',
];

