import 'package:flutter/material.dart';
import 'categories_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomePageContent(),    // Home page content with sections like "Popular Now"
    const CategoriesPage(),     // Categories page
    const CartPage(),           // Cart page
    const ProfilePage(),        // Profile page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
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
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  bool _showAllPopularNow = false;
  String _searchText = "";

  final List<Map<String, String>> _products = [
    {"name": "Mini ash skirt", "price": "4000rs", "image": 'assets/images/popular1.jpg'},
    {"name": "Ripped jeans", "price": "5120rs", "image": 'assets/images/popular2.jpg'},
    {"name": "Cotton grey purple shirt", "price": "3900rs", "image": 'assets/images/popular3.jpg'},
    {"name": "Elegant scarf", "price": "1500rs", "image": 'assets/images/appimg5.jpg'},
    {"name": "Summer shirt", "price": "2000rs", "image": 'assets/images/appimg6.jpg'},
    {"name": "Floral print purple frock", "price": "7500rs", "image": 'assets/images/appimg7.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredProducts = _products.where((product) {
      return product['name']!.toLowerCase().contains(_searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0,
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: const AssetImage('assets/images/profileimg.jpg'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),

              // Popular Now Section
              _buildSectionTitle(context, 'Popular Now'),
              _showAllPopularNow
                  ? _buildImageGrid(context, filteredProducts)
                  : SizedBox(
                height: 160, // Reduced height for smaller images
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    return _buildProductCard(filteredProducts[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),

              // What Do You Prefer Section
              _buildSectionTitle(context, 'What Do You Prefer?'),
              SizedBox(
                height: 160, // Smaller height for consistent layout
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildImageCard('assets/images/popular4.jpg'),
                    _buildImageCard('assets/images/prefer2.jpg'),
                    _buildImageCard('assets/images/prefer3.jpg'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Categories Section
              _buildSectionTitle(context, 'Categories'),
              SizedBox(
                height: 160, // Reduced height to fit smaller images
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildImageCard('assets/images/appimg5.jpg'),
                    _buildImageCard('assets/images/appimg6.jpg'),
                    _buildImageCard('assets/images/appimg7.jpg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _showAllPopularNow = !_showAllPopularNow;
            });
          },
          child: Row(
            children: const [
              Text('See All', style: TextStyle(color: Colors.brown)),
              Icon(Icons.arrow_forward_ios, size: 12, color: Colors.brown),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                product['image']!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            product['name']!,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            product['price']!,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGrid(BuildContext context, List<Map<String, String>> products) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 16 / 9,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _buildProductCard(products[index]);
      },
    );
  }

  Widget _buildImageCard(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
