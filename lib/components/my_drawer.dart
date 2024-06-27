import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(

            children: [
              // drawer logo header
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: DrawerHeader(

                  child:Center(
                    child: Icon(Icons.shopping_bag_rounded,
                      size: 72,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25,),


              // shop tile
              MyListTile(
                icon: Icons.shop,
                text: "S H O P",
                onTap: () => Navigator.pop(context),
              ),


              // cart tile
              MyListTile(
                icon: Icons.shopping_cart,
                text: "C A R T",
                onTap: () {
                  // close drawer first
                  Navigator.pop(context);

                  // go to cart page
                  Navigator.pushNamed(context, '/cart_page');

                },
              ),
            ],
          ),


          // exit shop tile

          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyListTile(
              icon: Icons.exit_to_app,
              text: "E X I T",
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
