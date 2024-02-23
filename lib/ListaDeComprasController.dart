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

  void addItem(BuildContext context) {
    if (textController.text.isNotEmpty && precoController.text.isNotEmpty) {
      // Verificar se o item já existe na lista
      String nomeNovoItem = textController.text.toLowerCase();
      bool itemExistente = _model.listaDeCompras
          .any((item) => item.nome.toLowerCase() == nomeNovoItem);

      if (!itemExistente) {
        double preco = double.parse(precoController.text);
        _model.adicionarItem(ItemDeCompra(nome: textController.text, preco: preco));
        textController.clear();
        precoController.clear();
        _mostrarSnackBar(context, 'Item adicionado');
      } else {
        _mostrarSnackBar(context, 'Este item já existe na lista');
      }
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

  void _mostrarSnackBar(BuildContext context, String mensagem) {
    final snackBar = SnackBar(content: Text(mensagem));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
