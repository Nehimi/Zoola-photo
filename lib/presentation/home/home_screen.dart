import 'package:flutter/material.dart';
import 'package:zoola_pic/presentation/booking/available_photographers_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // TODO: Handle notification tap
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Image Slider
            SizedBox(
              height: 200,
              child: PageView(
                controller: _pageController,
                children: [
                  // IMPORTANT: Add your promotional images to assets/images
                  // For example: 'assets/images/promo_image_1.png'
                  _buildPromoCard('assets/images/promo_image_1.png', '30% OFF\nGraduation Photos'),
                  _buildPromoCard('assets/images/promo_image_1.png', 'Summer Sale!'),
                  _buildPromoCard('assets/images/promo_image_1.png', 'Book now!'),
                ],
              ),
            ),
             const SizedBox(height: 8),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => _buildDot(index: index)),
              ),
            const SizedBox(height: 24),
            // Action Buttons Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.3,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildActionButton(context, Icons.calendar_today, 'Book a Date'),
                  _buildActionButton(context, Icons.photo_library, 'My Gallery'),
                  _buildActionButton(context, Icons.card_giftcard, 'My Packages'),
                  _buildActionButton(context, Icons.location_on, 'Locations'),
                ],
              ),
            ),
             const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  Widget _buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? Theme.of(context).primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _buildPromoCard(String imagePath, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
        ),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          if (label == 'Book a Date') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AvailablePhotographersScreen()),
            );
          }
        },
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 12),
            Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
