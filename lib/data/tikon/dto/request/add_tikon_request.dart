class AddTikonRequest {
  final String image, storeName, tikonName, category, finishedTikon;
  final int disCount;

  AddTikonRequest({
    required this.image,
    required this.storeName,
    required this.tikonName,
    required this.category,
    required this.finishedTikon,
    required this.disCount,
  });

  Map<String, dynamic> toJson(){
    return {
      "image": image,
      "storeName": storeName,
      "tikonName": tikonName,
      "category": category,
      "finishedTikon": finishedTikon,
      "disCount": disCount,
    };
  }
}