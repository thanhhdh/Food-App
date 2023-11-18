class ProductModel {
  String? productId;
  String? productName;
  String? productImage;
  int? productPrice;
  int? productQuantity;
  List<dynamic>? productUnit;
  ProductModel(
      {this.productId,
      this.productUnit,
      this.productImage,
      this.productName,
      this.productPrice,
      this.productQuantity});
}
