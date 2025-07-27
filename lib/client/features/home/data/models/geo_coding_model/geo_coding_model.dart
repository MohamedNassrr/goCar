class GeoCodingModel {
  String? formattedAddress;

  GeoCodingModel({this.formattedAddress});

  factory GeoCodingModel.fromJson(Map<String, dynamic> json) {
    return GeoCodingModel(
      formattedAddress: json['formatted_address'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'formatted_address': formattedAddress};
}
