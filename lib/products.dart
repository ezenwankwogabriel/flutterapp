import 'package:flutter/material.dart';

import './pages/product.dart';

//lifecycle for StatelessWidget {constructor, build}
class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  //constructor
  Products(this.products, {this.deleteProduct}) {
    print('Products Widget Constructor');
  }

  Widget _builiProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          //button bar allows u add more than one buttons
          ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton(
              child: Text('Details'),
              onPressed: () => Navigator
                      .push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ProductPage(
                          products[index]['title'], products[index]['image']),
                    ),
                  )
                      .then((bool value) {
                        if (value) {
                          deleteProduct(index);
                        }
                    print(value);
                  }),
            )
          ])
        ],
      ),
    );
  }

  @override
  //build
  Widget build(BuildContext context) {
    print('Products Widget build()');
    // TODO: implement build
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _builiProductItem,
        itemCount: products.length,
      );
    } else {
      productCard = Center(child: Text('No Products Found, Please add some'));
      //if you dont want to return any details, return an empty container
      // productCard = Container();
    }
    return productCard;
  }
}
