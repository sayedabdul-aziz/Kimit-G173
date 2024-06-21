class AuthStates {}

class AuthInitial extends AuthStates {}

// login states
class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginErrorState extends AuthStates {
  final String error;

  LoginErrorState(this.error);
}

// register states
class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

class RegisterErrorState extends AuthStates {
  final String error;

  RegisterErrorState(this.error);
}

// UpdateDoctorProfile states
class UpdateDoctorProfileLoadingState extends AuthStates {}

class UpdateDoctorProfileSuccessState extends AuthStates {}

class UpdateDoctorProfileErrorState extends AuthStates {
  final String error;

  UpdateDoctorProfileErrorState(this.error);
}
