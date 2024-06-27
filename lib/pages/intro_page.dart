import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/components/my_button.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // logo
            Icon(Icons.shopping_bag_rounded,
            size: 72,
            color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25,),

            // title

            const Text("Mini E-commerce shop",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,

                      ),),


            const SizedBox(height: 10,),

            // sub-title
             Text("Premium and quality products",
            style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary
            ),
             ),

            const SizedBox(height: 25,),

            // button
            MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: const Icon(Icons.arrow_forward_ios)
            ),

          ],
        ),
      ),
    );
  }
}
