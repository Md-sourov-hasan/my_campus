import 'package:get/get.dart';
import 'package:task/core/data/mock_data.dart';

/// Profile controller — manages user profile data display.
class ProfileController extends GetxController {
  final RxBool isEditing = false.obs;

  Map<String, dynamic> get user => MockData.studentUser;

  void toggleEditing() {
    isEditing.value = !isEditing.value;
  }
}
