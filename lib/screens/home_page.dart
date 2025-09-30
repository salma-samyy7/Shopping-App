import 'package:flutter/material.dart';
import 'package:shopping_app/l10n/app_localizations.dart';
import 'package:shopping_app/screens/welcome_page.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/offer_item.dart';

class ShoppingHomeScreen extends StatefulWidget {
  const ShoppingHomeScreen({super.key});

  @override
  State<ShoppingHomeScreen> createState() => _ShoppingHomeScreenState();
}

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen> {
  int cartCount = 0;
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _addToCart(Product p, AppLocalizations t) {
    setState(() => cartCount++);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(t.addToCart),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color.fromARGB(255, 80, 30, 216),
      ),
    );
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop(); // Close dialog
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                (route) => false,
              );
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    final List<Product> products = [
      Product(
        id: 'p1',
        title: t.productGreenSundress,
        image: 'images/sundress.jpg',
        price: 2399,
      ),
      Product(
        id: 'p2',
        title: t.productCroppedShirt,
        image: 'images/shirt.jpg',
        price: 549,
      ),
      Product(
        id: 'p3',
        title: t.productBlackJumper,
        image: 'images/jumper.jpg',
        price: 2549,
      ),
      Product(
        id: 'p4',
        title: t.productSuitJacket,
        image: 'images/jacket.jpg',
        price: 999,
      ),
      Product(
        id: 'p5',
        title: t.productHighWaistedJeans,
        image: 'images/pants.jpg',
        price: 1549,
      ),
      Product(
        id: 'p6',
        title: t.productCreamyTshirt,
        image: 'images/creamyT-shirt.jpg',
        price: 499,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.ourProducts,
          style: TextStyle(
            fontFamily: 'Suwannaphum',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              if (cartCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Text(
                      '$cartCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.withValues(alpha: 0.1),
              Colors.purple.withValues(alpha: 0.2),
              const Color.fromARGB(255, 226, 220, 226),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Center(
                child: Text(
                  t.featuredProducts,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView(
                      controller: _pageController,
                      onPageChanged: (index) =>
                          setState(() => _currentPage = index),
                      children: [
                        _buildFeaturedCard(
                          'images/banner2.jpg',
                          t.dressCollection,
                        ),
                        _buildFeaturedCard('images/banner.jpg', t.newArrivals),
                        _buildFeaturedCard('images/banner3.jpg', t.bestSellers),
                      ],
                    ),
                    // Left Arrow
                    Positioned(
                      left: 24,
                      child: _buildArrowButton(
                        icon: Icons.chevron_left,
                        onPressed: _previousPage,
                        enabled: _currentPage > 0,
                      ),
                    ),
                    // Right Arrow
                    Positioned(
                      right: 24,
                      child: _buildArrowButton(
                        icon: Icons.chevron_right,
                        onPressed: _nextPage,
                        enabled: _currentPage < 2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Colors.deepPurple
                          : Colors.grey[400],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  t.shopOurCollection,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (ctx, i) {
                    final p = products[i];
                    return ProductCard(
                      product: p,
                      onAdd: () => _addToCart(p, t),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                     t.hotOffers,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const Text('🔥', style: TextStyle(fontSize: 24)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (ctx, i) {
                  final offers = [
                    {
                      'title': t.offer1Title,
                      'desc': t.offer1Desc,
                      'badge': t.offer1Badge,
                    },
                    {
                      'title': t.offer2Title,
                      'desc': t.offer2Desc,
                      'badge': t.offer2Badge,
                    },
                    {
                      'title': t.offer3Title,
                      'desc': t.offer3Desc,
                      'badge': t.offer3Badge,
                    },
                    {
                      'title': t.offer4Title,
                      'desc': t.offer4Desc,
                      'badge': t.offer4Badge,
                    },
                    {
                      'title': t.offer5Title,
                      'desc': t.offer5Desc,
                      'badge': t.offer5Badge,
                    },
                  ];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: OfferItem(
                      title: offers[i]['title']!,
                      description: offers[i]['desc']!,
                      badge: offers[i]['badge']!,
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArrowButton({
    required IconData icon,
    required VoidCallback onPressed,
    required bool enabled,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: enabled
                ? Colors.white.withValues(alpha: 0.9)
                : Colors.white.withValues(alpha: 0.3),
            shape: BoxShape.circle,
            boxShadow: enabled
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Icon(
            icon,
            color: enabled ? Colors.grey[800] : Colors.grey[400],
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedCard(String image, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(image, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}