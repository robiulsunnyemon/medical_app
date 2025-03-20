class Medicine {
  int id;
  String name;
  String manufacturer;
  String price;
  int stock;
  String description;
  DateTime createdAt;

  // Constructor
  Medicine({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.price,
    required this.stock,
    required this.description,
    required this.createdAt,
  });

  // Factory method to create a Medicine from JSON
  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['id'],
      name: json['name'],
      manufacturer: json['manufacturer'],
      price: json['price'],
      stock: json['stock'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  // Method to convert Medicine to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'price': price,
      'stock': stock,
      'description': description,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
