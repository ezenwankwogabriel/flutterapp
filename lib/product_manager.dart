import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

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
  List<String> _products = [];

  @override
    void initState() {
    print('productManager Widget Constructor initState()');
      _products.add(widget.startingProduct);
      // TODO: implement initState
      super.initState();
    }

  void _addProduct(String product) {
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
        Expanded( child: Products(_products) )
         
      ],
    );
  }
}
