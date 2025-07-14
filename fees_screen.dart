import 'package:flutter/material.dart';

class FeesScreen extends StatelessWidget {
  const FeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> feesData = [
      {
        'receipt': '#98761',
        'month': 'October',
        'paymentDate': '10 Oct 20',
        'pending': '₹999',
        'payNow': true,
      },
      {
        'receipt': '#98431',
        'month': 'September',
        'paymentDate': '10 Sep 20',
        'payMode': 'Cash on Counter',
        'amount': '₹999',
        'payNow': false,
      },
      {
        'receipt': '#98761',
        'month': 'August',
        'paymentDate': '10 Aug 20',
        'payMode': 'Cash on Counter',
        'amount': '₹999',
        'payNow': false,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFE9F0FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: const Text(
          "Fees Due",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF5B8DEE), Color(0xFF306FD8)]),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: feesData.length,
        itemBuilder: (context, index) {
          final item = feesData[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow("Receipt No.", item['receipt']),
                _buildRow("Month", item['month']),
                _buildRow("Payment Date", item['paymentDate']),
                if (item['payNow'] == true)
                  _buildRow("Total Pending Amount", item['pending'])
                else ...[
                  _buildRow("Pay Mode", item['payMode']),
                  _buildRow("Total Amount", item['amount']),
                ],
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5B8DEE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(item['payNow'] == true ? Icons.arrow_forward : Icons.download),
                    label: Text(item['payNow'] == true ? "PAY NOW" : "DOWNLOAD"),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRow(String label, Object? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value?.toString() ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
