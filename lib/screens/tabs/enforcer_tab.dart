import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iparkpatrol_web/utlis/colors.dart';
import 'package:iparkpatrol_web/widgets/button_widget.dart';
import 'package:iparkpatrol_web/widgets/text_widget.dart';

class EnforcerTab extends StatefulWidget {
  const EnforcerTab({super.key});

  @override
  State<EnforcerTab> createState() => _EnforcerTabState();
}

class _EnforcerTabState extends State<EnforcerTab> {
  final dateController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));

  final searchController = TextEditingController();
  String nameSearched = '';
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
            text: 'Illegal Parking History',
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
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Regular',
                                  fontSize: 14),
                              onChanged: (value) {
                                setState(() {
                                  nameSearched = value;
                                });
                              },
                              decoration: const InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  hintText: 'Search Enforcer',
                                  hintStyle: TextStyle(
                                      fontFamily: 'QRegular',
                                      color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  )),
                              controller: searchController,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 350,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.account_circle,
                                  color: Colors.white,
                                  size: 150,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextWidget(
                                  text: 'John Doe',
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ButtonWidget(
                            color: Colors.blue,
                            width: 200,
                            fontSize: 12,
                            label: 'Register a new enforcer',
                            onPressed: () {},
                          ),
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

  void dateFromPicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: primary,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      setState(() {
        dateController.text = formattedDate;
      });
    } else {
      return null;
    }
  }
}
