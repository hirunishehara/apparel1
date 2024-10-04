import 'package:flutter/material.dart';
import 'buy_item_page.dart';  // Import BuyItemPage here

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  static const List<Map<String, String>> _items = [
    {
      'title': 'Shirt',
      'image': 'assets/images/appimg2.jpg',
      'description': 'Comfortable and stylish shirt.',
      'price': '1000 LKR',
    },
    {
      'title': 'Frocks',
      'image': 'assets/images/appimg3.jpg',
      'description': 'Beautiful frocks for all occasions.',
      'price': '2000 LKR',
    },
    {
      'title': 'Hoodie',
      'image': 'assets/images/appimg4.jpg',
      'description': 'Warm and cozy hoodies.',
      'price': '3000 LKR',
    },
    {
      'title': 'Skirts',
      'image': 'assets/images/appitem4.jpg',
      'description': 'Stylish skirts for any occasion.',
      'price': '1500 LKR',
    },
    {
      'title': 'Caps',
      'image': 'assets/images/appitem5.jpg',
      'description': 'Fashionable caps.',
      'price': '500 LKR',
    },
    {
      'title': 'Shorts',
      'image': 'assets/images/appitem6.jpg',
      'description': 'Comfortable shorts.',
      'price': '800 LKR',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Clothing Items',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          var item = _items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BuyItemPage(
                    imagePath: item['image']!,
                    title: item['title']!,
                    description: item['description']!,
                    price: item['price']!,
                  ),
                ),
              );
            },
            child: Card(
              color: const Color(0xFFF5F5F5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      item['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item['title']!,
                      style: const TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.brown,
        onTap: (index) {
          // Handle navigation to different pages here
        },
      ),
    );
  }
}
