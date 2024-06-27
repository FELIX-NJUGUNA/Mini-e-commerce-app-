import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/models/product.dart';
import 'package:mini_ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';


class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  // add to cart method on button pressing
  void addToCart(BuildContext context){
    // show dialog to confirm to the user that they want to add to cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            content: const Text("Add this item to your cart?"),
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

                // add to cart
                context.read<Shop>().addToCart(product);



              },



              child: const Text("Ok"),

            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             // image
             AspectRatio(
               aspectRatio: 1,
               child: Container(
                 decoration: BoxDecoration(
                     color: Theme.of(context).colorScheme.secondary,
                     borderRadius: BorderRadius.circular(10)
                 ),
                 width: double.infinity,
                 padding: const EdgeInsets.all(25),
                 child: Image.asset(product.imagePath),


               ),
             ),
             const SizedBox(height: 25,),

             // name
             Text(
               product.name,
               style: const TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20
               ),),



             // description

             Text(product.description,
               style: TextStyle(
                 color: Theme.of(context).colorScheme.inversePrimary,

               ),),

           ],
         ),
          const SizedBox(height: 25,),



          // price + add to cart btn
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ksh. ${product.price. toStringAsFixed(2)}'),

              // add to cart button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10)

                ),
                child: IconButton(
                    onPressed: () => addToCart(context),
                    icon: const Icon(Icons.add)
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
