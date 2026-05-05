import 'package:flutter/material.dart';
import 'home.dart';

class MedicineListScreen extends StatefulWidget {
  const MedicineListScreen({super.key});

  @override
  State<MedicineListScreen> createState() => _MedicineListScreenState();
}

class _MedicineListScreenState extends State<MedicineListScreen> {
  int doloCount = 0;
  int montekCount = 0;
  int telmaCount = 0;

  void showZoomImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: InteractiveViewer(
              child: Image.asset(imagePath),
            ),
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> get selectedItems {
    final items = <Map<String, dynamic>>[];
    if (doloCount > 0) {
      items.add({
        'title': 'Dolo 650',
        'unitPrice': 30,
        'quantity': doloCount,
      });
    }
    if (montekCount > 0) {
      items.add({
        'title': 'Montek LC',
        'unitPrice': 200,
        'quantity': montekCount,
      });
    }
    if (telmaCount > 0) {
      items.add({
        'title': 'Telma AZ',
        'unitPrice': 176,
        'quantity': telmaCount,
      });
    }
    return items;
  }

  int get totalPrice => selectedItems.fold(
        0,
        (sum, item) => sum + (item['unitPrice'] as int) * (item['quantity'] as int),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Store'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('vignesh'),
              accountEmail: Text('vicky16@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person, size: 40),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart_checkout_sharp),
              title: const Text('Cart Checkout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delivery_dining),
              title: const Text('Delivery details'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                buildMedicineCard(
                  context: context,
                  imagePath: 'assets/logo/dolo.jpg',
                  title: 'Dolo 650',
                  subtitle: 'Fever & Pain Relief',
                  priceText: '₹30',
                  quantity: doloCount,
                  onAdd: () => setState(() => doloCount++),
                  onRemove: () {
                    if (doloCount > 0) setState(() => doloCount--);
                  },
                ),
                const SizedBox(height: 20),
                buildMedicineCard(
                  context: context,
                  imagePath: 'assets/logo/Montek LC.jpg',
                  title: 'Montek LC',
                  subtitle:
                      'Allergic symptoms such as runny nose, stuffy nose, sneezing, itching, swelling, watery eyes, and congestion.',
                  priceText: '₹200',
                  quantity: montekCount,
                  onAdd: () => setState(() => montekCount++),
                  onRemove: () {
                    if (montekCount > 0) setState(() => montekCount--);
                  },
                ),
                const SizedBox(height: 20),
                buildMedicineCard(
                  context: context,
                  imagePath: 'assets/logo/telma AZ.jpg',
                  title: 'Telma AZ',
                  subtitle: 'Controls blood pressure in patients with hypertension.',
                  priceText: '₹176',
                  quantity: telmaCount,
                  onAdd: () => setState(() => telmaCount++),
                  onRemove: () {
                    if (telmaCount > 0) setState(() => telmaCount--);
                  },
                ),
              ],
            ),
          ),
          if (selectedItems.isNotEmpty) buildSelectedSummary(context),
        ],
      ),
    );
  }

  Widget buildSelectedSummary(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selected Items',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...selectedItems.map(
            (item) {
              final subtotal = (item['unitPrice'] as int) * (item['quantity'] as int);
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '${item['title']} x${item['quantity']}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Text(
                      '₹$subtotal',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total selected',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                '₹$totalPrice',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TotalSummaryScreen(
                      selectedItems: selectedItems,
                    ),
                  ),
                );
              },
              child: const Text('View item rates & total'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMedicineCard({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String subtitle,
    required String priceText,
    required int quantity,
    required VoidCallback onAdd,
    required VoidCallback onRemove,
  }) {
    return InkWell(
      onTap: () => showZoomImage(context, imagePath),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(priceText, style: const TextStyle(fontWeight: FontWeight.bold)),
                        buildQuantityControls(quantity, onAdd, onRemove),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuantityControls(int quantity, VoidCallback onAdd, VoidCallback onRemove) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: onRemove,
            splashRadius: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              quantity.toString(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAdd,
            splashRadius: 20,
          ),
        ],
      ),
    );
  }
}

class TotalSummaryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> selectedItems;

  const TotalSummaryScreen({super.key, required this.selectedItems});

  int get totalAmount => selectedItems.fold(
        0,
        (sum, item) => sum + (item['unitPrice'] as int) * (item['quantity'] as int),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Price & Rates'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selected Tablet Rates',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...selectedItems.map((item) {
              final lineTotal = (item['unitPrice'] as int) * (item['quantity'] as int);
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text('Rate: ₹${item['unitPrice']}', style: const TextStyle(color: Colors.grey)),
                            Text('Qty: ${item['quantity']}', style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      Text('₹$lineTotal', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Price',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '₹$totalAmount',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
