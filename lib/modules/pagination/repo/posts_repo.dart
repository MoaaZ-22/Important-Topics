import 'package:animation/modules/base/repository/base_repository.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../network/error_handler.dart';
import '../../../network/failure.dart';
import '../../../network/network_constants.dart';
import '../models/post_model.dart';

class PostsRepo extends BaseRepository {
  PostsRepo();

  Future<Either<Failure, List<Post>>> getPosts({
    int startIndex = 0,
    int limit = 20,
  }) async {
    if (await networkInfo.isConnected) {
      // It's connected to the internet, it's safe to call the API.
      try {
        late final dynamic response;
        await dio.getDio().then((value) async {
          response = await value.get(
            '${NetworkConstants.baseUrl}/posts',
            queryParameters: {
              '_start': startIndex,
              '_limit': limit,
            },
          );
        });

        if (response.statusCode == 200) {
          // Success, return data
          final List<dynamic> data = response.data;
          final posts =
              data.map((jsonPost) => Post.fromJson(jsonPost)).toList();
          return Right(posts);
        } else {
          // Failure, return business error
          return Left(
              Failure(ApiInternalStatus.failure, ResponseMessage.unKnown));
        }
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // Return internet connection error
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
