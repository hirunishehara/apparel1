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

  // List of pages corresponding to the tabs in the bottom navigation bar
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

// The home page content
class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous screen
          },
        ),
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: const AssetImage('assets/images/profileimg.jpg'), // Replace with profile image asset
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

              // Section 1: Popular Now
              _buildSectionTitle(context, 'Popular Now'),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildImageCard('assets/images/popular1.jpg'),
                    _buildImageCard('assets/images/popular2.jpg'),
                    _buildImageCard('assets/images/popular3.jpg'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Section 2: What Do You Prefer?
              _buildSectionTitle(context, 'What Do You Prefer?'),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildImageCard('assets/images/prefer1.jpg'),
                    _buildImageCard('assets/images/prefer2.jpg'),
                    _buildImageCard('assets/images/prefer3.jpg'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Section 3: Categories
              _buildSectionTitle(context, 'Categories'),
              SizedBox(
                height: 120,
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

  // Helper to build a section title
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
            // Implement See All functionality if needed
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

  // Helper to build a horizontal image card
  Widget _buildImageCard(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
