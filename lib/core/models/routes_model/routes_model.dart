import 'route.dart';

class RoutesModel {
	List<Routing>? routes;

	RoutesModel({this.routes});

	factory RoutesModel.fromJson(Map<String, dynamic> json) => RoutesModel(
				routes: (json['routes'] as List<dynamic>?)
						?.map((e) => Routing.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'routes': routes?.map((e) => e.toJson()).toList(),
			};
}
