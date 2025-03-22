import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api_services/crud_api_services.dart';
import '../component/medicine_card.dart';
import '../component/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSTU Medicine Care"),
        backgroundColor: Colors.white10,
      ),
      body: Consumer<CrudMedicineProvider>(
        builder: (context, provider, child) {
          if (provider.medicineList.isEmpty) {
            provider.getMedicine(baseUrl: "http://192.168.0.106:8000/api/medicines/"); // Load data when list is empty
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 8),
                  child: CustomSearchBar(),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.medicineList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MedicineCard(
                          name: provider.medicineList[index].name,
                          description: provider.medicineList[index].description,
                          price: provider.medicineList[index].price,
                          stock: provider.medicineList[index].stock,
                          medicineId: provider.medicineList[index].id,
                          manufacturer:
                              provider.medicineList[index].manufacturer,
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Text("Help",style: TextStyle(color: Colors.black54),),),
    );
  }
}
