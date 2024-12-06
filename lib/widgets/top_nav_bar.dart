import 'package:flutter/material.dart';
import '../models/shop_model.dart';
import '../data/shop_data.dart';

class TopNavBar extends StatefulWidget {
  final Function(Shop shop) onShopSelected;

  const TopNavBar({Key? key, required this.onShopSelected}) : super(key: key);

  @override
  _TopNavBarState createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {
  final TextEditingController _searchController = TextEditingController();
  final LayerLink _layerLink = LayerLink(); 
  OverlayEntry? _overlayEntry;
  List<Shop> _filteredShops = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _filteredShops = shops;
  }

  void _filterShops(String query) {
    if (query.isEmpty) {
      _hideDropdown(); 
    } else {
      setState(() {
        _isSearching = true;
        _filteredShops = shops
            .where((shop) =>
                shop.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
      _showDropdown(); 
    }
  }

  void _showDropdown() {
    _overlayEntry?.remove();

    if (_filteredShops.isEmpty) {
      _hideDropdown();
      return;
    }

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context)?.insert(_overlayEntry!);
  }

  void _hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null; 
    setState(() {
      _isSearching = false;
      _filteredShops = []; 
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    Offset position = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx, 
        top: position.dy + size.height,
        width: size.width, 
        child: Material(
          elevation: 4,
          child: Container(
            color: Colors.white,
            constraints: const BoxConstraints(maxHeight: 200), 
            child: _filteredShops.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: _filteredShops.length,
                    itemBuilder: (context, index) {
                      final shop = _filteredShops[index];
                      return ListTile(
                        title: Text(
                          shop.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                        onTap: () {
                          _searchController.clear();
                          widget.onShopSelected(shop); 
                          _hideDropdown(); 
                        },
                      );
                    },
                  )
                : const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "No results found",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        height: 60,
        color: const Color(0xFF91F5AD),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "MediciNow",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0C1B33),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 300,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterShops,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      suffixIcon: _isSearching
                          ? IconButton(
                              icon: const Icon(Icons.clear, color: Colors.grey),
                              onPressed: _hideDropdown,
                            )
                          : null,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.notifications,
                      color: Color(0xFF0C1B33)),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                const CircleAvatar(
                  backgroundColor: Color(0xFF0C1B33),
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
