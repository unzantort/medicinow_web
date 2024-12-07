import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/drawer.dart';
import '../widgets/top_nav_bar.dart';
import '../models/shop_model.dart';

class DeliveryScreen extends StatelessWidget {
  final UserModel user;
  final void Function(Shop shop) onShopSelected;

  const DeliveryScreen({
    Key? key,
    required this.user,
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
                  onItemSelected: (index) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/homepage', 
                      (route) => false,
                    );
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/motorcycle.gif',
                          width: 150,
                          height: 150,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.motorcycle,
                              size: 150,
                              color: Color(0xFF91F5AD),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Your order is on its way!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0C1B33),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "A rider is delivering your order from the pharmacy.\nEstimated delivery time: 10-20 minutes.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Delivery Address:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0C1B33),
                          ),
                        ),
                        Text(
                          user.address,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              '/homepage',
                              (route) => false,
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
                            "Back to Homepage",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0C1B33),
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
