import 'location.dart';
import 'viewport.dart';

class Geometry {
  Location? location;
  String? locationType;
  Viewport? viewport;

  Geometry({this.location, this.locationType, this.viewport});

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    location:
        json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
    locationType: json['location_type'] as String?,
    viewport:
        json['viewport'] == null
            ? null
            : Viewport.fromJson(json['viewport'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'location': location?.toJson(),
    'location_type': locationType,
    'viewport': viewport?.toJson(),
  };
}
