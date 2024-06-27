import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/components/my_drawer.dart';
import 'package:mini_ecommerce_app/components/my_product_tile.dart';
import 'package:mini_ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';


class ShopPage extends StatelessWidget {
  const ShopPage({super.key});


  @override
  Widget build(BuildContext context) {
    // access products in the shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
     appBar: AppBar(
       elevation: 0,
       backgroundColor: Colors.transparent,
       foregroundColor: Theme.of(context).colorScheme.inversePrimary,
       title: const Text('Shop page'),
       actions: [
         IconButton(
             onPressed: () => Navigator.pushNamed(context,'/cart_page'),
             icon: const Icon(Icons.shopping_cart_outlined))
       ],
     ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(

        children: [
        // shop title
        //   const Text("Mini E-commerce Shop"),

        //shop subtitle

           Center(
               child: Text(
                   "Pick from the best to suit you",
                 style: TextStyle(
                   color: Theme.of(context).colorScheme.inversePrimary,
                 ),
                  )
           ),


        //product list
          SizedBox(
            height: 550,
            child: ListView.builder(
                itemCount: products.length,
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,

                itemBuilder: (context, index) {
                  // get each individual product from shop
                  final product = products[index];


                  // return  as product tile UI
                  return MyProductTile(product: product);


                }
            ),
          ),
        ],





      )
    );
  }
}
