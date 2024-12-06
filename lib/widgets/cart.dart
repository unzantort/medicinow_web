import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/user_model.dart';
import '../views/checkout_view.dart'; 
import '../models/shop_model.dart'; 

class CartSideBar extends StatelessWidget {
  final UserModel user;
  final Function(Shop shop) onShopSelected; 

  const CartSideBar({Key? key, required this.user, required this.onShopSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Cart",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0C1B33),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Delivering to:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0C1B33),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "${user.name}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  user.address,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                final cartItems = cartProvider.cartItems;
                if (cartItems.isEmpty) {
                  return Center(
                    child: Text(
                      "Your cart is empty.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return ListTile(
                      leading: Image.asset(
                        item.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        item.name,
                        style: TextStyle(color: Color(0xFF0C1B33)),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "\$${item.price.toStringAsFixed(2)}",
                            style: TextStyle(color: Color(0xFF0C1B33)),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline,
                                color: Colors.red),
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .removeItem(item);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return Column(
                  children: [
                    Text(
                      "Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0C1B33),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (cartProvider.cartItems.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Your cart is empty!"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutScreen(
                                user: user,
                                onBack: () => Navigator.pop(context),
                                onShopSelected: onShopSelected, 
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF91F5AD),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0C1B33),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
