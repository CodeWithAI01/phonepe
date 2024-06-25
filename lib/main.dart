// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './loan.dart';
import './wealth.dart';

import './history.dart';
import './insurance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PhonePe Clone',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 19, 4, 39),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: const Color.fromARGB(255, 89, 39, 176),
          secondary: const Color.fromARGB(255, 73, 39, 176),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    MainScreen(),
    LoanScreen(),
    InsuranceScreen(),
    WealthScreen(),
    HistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 52, 32, 104),
          title: const Text('PhonePay'),
          actions: [
            IconButton(
                icon: const Icon(Icons.qr_code_outlined), onPressed: () {}),
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
            IconButton(icon: const Icon(Icons.help_outline), onPressed: () {}),
          ],
          leading: const Icon(Icons.account_circle),
        ),
        body: _pages.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet), label: 'Loan'),
            BottomNavigationBarItem(
                icon: Icon(Icons.security), label: 'Insurance'),
            BottomNavigationBarItem(
                icon: Icon(Icons.show_chart), label: 'Wealth'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: const Color.fromARGB(255, 126, 125, 125),
          selectedItemColor: const Color.fromARGB(255, 222, 218, 233),
          backgroundColor: const Color.fromARGB(255, 52, 32, 104),
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://www.codesign.in/codesign/wp-content/uploads/2021/03/Codesign-PhonePe-Assets.jpg',
      'https://www.codesign.in/codesign/wp-content/uploads/2021/03/Codesign-PhonePe-KarteJaBadhteJa.jpg',
      'https://www.codesign.in/codesign/wp-content/uploads/2021/03/Codesign-PhonePe-Expressions.jpg'
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Ad Banner with Carousel Slider
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 160.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                ),
                items: imgList
                    .map((item) => SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(item, fit: BoxFit.cover),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),

            // Money Transfers Section
            const Text('Money Transfers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Color.fromARGB(255, 31, 28, 36),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTransferOption(Icons.person, 'To Mobile No'),
                  buildTransferOption(Icons.account_balance, 'To Bank/UPI ID'),
                  buildTransferOption(
                      Icons.account_balance_wallet, 'To Self Acc'),
                  buildTransferOption(
                      Icons.account_balance_wallet, 'Check Balance'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // UPI Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 31, 28, 36),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('UPI ID: 7569834001@ybl',
                      style: TextStyle(color: Colors.white)),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Try Now',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Explore and Invite Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 31, 28, 36),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildOption(Icons.wallet_travel, 'PhonePe Wallet'),
                  buildOption(Icons.card_giftcard, 'Explore Rewards',
                      badgeCount: 3),
                  buildOption(Icons.share, 'Invite Now'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Recharge & Pay Bills Section
            const Text('Recharge & Pay Bills',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 31, 28, 36),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildOption(Icons.phone_android, 'Mob Recharge'),
                  buildOption(Icons.attach_money, 'Loan payment'),
                  buildOption(Icons.home, 'Rent'),
                  buildOption(Icons.satellite, 'DTH'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Loan Section
            const Text('Loan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 31, 28, 36),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildOption(Icons.score, 'Credit Score', label: 'Popular'),
                  buildOption(Icons.motorcycle, 'Bike Loan'),
                  buildOption(Icons.trending_up, 'Mutual Funds'),
                  buildOption(Icons.attach_money, 'Gold Loan'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildTransferOption(IconData icon, String title) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 75, 14, 129),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(title,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Column buildOption(IconData icon, String title,
      {int badgeCount = 0, String label = ''}) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 96, 39, 176),
              child: Icon(icon, color: Colors.white),
            ),
            if (badgeCount > 0)
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text(badgeCount.toString(),
                    style: const TextStyle(fontSize: 12, color: Colors.white)),
              ),
            if (label.isNotEmpty)
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  color: Colors.orange,
                  child: Text(label,
                      style:
                          const TextStyle(fontSize: 10, color: Colors.white)),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(title,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
