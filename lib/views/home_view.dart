import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../widgets/popular_shop_card.dart';
import '../data/shop_data.dart'; 
import '../models/shop_model.dart'; 

class HomeView extends StatelessWidget {
  final Function(Shop shop) onShopSelected; 

  const HomeView({Key? key, required this.onShopSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0C1B33),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start, 
            children: [
              CategoryItem(icon: Icons.healing, label: "Pain Relief"),
              SizedBox(width: 8),
              CategoryItem(icon: Icons.local_pharmacy, label: "Cough & Flu"),
              SizedBox(width: 8),
              CategoryItem(icon: Icons.spa, label: "Allergy"),
              SizedBox(width: 8),
              CategoryItem(icon: Icons.spa, label: "First Aid"),
              SizedBox(width: 8),
              CategoryItem(icon: Icons.spa, label: "Skin Care"),
              SizedBox(width: 8),
              CategoryItem(icon: Icons.add, label: "OTC Meds"),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Popular Shops",
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
                  onTap: () {
                    onShopSelected(shop);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
