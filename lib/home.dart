import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Ad Banner
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CarouselSlider(
                  items: [
                    Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgxtW7gHeR7A9LEjfJc8Xh5FGcoQQkRxJttw&s',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgxtW7gHeR7A9LEjfJc8Xh5FGcoQQkRxJttw&s',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgxtW7gHeR7A9LEjfJc8Xh5FGcoQQkRxJttw&s',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ],
                  options: CarouselOptions(
                    height: 150.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 1.0,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Money Transfers Section
              const Text('Money Transfers',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 40, 34, 46),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildTransferOption(Icons.person, 'To Mobile no'),
                            const SizedBox(width: 13),
                            buildTransferOption(
                                Icons.account_balance, 'Bank/UPI ID'),
                            const SizedBox(width: 13),
                            buildTransferOption(
                                Icons.account_balance_wallet, 'Self Account'),
                            const SizedBox(width: 11),
                            buildTransferOption(
                                Icons.account_balance_wallet, 'Balance'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              // UPI Section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 40, 34, 46),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('UPI ID: 7569834001@ybl',
                        style: TextStyle(color: Colors.white)),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Try Now'))
                  ],
                ),
              ),
              const SizedBox(height: 6),

              // Explore and Invite Section
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: const Color.fromARGB(255, 40, 34, 46),
                ),
                padding: const EdgeInsets.all(20),
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
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 40, 34, 46),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildOption(Icons.phone_android, 'Recharge'),
                    buildOption(Icons.attach_money, 'Loan'),
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
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 40, 34, 46),
                  borderRadius: BorderRadius.circular(20),
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
      ),
    );
  }

  Column buildTransferOption(IconData icon, String title) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: Icon(icon, color: const Color.fromARGB(255, 255, 255, 255)),
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
              backgroundColor: Colors.deepPurple,
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
