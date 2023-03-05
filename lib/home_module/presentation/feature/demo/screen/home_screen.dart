
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prevent_screen_recording/prevent_screen_recording.dart';
import 'package:video_downloder/base_module/domain/entity/app_theme_singleton.dart';
import 'package:video_downloder/base_module/presentation/core/values/app_assets.dart';
import 'package:video_downloder/base_module/presentation/core/values/app_constants.dart';
import 'package:video_downloder/home_module/presentation/components/arrow_button.dart';
import 'package:video_downloder/home_module/presentation/feature/demo/screen/test_button.dart';
import 'package:video_downloder/home_module/presentation/feature/demo/screen/theme_swicher.dart';
import 'package:video_downloder/user_module/presentation/feature/demo/screen/login_screen.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  final String ? phone;
  const HomeScreen({Key? key, this.phone}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FlickManager flickManager;
  late VideoPlayerController controller;
 late PreventScreenRecording? screenRecordingCallBack;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
 List<String>videoList =[
   "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
   "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
   "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
   // "https://drive.google.com/file/d/1PHkfq0Y_ricn9erBZp_D4pbL_xUzHWdt/view?usp=drivesdk",
   // "https://drive.google.com/file/d/1PHkfq0Y_ricn9erBZp_D4pbL_xUzHWdt/view?usp=drivesdk"

 ];


  String text = "Ready for recording";
  int i =0;


  @override
  void initState() {

    preventScreenShot();
    preventScreenRecording();
    // flickManager = FlickManager(
    //   videoPlayerController: VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')..addListener(() { }),
    //
    //
    // );

    loadVideoPlayer();
    super.initState();
  }
  FirebaseAuth auth = FirebaseAuth.instance;


  loadVideoPlayer() {
    flickManager = FlickManager(
        videoPlayerController:VideoPlayerController.network(videoList[i],
        videoPlayerOptions: VideoPlayerOptions(
          mixWithOthers: true,

        ))
    ..addListener(() {
      setState(() {
        // log("ui rebuilded");
      });
    })
      ..setVolume(1.0)
      ..setLooping(true)
      ..initialize().then((_) => setState(() {
        controller.play();
      })));
  }


  Future<void>signOut()async{
    await auth.signOut();
  }

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
        text = "Screenrecording callback received";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      key: _key,
      drawer: SizedBox(
        width: min(300, MediaQuery.of(context).size.width * 0.6),
        child: Drawer(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.30),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        ThemeAssets.profile
                      ),
                      fit: BoxFit.cover
                    )
                  ),
                ),

                  const SizedBox(
                    height: 20,
                  ),
                const Text("Phone",style: TextStyle(color: Colors.white)),
                  Text(widget.phone?? '',style: TextStyle(color: Colors.white)),
                  const SizedBox(
                    height: 20,
                  ),

                  InkWell(
                    onTap: (){
                      signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(

                          ),
                        ),
                      );
                    },
                    child: Text("LogOut",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
                  ),

                  // Text(widget.phone ?? '')
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
               mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  width: size.width,
                   height:size.height *0.30,
                  color: Colors.red,
          child:FlickVideoPlayer(
                    flickManager: flickManager
                )
                ),
                const SizedBox(height: AppConstants.defaultPadding,),
                SizedBox(
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         ArrowButton(
                          onTap:(){
                            if(i!=0 ){
                              setState(() {
                                i =i-1;
                              });
                              // test();
                            }


                            print(i);
                          },
                          child:
                             Icon(Icons.arrow_back_ios_rounded,
                               color: Theme.of(context).colorScheme.secondary,
                             )
                        ),
                       InkWell(
                         // onTap: ()async{
                         //   // Map<Permission, PermissionStatus> statuses = await [
                         //   // Permission.storage,
                         //   // //add more permission to request here.
                         //   // ].request();
                         // },

                       onTap: ()=> openFile(
                         url:videoList[i],
                         fileName:'video.mp4'
                       ),

                         child: Container(
                           height: 43,
                           padding: const EdgeInsets.symmetric(horizontal: 15,),
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(17),
                           color: Colors.white),
                           child: Center(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children:  [
                                Container(
                                  height: 20,width: 20,decoration: const BoxDecoration(

                                  image: DecorationImage(
                                    image: AssetImage(ThemeAssets.arrow_down)
                                  )
                                ), ),
                                 const SizedBox(width: AppConstants.defaultPadding/4,),
                                 const Text("Download",
                                 style: TextStyle(color: Colors.black)),
                               ],
                             ),
                           ),
                         ),
                       ),
                         ArrowButton(
                          onTap: (){
                          if(i<videoList.length-1 ){
                            setState(() {
                              i =i+1;
                            });
                            // test();
                          }
                          print(i);
                          print(videoList[i]);
                          },
                            child:
                            const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)
                        ),
                      ],
                    ),
                  ),
                ),


              ],
            ),
            Positioned(
             top: 20,
              left: 20,
              child: InkWell(
                onTap: (){
                  _key.currentState!.openDrawer();
                },
                child: Container(
                  width: 35,
                  height: 30,

                  decoration: const BoxDecoration(
                      // color: Colors.white,
                    image: DecorationImage(
                      image:AssetImage(ThemeAssets.menu),fit: BoxFit.cover
                    )
                  ),
                ),
              ),

            ),
        Positioned(
          top: 25,
          right: 20,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),

                image: const DecorationImage(
                    image:AssetImage(ThemeAssets.profile),fit: BoxFit.cover
                )
            ),
          ),),
          ],
        ),
      ),
    );
  }
  Future openFile({required String url, String ? fileName})async{
  final file =  await downloadFile(url, fileName!);
  if(file == null) return;
  print('Path:${file.path}');
  OpenFile.open(file.path);

  }

//download into private folder not visible to user
  Future<File?>downloadFile(String url, String name)async{
    final appSorage = await getApplicationDocumentsDirectory();
    final file = File('${appSorage.path}/$name');

    try {
      final response = await Dio().get(url, options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0));


      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    }catch(e){
      return null;
    }

  }

}
