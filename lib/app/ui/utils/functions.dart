import 'package:flutter/material.dart';
import 'package:todoodev/app/ui/utils/colors.dart';
import 'package:gap/gap.dart';

double height(context) {
  return MediaQuery.of(context).size.height;
}

double width(context) {
  return MediaQuery.of(context).size.width;
}

/// Le logo de l'application
Widget appBrand() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        "App",
        style: TextStyle(color: Colors.white.withOpacity(.9), fontSize: 18),
      ),
      const Gap(1),
      Text(
        "Name",
        style: TextStyle(color: mainColor, fontSize: 18),
      ),
      const Gap(3),
      Text(
        "v1.0",
        style: TextStyle(color: mainColor, fontSize: 10),
      ),
    ],
  );
}

Widget borderedAvatar({required image}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: CircleAvatar(
      backgroundColor: mainColor,
      radius: 150,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: CircleAvatar(
          backgroundImage: image,
          backgroundColor: bgColor,
          radius: 100,
        ),
      ),
    ),
  );
}

Future<dynamic> customDialog(
  BuildContext context, {
  String title = "Information",
  required String content,
  String btnText = "Compris",
  Function()? onOKpressed,
  bool dismissible = true,
}) {
  return showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: height(context) / 3, horizontal: 20),
          child: SizedBox(
            child: Card(
              color: bgColor,
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: mainColor,
                    width: 2,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Spacer(flex: 2),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                        ),
                        const Spacer(),
                        if (dismissible)
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Center(
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white24,
                                ),
                              ),
                            ),
                          )
                        else
                          const Spacer(),
                      ],
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Text(
                              content,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white70
                                  // fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: onOKpressed ??
                          () {
                            Navigator.pop(context);
                          },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: width(context) / 100,
                        ),
                        child: Text(
                          btnText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
