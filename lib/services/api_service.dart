import 'package:dio/dio.dart';
import 'package:majootestcase/models/movie.dart';

import 'package:majootestcase/services/dio_config_service.dart' as dioConfig;
import 'package:majootestcase/utils/error_helper.dart';

class ApiServices {
  Future<MovieModel?> getMovieList() async {
    try {
      var dio = await dioConfig.dio();

      var response = await dio?.get(
        'https://api.themoviedb.org/3/trending/all/day',
        queryParameters: {
          'api_key': '2a7cd35983a9d9711a0295962d29677e',
        },
      );

      return MovieModel.fromJson(response?.data);
    } on DioError catch (e) {
      print(ErrorHelper.extractApiError(e));
      return null;
    }
  }
}
