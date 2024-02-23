import 'package:flutter/material.dart';
import 'package:projetofluttersomativa/ListadeComprasModel.dart';


class ListaDeComprasController {
  late ListaDeComprasModel _model;
  TextEditingController textController = TextEditingController();
  TextEditingController precoController = TextEditingController();

  ListaDeComprasController() {
    _model = ListaDeComprasModel();
  }

  List<ItemDeCompra> get listaDeCompras => _model.listaDeCompras;

  void addItem() {
    if (textController.text.isNotEmpty && precoController.text.isNotEmpty) {
      double preco = double.parse(precoController.text);
      _model.adicionarItem(ItemDeCompra(nome: textController.text, preco: preco));
      textController.clear();
      precoController.clear();
    }
  }

  void removeItem(int index) {
    _model.removerItem(index);
  }

  double calcularTotal() {
    return _model.calcularTotal();
  }

  void atualizarTotal() {
    _model.atualizarTotal();
  }
}
