import 'package:flutter/material.dart';

class MedicineDetailsContainer extends StatelessWidget {
  final String name;
  final String manufacturer;
  final String price;
  final int stock;
  final String description;
  const MedicineDetailsContainer({super.key, required this.name, required this.manufacturer, required this.price, required this.stock, required this.description});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
              "https://cdn.pixabay.com/photo/2016/12/05/19/43/pill-1884775_960_720.jpg"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Manufacturer: $manufacturer",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price: \$ $price",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Stock: $stock",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  "Description:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
