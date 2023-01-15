// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignUpWithEmailAndPasswordFailure {
  final String massage;
  SignUpWithEmailAndPasswordFailure([
    this.massage = "An Unknown error occured",
  ]);
  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'week-password':
        return SignUpWithEmailAndPasswordFailure(
            'Please enter a stronger password');
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted');
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure(
            'An account already exixts for this email');
      case 'operation-not-allowd':
        return SignUpWithEmailAndPasswordFailure(
            'operation is not allowed, please contact support.');
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure(
            'This user has been disabled, please contact support for help');
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
