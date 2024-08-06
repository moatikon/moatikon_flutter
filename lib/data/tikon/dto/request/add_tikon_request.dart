class AddTikonRequest {
  final String image, storeName, tikonName, category;
  final int dDay, disCount;

  AddTikonRequest({
    required this.image,
    required this.storeName,
    required this.tikonName,
    required this.category,
    required this.dDay,
    required this.disCount,
  });
}