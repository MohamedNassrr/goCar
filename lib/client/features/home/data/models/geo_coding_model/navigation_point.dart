import 'location.dart';

class NavigationPoint {
  Location? location;

  NavigationPoint({this.location});

  factory NavigationPoint.fromJson(Map<String, dynamic> json) {
    return NavigationPoint(
      location:
          json['location'] == null
              ? null
              : Location.fromJson(json['location'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'location': location?.toJson()};
}
