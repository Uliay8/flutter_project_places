import 'package:dio/dio.dart';
import 'package:flutter_project_places/api/service/api_client.dart';
import 'package:flutter_project_places/features/common/data/repositories/favorites_repository.dart';
import 'package:flutter_project_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class AppDependencies {
  static List<SingleChildWidget> providers() {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = 'http://localhost:8080'
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    final apiClient = ApiClient(dio);
    return [
      Provider<ApiClient>(create: (_) => apiClient),
      Provider<IFavoritesRepository>(create: (_) => FavoritesRepository()),
    ];
  }
}
