import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/models/product.dart';
import 'package:mini_ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove item from cart
  void removeItemFromCart(BuildContext context, Product product){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content:  const Text("Remove this item to your cart?"),
          actions: [
            // cancel button
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),

            ),

            // save button
            MaterialButton(

              onPressed: () {

                // pop the box
                Navigator.pop(context);

                // remove from cart
                context.read<Shop>().removeFromCart(product);



              },

              child: const Text("Ok"),

            ),
          ],
        )
    );
  }

  // pay button on pressed
  void payButton(BuildContext context){
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text("User wants to pay"),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart page"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,

      body: cart.isEmpty?
      Center(
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
             children: [
                Icon(Icons.hourglass_empty_sharp,
               color: Theme.of(context).colorScheme.inversePrimary,),
          Text('Your cart is empty!',
            style: TextStyle(
                color:Theme.of(context).colorScheme.inversePrimary
            ),
          ),
          ]
               ),
       )
       ,) : Column(
        children: [
          
        // cart list
        Expanded(
            child: ListView.builder(
              itemCount: cart.length,
                itemBuilder: (context, index) {


                    // get individual item in cart
                  final item = cart[index];

                // return as a list tile
              return ListTile(

                title: Text(item.name),
                subtitle: Text(item.price.toStringAsFixed(2)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => removeItemFromCart(context, item),
                ),
              );

                },

            )
        ),
          
          // pay button

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: TextButton(

                onPressed: () => payButton(context),
              style: TextButton.styleFrom(

                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,

                )
              ),
                child: const Text("Pay now"),

            ),
          )
      ],),
    );
  }
}
