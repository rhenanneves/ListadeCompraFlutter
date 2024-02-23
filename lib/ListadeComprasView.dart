import 'package:flutter/material.dart';
import 'package:projetofluttersomativa/ListaDeComprasController.dart';


class ListaDeComprasView extends StatefulWidget {
  final ListaDeComprasController controller;

  ListaDeComprasView({required this.controller});

  @override
  _ListaDeComprasViewState createState() => _ListaDeComprasViewState();
}

class _ListaDeComprasViewState extends State<ListaDeComprasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: widget.controller.listaDeCompras.length,
              itemBuilder: (BuildContext context, int index) {
                final item = widget.controller.listaDeCompras[index];
                return ListTile(
                  title: TextFormField(
                    initialValue: item.nome,
                    onChanged: (value) {
                      setState(() {
                        item.nome = value;
                        widget.controller.atualizarTotal();
                      });
                    },
                  ),
                  subtitle: TextFormField(
                    initialValue: item.preco.toString(),
                    onChanged: (value) {
                      setState(() {
                        item.preco = double.tryParse(value) ?? 0;
                        widget.controller.atualizarTotal();
                      });
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        widget.controller.removeItem(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: widget.controller.textController,
                    decoration: InputDecoration(
                      hintText: 'Nome do item',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: widget.controller.precoController,
                    decoration: InputDecoration(
                      hintText: 'Preço',
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      widget.controller.addItem();
                    });
                  },
                ),
              ],
            ),
          ),
          Text(
            'Total: R\$ ${widget.controller.calcularTotal().toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
