import 'package:bookia_app/features/profile/data/get_profile_response/get_profile_response.dart';

final class ProfileStates {}

final class ProfileInitial extends ProfileStates {}

// get profile

final class GetProfileLoading extends ProfileStates {}

final class GetProfileSuccess extends ProfileStates {
  final GetProfileResponse getProfileResponse;

  GetProfileSuccess(this.getProfileResponse);
}

final class GetProfileError extends ProfileStates {
  final String error;

  GetProfileError(this.error);
}

final class UpdateProfileLoading extends ProfileStates {}

final class UpdateProfileSuccess extends ProfileStates {}

final class UpdateProfileError extends ProfileStates {
  final String error;

  UpdateProfileError(this.error);
}
