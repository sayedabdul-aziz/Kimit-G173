import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety_5_28/features/auth/presentation/manager/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  // login
  login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginErrorState(
          'المستخدم غير موجود',
        ));
      } else if (e.code == 'wrong-password') {
        emit(LoginErrorState(
          'كلمة المرور خاطئة',
        ));
      } else {
        emit(LoginErrorState(
          'حدثت مشكلة في التسجيل ، حاول مرة اخرى',
        ));
      }
    }
  }

  // register as patient
  registerPatient(
      {required String name,
      required String email,
      required String password}) async {
    emit(RegisterLoadingState());
    try {
      //1) create user using firebase auth (email and password)
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //2) update user name and role
      User user = credential.user!;
      await user.updateDisplayName(name);
      // use it as a role (0 => doctor and 1 => patient)
      await user.updatePhotoURL('1');
      emit(RegisterSuccessState());
      //3) store user data in firestore
      FirebaseFirestore.instance.collection('patients').doc(user.uid).set({
        'name': name,
        'image': '',
        'age': null,
        'email': email,
        'phone': '',
        'bio': '',
        'city': '',
        'uid': user.uid,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterErrorState(
          'كلمة المرور ضعيفة',
        ));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterErrorState(
          'الحساب موجود مسبقا',
        ));
      } else {
        emit(RegisterErrorState(
          'حدثت مشكلة في التسجيل ، حاول مرة اخرى',
        ));
      }
    }
  }

  // register as doctor
  registerDoctor(String name, String email, String password) async {
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = credential.user!;
      await user.updateDisplayName(name);
      await user.updatePhotoURL('0');

      // store in firestore
      FirebaseFirestore.instance.collection('doctors').doc(user.uid).set({
        'name': name,
        'image': '',
        'specialization': '',
        'rating': 3,
        'email': user.email,
        'phone1': '',
        'phone2': '',
        'bio': '',
        'openHour': '',
        'closeHour': '',
        'address': '',
        'uid': user.uid,
      });
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterErrorState('كلمة المرور ضعيفة'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterErrorState('الحساب موجود بالفعل'));
      } else {
        emit(RegisterErrorState('حدثت مشكلة فالتسجيل'));
      }
    }
  }

  // update doctor profile

  updateDoctorProfile(
      {required String uid,
      required String image,
      required String specialization,
      required String address,
      required String bio,
      required String phone1,
      required String phone2,
      required String openHour,
      required String closeHour}) {
    emit(UpdateDoctorProfileLoadingState());

    try {
      FirebaseFirestore.instance.collection('doctors').doc(uid).update({
        'image': image,
        'specialization': specialization,
        'phone1': phone1,
        'phone2': phone2,
        'bio': bio,
        'openHour': openHour,
        'closeHour': closeHour,
        'address': address,
      });
      emit(UpdateDoctorProfileSuccessState());
    } catch (e) {
      emit(UpdateDoctorProfileErrorState('حدثت مشكلة'));
    }
  }
}
