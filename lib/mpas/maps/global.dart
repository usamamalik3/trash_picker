import 'package:firebase_auth/firebase_auth.dart';
import 'package:trash_picker/UsersInfo/user_model.dart';



final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
UserModel? userModelCurrentInfo;
