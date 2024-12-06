import 'package:flutter/material.dart';
import '../widgets/popular_shop_card.dart';
import '../data/shop_data.dart';
import '../models/shop_model.dart';

class ShopView extends StatelessWidget {
  final Function(Shop shop) onShopSelected;

  const ShopView({Key? key, required this.onShopSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Available Shops Near Me",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0C1B33),
            ),
          ),
          SizedBox(height: 16), 
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.8,
              ),
              itemCount: shops.length,
              itemBuilder: (context, index) {
                final shop = shops[index];
                return PopularShopCard(
                  width: 180,
                  height: 240,
                  imageUrl: shop.imageUrl,
                  shopName: shop.name,
                  description: shop.description, 
                  rating: shop.rating,
                  onTap: () => onShopSelected(shop), 
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
