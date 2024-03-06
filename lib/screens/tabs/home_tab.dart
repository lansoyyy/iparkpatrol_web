import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iparkpatrol_web/utlis/colors.dart';
import 'package:iparkpatrol_web/widgets/text_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextWidget(
            text: 'Home',
            fontSize: 24,
            fontFamily: 'Bold',
            color: primary,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              width: 1000,
              height: 550,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primary,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Container(
                                              width: 750,
                                              height: 400,
                                              color: Colors.grey,
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: TextWidget(
                                                  text: 'Close',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 500,
                                      height: 250,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text: DateFormat('hh:mm a')
                                              .format(DateTime.now()),
                                          fontSize: 14,
                                          fontFamily: 'Bold',
                                          color: Colors.white,
                                        ),
                                        TextWidget(
                                          text: DateFormat('MMMM dd, yyyy')
                                              .format(DateTime.now()),
                                          fontSize: 16,
                                          fontFamily: 'Bold',
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextWidget(
                                          text: 'Divisoria No Parking Area',
                                          fontSize: 18,
                                          fontFamily: 'Medium',
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
