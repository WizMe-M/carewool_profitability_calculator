class ProductSize {
  final double width;
  final double height;
  final double length;

  ProductSize(this.width, this.height, this.length);

  double get volume => (width * height * length) / 1000;

  bool get isExtraLargeProduct {
    var maxMoreThan120 = length > 120 || height > 120 || width > 120;
    var sumSizeMoreThan200 = length + height + width > 200;
    return maxMoreThan120 || sumSizeMoreThan200;
  }
}
