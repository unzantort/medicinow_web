import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../providers/cart_provider.dart';
import '../widgets/drawer.dart';
import '../widgets/top_nav_bar.dart';
import '../models/shop_model.dart';
import 'delivery_view.dart';

class CheckoutScreen extends StatelessWidget {
  final UserModel user;
  final VoidCallback onBack;
  final Function(Shop shop) onShopSelected;

  const CheckoutScreen({
    Key? key,
    required this.user,
    required this.onBack,
    required this.onShopSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F3F5),
      body: Column(
        children: [
          TopNavBar(
            onShopSelected: onShopSelected,
          ),
          Expanded(
            child: Row(
              children: [
                LeftDrawer(
                  selectedIndex: 0,
                  onItemSelected: (index) => Navigator.pop(context),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.black),
                              onPressed: onBack,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Checkout",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0C1B33),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Delivering to:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0C1B33),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user.address,
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Phone: ${user.phoneNumber}",
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const Divider(),
                        const SizedBox(height: 16),
                        const Text(
                          "Order Summary:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0C1B33),
                          ),
                        ),
                        Expanded(
                          child: Consumer<CartProvider>(
                            builder: (context, cartProvider, child) {
                              final cartItems = cartProvider.cartItems;
                              if (cartItems.isEmpty) {
                                return const Center(
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
                                    leading: Image.asset(item.imageUrl,
                                        width: 50, height: 50),
                                    title: Text(item.name),
                                    subtitle: Text(
                                        "\$${item.price.toStringAsFixed(2)}"),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const Divider(),
                        Consumer<CartProvider>(
                          builder: (context, cartProvider, child) {
                            return Text(
                              "Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .clearCart();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DeliveryScreen(
                                    user: user,
                                    onShopSelected: onShopSelected,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF91F5AD),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Confirm Order",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0C1B33),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
