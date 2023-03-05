import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prevent_screen_recording/prevent_screen_recording.dart';
import 'package:video_downloder/base_module/presentation/components/custom_text_field.dart';

import 'package:video_downloder/home_module/presentation/feature/demo/screen/home_screen.dart';
import 'package:video_downloder/home_module/presentation/feature/demo/screen/theme_ button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? user;
  String verificationID = "";
  late PreventScreenRecording? screenRecordingCallBack;
  // final _db = FirebaseFirestore.instance;
  var verificationId = '';

  void preventScreenShot()async{
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }


  void preventScreenRecording() async{
    await initScreenRecordingCallback();
  }

  Future<void> initScreenRecordingCallback() async{
    screenRecordingCallBack = PreventScreenRecording();

    screenRecordingCallBack!.addListner(() {
      print("Updating status for recording...");

      setState(() {
        // text = "Screenrecording callback received";
      });
    });
  }
  void initState() {

    preventScreenShot();
    preventScreenRecording();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // Theme.of(context).primaryColor,
      // backgroundColor:  appTheme.isDark? Theme.of(context).scaffoldBackgroundColor:Theme.of(context).scaffoldBackgroundColor,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.40,
              ),

              CustomTextFiled(
                inputType: TextInputType.phone,
                text: 'Enter Phone',
                controller: phoneController,
                prefix: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text('+91'),
                ),
              ),
              const SizedBox(height:20 ,),

              Visibility(
                child: CustomTextFiled(
                  inputType: TextInputType.phone,
                  text: 'Enter Phone',
                  controller: otpController,
                ),
                visible: otpVisibility,
              ),
              const SizedBox(
                height: 10,
              ),

              MaterialButton(
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  if (otpVisibility) {
                    verifyOTP();
                  } else {
                    loginWithPhone();
                  }
                },
                child: Text(
                  otpVisibility ? "Verify" : "Login",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              

              const SizedBox(height: 10,),
              ThemeSwitcherButtons(

              ),


            ],
          ),
        ),
      ),
    );
  }



  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+91" + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
      (value) {
        setState(() {
          user = FirebaseAuth.instance.currentUser;
        });
      },
    ).whenComplete(
      () {
        if (user != null) {
          Fluttertoast.showToast(
            msg: "You are logged in successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(
                phone: phoneController.text,
              ),
            ),
          );
        } else {
          Fluttertoast.showToast(
            msg: "your login is failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
  }
}


