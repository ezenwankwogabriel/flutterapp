import 'package:flutter/material.dart';

import './pages/product.dart';

//lifecycle for StatelessWidget {constructor, build}
class Products extends StatelessWidget {
  final List<String> products;

  //constructor
  Products([this.products = const []]) {
    print('Products Widget Constructor');
  }

  Widget _builiProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          // Text('gabby'),
          //button bar allows u add more than one buttons
          ButtonBar(alignment: MainAxisAlignment.center, 
          children: <Widget>[
            FlatButton(
              child: Text('Details'),
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ProductPage(),
                    ),
                  ),
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
