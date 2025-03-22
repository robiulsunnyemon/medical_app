import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:jstumedicinecare/model/medicine_review_model.dart';

import '../model/medicine_model.dart';
import '../model/user_model.dart';


class CrudMedicineProvider with ChangeNotifier {
  List<Medicine> _medicineList = [];
  late User _userDetails;
  User get userDetails=> _userDetails;
  List<MedicineReview> _reviewsList = [];
  List<Medicine> get medicineList => _medicineList;
  List<MedicineReview> get reviewList => _reviewsList;

  String baseUrl = 'http://192.168.0.106:8000/api/medicines/';
  String reviewUrl="http://192.168.0.106:8000/api/medicine-reviews/?medicine=41";

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


  Future<void> getReviews({required String baseUrl}) async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print(jsonData);
        print("response_type ${jsonData.runtimeType}");
        List<MedicineReview> reviews = (jsonDecode(response.body) as List)
            .map((item) => MedicineReview.fromJson(item))
            .toList();
        _reviewsList = reviews;  // Assign new list to _questionList
        notifyListeners();  // Notify listeners that data has been updated
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }



  Future<void> getUserDetails({required String baseUrl}) async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print(jsonData);
        print("response_type ${jsonData.runtimeType}");
        print("success user get");
         _userDetails = User.fromJson(jsonData);
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