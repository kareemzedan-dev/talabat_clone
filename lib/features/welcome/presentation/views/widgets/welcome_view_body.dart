import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/features/welcome/presentation/views/widgets/social_login_options.dart';
import 'package:video_player/video_player.dart';

class WelcomeViewBody extends StatefulWidget {
  const WelcomeViewBody({super.key});

  @override
  State<WelcomeViewBody> createState() => _WelcomeViewBodyState();
}

class _WelcomeViewBodyState extends State<WelcomeViewBody> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset("assets/videos/welcome_video.mp4")
      ..initialize().then((_) {
        setState(() {});
        controller.setLooping(true);
        controller.setVolume(0.0);
        controller.play();
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              children: [
                SizedBox.expand(
                  child:
                      controller.value.isInitialized
                          ? FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: controller.value.size.width,
                              height: controller.value.size.height,
                              child: VideoPlayer(controller),
                            ),
                          )
                          : Container(color: Colors.black),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
                      SizedBox(height: 10),
                      Transform.rotate(
                        angle: -0.1,
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            color: ColorsManager.primary,
                          ),
                          child: Image.asset(
                            Assets.assetsImagesTalabat,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 50),
          Text(
            "Log in or create an account",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 343,
            child: Text(
              'Receive rewards and save your details for a faster checkout\nexperience.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withValues(alpha: 0.85),
                fontSize: 12,

                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric( horizontal: 16.0),
            child: SocialLoginOptions(),
          ),
        ],
      ),
    );
  }
}
