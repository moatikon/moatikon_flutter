class TikonEntity {
  final String id, image, storeName, tikonName, category;
  final DateTime dDay;
  final int disCount;

  const TikonEntity({
    required this.id,
    required this.image,
    required this.storeName,
    required this.tikonName,
    required this.category,
    required this.dDay,
    required this.disCount,
  });
}