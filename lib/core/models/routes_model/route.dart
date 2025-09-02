import 'polyline.dart';

class Routing {
	int? distanceMeters;
	double? duration;
	Polyline? polyline;

	Routing({this.distanceMeters, this.duration, this.polyline});

	factory Routing.fromJson(Map<String, dynamic> json) => Routing(
				distanceMeters: json['distanceMeters'] as int?,
				duration: json['duration'],
				polyline: json['polyline'] == null
						? null
						: Polyline.fromJson(json['polyline'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'distanceMeters': distanceMeters,
				'duration': duration,
				'polyline': polyline?.toJson(),
			};
}
