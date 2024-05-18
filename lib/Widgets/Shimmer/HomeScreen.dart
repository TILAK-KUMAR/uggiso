import 'package:flutter/material.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:fade_shimmer/fade_shimmer.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final delay = 30;

    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FadeShimmer(
                        height: MediaQuery.of(context).size.height*0.1,
                        width: MediaQuery.of(context).size.width*0.3,
                        radius: 4,
                        millisecondsDelay: delay,
                        fadeTheme:FadeTheme.light,
                    ),
                    FadeShimmer(
                        height: MediaQuery.of(context).size.height*0.1,
                        width: MediaQuery.of(context).size.width*0.3,
                        radius: 4,
                        millisecondsDelay: delay,
                        fadeTheme:FadeTheme.light
                    ),
                    FadeShimmer(
                        height: MediaQuery.of(context).size.height*0.1,
                        width: MediaQuery.of(context).size.width*0.3,
                        radius: 4,
                        millisecondsDelay: delay,
                        fadeTheme:FadeTheme.light
                    ),
                  ],
                ),
                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FadeShimmer(
                        height: MediaQuery.of(context).size.height*0.1,
                        width: MediaQuery.of(context).size.width*0.2,
                        radius: 80,
                        millisecondsDelay: delay,
                        fadeTheme:FadeTheme.light
                    ),
                    FadeShimmer(
                        height: MediaQuery.of(context).size.height*0.1,
                        width: MediaQuery.of(context).size.width*0.2,
                        radius: 80,
                        millisecondsDelay: delay,
                        fadeTheme:FadeTheme.light
                    ),
                    FadeShimmer(
                        height: MediaQuery.of(context).size.height*0.1,
                        width: MediaQuery.of(context).size.width*0.2,
                        radius: 80,
                        millisecondsDelay: delay,
                        fadeTheme:FadeTheme.light
                    ),
                    FadeShimmer(
                        height: MediaQuery.of(context).size.height*0.1,
                        width: MediaQuery.of(context).size.width*0.2,
                        radius: 80,
                        millisecondsDelay: delay,
                        fadeTheme:FadeTheme.light
                    ),
                  ],
                ),
                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeShimmer(
                        height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width*0.45,
                        radius: 4,
                        millisecondsDelay: delay,
                        fadeTheme:FadeTheme.light
                    ),
                    FadeShimmer(
                        height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width*0.45,
                        radius: 4,
                        millisecondsDelay: delay,
                        fadeTheme:FadeTheme.light
                    ),
                  ],
                ),
                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeShimmer(
                        height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width*0.45,
                        radius: 4,
                        millisecondsDelay: delay,
                        fadeTheme:FadeTheme.light
                    ),
                    FadeShimmer(
                        height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width*0.45,
                        radius: 4,
                        millisecondsDelay: delay,
                        fadeTheme:FadeTheme.light
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}
