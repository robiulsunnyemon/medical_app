import 'package:flutter/material.dart';
import '../component/medicine_details_container.dart';


class MedicineDetailsPage extends StatelessWidget {
  final String name;
  final String manufacturer;
  final String price;
  final int stock;
  final String description;
  const MedicineDetailsPage(
      {super.key,
      required this.name,
      required this.manufacturer,
      required this.price,
      required this.stock,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicine Details Corner"),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: MedicineDetailsContainer(
            name: name,
            manufacturer: manufacturer,
            price: price,
            stock: stock,
            description: description),
      ),
    );
  }
}
