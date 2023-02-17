import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:todoodev/app/ui/utils/colors.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              colors: [mainColor.withOpacity(.5), mainColor],
            ).createShader(rect);
          },
          child: Text(
            'TodooDev',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: mainColor,
              fontSize: 25,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MainPadding(
                child: Row(
                  children: [
                    ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          colors: [mainColor.withOpacity(.5), mainColor],
                        ).createShader(rect);
                      },
                      child: CircleAvatar(
                        radius: 25,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/logo.png"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ).animate().scaleXY(
                          begin: 0,
                          end: 1,
                        ),
                    const Gap(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Bonsoir').animate().slideX(
                              begin: 2,
                              end: 0,
                              duration: 500.ms,
                            ),
                        const Text(
                          'Max Anderson MOUMOUNI',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                            .animate()
                            .slideX(
                              begin: 1,
                              end: 0,
                              delay: 200.ms,
                              duration: 300.ms,
                            )
                            .then()
                            .shakeX(amount: 3),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(40),
              MainPadding(
                child: Obx(
                  () => AnimatedContainer(
                    duration: 100.ms,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: mainColor.withOpacity(.1),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.search),
                        hintText:
                            "Rechercher ${controller.searchOptIndex.value == 2 ? 'globalement' : controller.searchOpt[controller.searchOptIndex.value]}",
                        hintStyle: TextStyle(
                          color: fontColor.withOpacity(.3),
                        ),
                        suffixIcon: PopupMenuButton<int>(
                          icon: const Icon(Icons.more_horiz),
                          tooltip: "Recherche précise",
                          onSelected: (index) {
                            controller.searchOptIndex.value = index;
                          },
                          itemBuilder: (context) {
                            return List.generate(
                              controller.searchOpt.length,
                              (index) => PopupMenuItem<int>(
                                value: index,
                                child: Text(
                                  ".. ${controller.searchOpt[index]}",
                                  style: TextStyle(
                                    color:
                                        controller.searchOptIndex.value == index
                                            ? mainColor
                                            : fontColor.withOpacity(.8),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                      .animate()
                      .slideY(
                        begin: 1,
                        end: 0,
                        delay: 300.ms,
                        duration: 500.ms,
                      )
                      .fade(
                        begin: 0,
                        end: 1,
                        delay: 300.ms,
                        duration: 500.ms,
                      ),
                ),
              ),
              const Gap(30),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const Gap(12),
                    optionCard(
                      icon: Icons.archive_outlined,
                      text: "Archives",
                      color: mainColor,
                      onPressed: () {},
                    ),
                    optionCard(
                      icon: Icons.favorite_outline_rounded,
                      text: "Favoris",
                      color: const Color.fromARGB(255, 248, 38, 147),
                      onPressed: () {},
                      delay: 2,
                    ),
                    optionCard(
                      icon: Icons.collections_bookmark_outlined,
                      text: "Collection",
                      color: Colors.lightGreen,
                      onPressed: () {},
                      delay: 3,
                    ),
                    const Gap(10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: mainColor.withOpacity(.1),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.add, color: mainColor).defanim(4),
                    ).defanim(4),
                  ],
                ),
              ),
              const Gap(30),
              MainPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Projets en cours",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Icon(Icons.arrow_forward_rounded, color: mainColor),
                      ],
                    ),
                    const Gap(15),
                    ...List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ShaderMask(
                          shaderCallback: (rect) {
                            return LinearGradient(
                              colors: [
                                Colors.white,
                                mainColor.shade(90),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(rect);
                          },
                          child: ListTile(
                            onTap: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            tileColor: mainColor,
                            title: const Text(
                              "Application TodooDev",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              "${[
                                "Flutter",
                                "Favoris",
                                "Mobile",
                                "Design",
                              ][Random().nextInt(4)]} • ${index * 2 + (3 + (index ~/ 2))} tâches restantes",
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      )
                          .animate()
                          .fade(duration: (500 * index).ms)
                          .defanim(index + 1),
                    ),
                    const Gap(60),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget optionCard({
    required IconData icon,
    required String text,
    required onPressed,
    required Color color,
    int delay = 1,
  }) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Column(
          children: [
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  colors: [
                    mainColor.withOpacity(.2),
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(rect);
              },
              child: Icon(
                icon,
                color: color,
                size: 35,
              ),
            ),
            const Gap(5),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: color.shade(-100).withOpacity(.6),
              ),
            ),
          ],
        ),
      ),
    ).defanim(delay);
  }
}

class MainPadding extends StatelessWidget {
  final Widget? child;
  const MainPadding({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: child,
    );
  }
}
