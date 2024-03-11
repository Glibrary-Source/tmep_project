

class Product {

  String? name;
  int? price;
  String? imagePath;

  Product ({this.name, this.imagePath, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    imagePath = json['image_path'];
  }

}