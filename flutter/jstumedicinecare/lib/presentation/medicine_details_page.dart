import 'package:flutter/material.dart';
import 'package:jstumedicinecare/api_services/crud_api_services.dart';
import 'package:provider/provider.dart';
import '../component/medicine_details_container.dart';

class MedicineDetailsPage extends StatefulWidget {
  final String name;
  final String manufacturer;
  final String price;
  final int stock;
  final String description;
  final int medicineId;
  const MedicineDetailsPage(
      {super.key,
      required this.name,
      required this.manufacturer,
      required this.price,
      required this.stock,
      required this.description,
      required this.medicineId});

  @override
  State<MedicineDetailsPage> createState() => _MedicineDetailsPageState();
}

class _MedicineDetailsPageState extends State<MedicineDetailsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      if (mounted) {
        final provider =
            Provider.of<CrudMedicineProvider>(context, listen: false);
        provider.getReviews(
            baseUrl:
                "http://192.168.0.106:8000/api/medicine-reviews/?medicine=${widget.medicineId}");

      }
    });
  }

  List<String> userName=[
    "Robiul Sunny Emon",
    "Asma Afrin",
    "Pushpo Hassan"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicine Details Corner"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MedicineDetailsContainer(
              name: widget.name,
              manufacturer: widget.manufacturer,
              price: widget.price,
              stock: widget.stock,
              description: widget.description,
              medicineId: widget.medicineId,
            ),
            Text(
              "**** Reviews ****",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Consumer<CrudMedicineProvider>(
              builder: (context, provider, child) {
                if (provider.reviewList.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: provider.reviewList.length,
                    itemBuilder: (context, index)  {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(provider.reviewList[index].firstName,style: TextStyle(fontSize: 25),),

                                SizedBox(
                                  height: 20,
                                ),
                                Text(provider.reviewList[index].comment),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
