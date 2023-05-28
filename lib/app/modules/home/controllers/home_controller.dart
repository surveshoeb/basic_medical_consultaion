import 'package:get/get.dart';
import 'package:medical_consultation/app/data/doctor_data.dart';
import 'package:medical_consultation/app/data/user_data.dart';

class HomeController extends GetxController {
  final Rx<UserData> _loggedInUserData = Rx(
    UserData(
      profileImageURL: 'https://i.pravatar.cc/150?img=11',
      userName: 'Luke',
    ),
  );
  UserData get loggedInUserData => _loggedInUserData.value;

  final RxList<DoctorData> _listOfDoctors = RxList(
    [
      DoctorData(
        docName: 'dr. Kabuto Yakushi',
        profileImageURL: 'https://i.pravatar.cc/150?img=11',
        description: 'Heart Specialist',
        rating: 4.8,
        review: 127,
      ),
      DoctorData(
        docName: 'dr. Kabuto Yakushi',
        profileImageURL: 'https://i.pravatar.cc/150?img=11',
        description: 'Heart Specialist',
        rating: 4.8,
        review: 127,
      ),
    ],
  );
  List<DoctorData> get listOfDoctors => _listOfDoctors;
}
