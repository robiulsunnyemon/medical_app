import 'package:flutter/material.dart';
import 'package:jstumedicinecare/presentation/component/medicine_card.dart';
import 'package:provider/provider.dart';

import '../api_services/crud_api_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSTU Medicine Care"),
      ),
      body: Consumer<CrudMedicineProvider>(
        builder: (context, provider, child) {
          if (provider.medicineList.isEmpty) {
            provider.getMedicine(); // Load data when list is empty
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: provider.medicineList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MedicineCard(
                    name: provider.medicineList[index].name,
                    description:  provider.medicineList[index].description,
                    price:  provider.medicineList[index].price,
                    stock:  provider.medicineList[index].stock,
                    manufacturer:  provider.medicineList[index].manufacturer,
                  )
                );
              },
            );
          }
        },
      ),
    );
  }
}
