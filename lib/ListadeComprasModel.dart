import 'package:flutter/material.dart';

class ItemDeCompra {
  String nome;
  double preco;

  ItemDeCompra({required this.nome, required this.preco});
}

class ListaDeComprasModel extends ChangeNotifier {
  List<ItemDeCompra> _listaDeCompras = [];

  List<ItemDeCompra> get listaDeCompras => _listaDeCompras;

  void adicionarItem(ItemDeCompra item) {
    _listaDeCompras.add(item);
    notifyListeners();
  }

  void removerItem(int index) {
    _listaDeCompras.removeAt(index);
    notifyListeners();
  }

  double calcularTotal() {
    double total = 0.0;
    for (var item in _listaDeCompras) {
      total += item.preco;
    }
    return total;
  }

  void atualizarTotal() {
    notifyListeners();
  }
}
