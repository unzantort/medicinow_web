import '../models/shop_model.dart';
import '../models/item_model.dart';

final List<Shop> shops = [
  Shop(
    id: '1',
    name: 'Southstar Drug',
    imageUrl: 'assets/images/shop1.png',
    rating: 4.8,
    description:
        'Southstar Drug is one of the largest drugstore chains in the Philippines. Since 1937, it has carried a wide range of prescription and over-the-counter pharmaceutical products, and a variety of food, personal care and health & wellness items.',
    items: [
      Item(
        id: '101',
        name: 'Paracetamol',
        description: 'Pain reliever and fever reducer',
        imageUrl: 'assets/images/item1.png',
        price: 5.00,
      ),
      Item(
        id: '102',
        name: 'Vitamin C',
        description: 'Boosts immune system health',
        imageUrl: 'assets/images/item2.png',
        price: 10.00,
      ),
      Item(
        id: '103',
        name: 'Cough Syrup',
        description: 'Relieves cough symptoms',
        imageUrl: 'assets/images/item3.png',
        price: 7.50,
      ),
      Item(
        id: '104',
        name: 'Ibuprofen',
        description: 'Reduces pain and inflammation',
        imageUrl: 'assets/images/item4.png',
        price: 6.00,
      ),
      Item(
        id: '105',
        name: 'Antacid',
        description: 'Treats heartburn and indigestion',
        imageUrl: 'assets/images/item5.png',
        price: 4.00,
      ),
    ],
  ),
  Shop(
    id: '2',
    name: 'Mercury Drug',
    imageUrl: 'assets/images/shop2.png',
    rating: 4.5,
    description:
        'Mercury Drug is more than just a pharmacy - it is the country\'s trusted and caring health and wellness partner, providing the widest range of branded and generic medicines, as well as a complete line of healthcare and personal care products, including medical devices, and basic everyday needs.',
    items: [
      Item(
        id: '201',
        name: 'Aspirin',
        description: 'Pain reliever and fever reducer',
        imageUrl: 'assets/images/item6.png',
        price: 3.50,
      ),
      Item(
        id: '202',
        name: 'Tylenol',
        description: 'Relieves cold symptoms',
        imageUrl: 'assets/images/item7.png',
        price: 8.00,
      ),
      Item(
        id: '203',
        name: 'Allergy Tablets',
        description: 'Relieves allergy symptoms',
        imageUrl: 'assets/images/item8.png',
        price: 12.00,
      ),
      Item(
        id: '204',
        name: 'Bepanthen',
        description: 'For minor cuts and wounds',
        imageUrl: 'assets/images/item9.png',
        price: 5.50,
      ),
      Item(
        id: '205',
        name: 'Clariclear',
        description: 'Clears nasal congestion',
        imageUrl: 'assets/images/item10.png',
        price: 9.00,
      ),
    ],
  ),
  Shop(
    id: '3',
    name: 'The Generics Pharmacy',
    imageUrl: 'assets/images/shop3.png',
    rating: 4.7,
    description:
        'We understand the value of a healthy Filipino in making a happy home and in nation building. Thus, we shall address the health needs of every Filipino by providing a complete range of safe, quality, and cost-effective generic medicines and healthcare products and services',
    items: [
      Item(
        id: '301',
        name: 'Salonpas',
        description: 'Targets muscle pain',
        imageUrl: 'assets/images/item11.png',
        price: 6.50,
      ),
      Item(
        id: '302',
        name: 'Thermometer',
        description: 'Digital thermometer for temperature monitoring',
        imageUrl: 'assets/images/item12.png',
        price: 15.00,
      ),
      Item(
        id: '303',
        name: 'Antiseptic Wipes',
        description: 'Disinfects and cleans wounds',
        imageUrl: 'assets/images/item13.png',
        price: 3.00,
      ),
      Item(
        id: '304',
        name: 'Hand Sanitizer',
        description: 'Kills 99.9% of germs',
        imageUrl: 'assets/images/item14.png',
        price: 2.50,
      ),
      Item(
        id: '305',
        name: 'Bandages',
        description: 'Protects minor cuts and scrapes',
        imageUrl: 'assets/images/item15.png',
        price: 4.50,
      ),
    ],
  ),
];
