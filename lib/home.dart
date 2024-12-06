import 'package:flutter/material.dart';
import 'widgets/cart.dart';
import 'widgets/drawer.dart';
import 'widgets/top_nav_bar.dart';
import 'views/home_view.dart';
import 'views/shop_view.dart';
import 'views/store_page.dart';
import 'models/shop_model.dart';
import 'data/user_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex = 0;
  Shop? _selectedShop;

  void _onMenuSelected(int index) {
    setState(() {
      _selectedPageIndex = index;
      _selectedShop = null;
    });
  }

  void _navigateToStorePage(Shop shop) {
    setState(() {
      _selectedShop = shop;
    });
  }

  void _goBackToShops() {
    setState(() {
      _selectedShop = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeView(onShopSelected: _navigateToStorePage),
      ShopView(onShopSelected: _navigateToStorePage),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F3F5),
      body: Column(
        children: [
          TopNavBar(onShopSelected: _navigateToStorePage),
          Expanded(
            child: Row(
              children: [
                LeftDrawer(
                  selectedIndex: _selectedPageIndex,
                  onItemSelected: _onMenuSelected,
                ),
                Expanded(
                  child: _selectedShop != null
                      ? Stack(
                          children: [
                            StorePage(shop: _selectedShop!),
                            Positioned(
                              top: 16,
                              left: 16,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: _goBackToShops,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      : pages[_selectedPageIndex],
                ),
                CartSideBar(
                  user: currentUser,
                  onShopSelected: _navigateToStorePage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
