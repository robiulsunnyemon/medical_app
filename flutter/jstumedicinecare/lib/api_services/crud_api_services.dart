import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/medicine_model.dart';


class CrudMedicineProvider with ChangeNotifier {
  List<Medicine> _medicineList = [];
  List<Medicine> get medicineList => _medicineList;

  String baseUrl = 'http://192.168.0.106:8000/api/medicines/';

  Future<void> getMedicine({required String baseUrl}) async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print(jsonData);
        print("response_type ${jsonData.runtimeType}");
        List<Medicine> medicine = (jsonDecode(response.body) as List)
            .map((item) => Medicine.fromJson(item))
            .toList();
        _medicineList = medicine;  // Assign new list to _questionList
        notifyListeners();  // Notify listeners that data has been updated
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}