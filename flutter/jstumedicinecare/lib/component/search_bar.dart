import 'package:flutter/material.dart';
import 'package:jstumedicinecare/api_services/crud_api_services.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {


  void _filterList(String query) {
    String baseUrl= "http://192.168.0.106:8000/api/medicine_n/$query/";
    print(baseUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CrudMedicineProvider>(
      builder: (context, provider, child) {
        return TextFormField(
          onChanged: (query){
            provider.getMedicine(baseUrl: "http://192.168.0.106:8000/api/medicine_n/$query/");
          },
          decoration: InputDecoration(
            labelText: "Search",
            hintText: "Type to search...",
            prefixIcon: const Icon(Icons.search,color: Colors.black54,),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
            ),

          ),
        );
      },
    );
  }
}