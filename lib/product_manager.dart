import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> startingProduct;

  ProductManager({this.startingProduct}) {
    print('productManager Widget Constructor setState()');
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  @override
  void initState() {
    print('[ProductManager State] initState()');
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }
    super.initState();
  }

  void _addProduct(Map<String, String> product) {
     setState(() {
        _products.add(product);
      });
  }

  @override
    void didUpdateWidget(ProductManager oldWidget) {
    print('productManager Widget Constructor didUpdateWidget()');
      // TODO: implement didUpdateWidget
      super.didUpdateWidget(oldWidget);
    }

  void _deleteProduct(int index) {
    setState(() {
      print( _products);
          _products.removeAt(index);
        });
  }

  @override
  Widget build(BuildContext context) {
    print('productManager Widget Constructor build()');
    // TODO: implement build
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        Expanded( child: Products(_products, deleteProduct: _deleteProduct) )
         
      ],
    );
  }
}
