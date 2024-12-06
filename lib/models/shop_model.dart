import 'item_model.dart';

class Shop {
  final String id; 
  final String name; 
  final String imageUrl; 
  final double rating; 
  final String description; 
  final List<Item> items; 

  Shop({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.description, 
    required this.items,
  });
}
