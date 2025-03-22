import 'dart:convert';

class MedicineReview {
  int id;
  String comment;
  String createdAt;
  int medicine;
  int userNameId;
  String firstName;

  MedicineReview({
    required this.id,
    required this.comment,
    required this.createdAt,
    required this.medicine,
    required this.userNameId,
    required this.firstName
  });

  // Factory method to create a MedicineReview from JSON
  factory MedicineReview.fromJson(Map<String, dynamic> json) {
    return MedicineReview(
      id: json['id'],
      comment: json['comment'],
      createdAt: json['created_at'],
      medicine: json['medicine'],
      userNameId: json['user'],
      firstName: json['firstName']
    );
  }

  // Method to convert a MedicineReview to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'comment': comment,
      'created_at': createdAt,
      'medicine': medicine,
      'user':userNameId,
      'firstName':firstName
    };
  }
}
