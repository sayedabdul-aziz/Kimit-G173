import 'package:bookia_app/core/constants/constants.dart';
import 'package:bookia_app/core/services/api_services.dart';
import 'package:bookia_app/core/services/local_services.dart';
import 'package:bookia_app/features/profile/data/get_profile_response/get_profile_response.dart';
import 'package:bookia_app/features/profile/presentation/manager/profile_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitial());

  // get profile

  getProfile() {
    emit(GetProfileLoading());
    try {
      ApiServices.get(
        endPoint: 'profile',
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getCachedData(ktoken)}',
        },
      ).then((value) {
        emit(GetProfileSuccess(GetProfileResponse.fromJson(value)));
      });
    } catch (e) {
      emit(GetProfileError(e.toString()));
    }
  }

  updateProfile(
      {required String name,
      String? path,
      String? phone,
      String? address}) async {
    emit(UpdateProfileLoading());
    try {
      ApiServices.post(
        endPoint: 'update-profile',
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getCachedData(ktoken)}',
        },
        // FormData
        data: FormData.fromMap({
          'name': name,
          if (path != null)
            'image': await MultipartFile.fromFile(path,
                filename: path.split('/').last),
          'phone': phone,
          'address': address
        }),
      ).then((value) {
        emit(UpdateProfileSuccess());
      });
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }
}
