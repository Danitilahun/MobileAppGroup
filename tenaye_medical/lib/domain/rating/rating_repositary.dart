import 'package:dartz/dartz.dart';
import 'package:tenaye/domain/rating/failure.dart';
import 'package:tenaye/domain/rating/rating.dart';
import 'package:tenaye/Infrastructure/rating.dart';

class RatingRepository {
  final RatingDataProvider ratingDataProvider = RatingDataProvider();

  RatingRepository();

  Future<Either<RatingException, void>> postRating(Rating rating) async {
    try {
      await ratingDataProvider.postRating(rating);
      return Right(null);
    } catch (e) {
      return Left(RatingException('Failed to post rating: $e'));
    }
  }

  Future<Either<RatingException, List<Rating>>> getDoctorRatings(
      String doctorId) async {
    try {
      final List<Rating> ratings =
          await ratingDataProvider.getDoctorRatings(doctorId);
      
      return Right(ratings);
    } catch (e) {
      return Left(RatingException('Failed to get doctor ratings: $e'));
    }
  }

  Future<Either<RatingException, void>> editRating(Rating rating) async {
    try {
      await ratingDataProvider.editRating(rating);
      return Right(null);
    } catch (e) {
      return Left(RatingException('Failed to edit rating: $e'));
    }
  }

  
}
