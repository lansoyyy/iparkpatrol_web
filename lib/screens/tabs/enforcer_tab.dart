import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iparkpatrol_web/utlis/colors.dart';
import 'package:iparkpatrol_web/widgets/button_widget.dart';
import 'package:iparkpatrol_web/widgets/text_widget.dart';

import '../../widgets/textfield_widget.dart';

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

  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final mnameController = TextEditingController();
  final contactnumberController = TextEditingController();
  final purokController = TextEditingController();
  final brgyController = TextEditingController();
  final cityController = TextEditingController();
  final provinceController = TextEditingController();
  final monthController = TextEditingController();
  final dayController = TextEditingController();
  final yearController = TextEditingController();

  final birthplace = TextEditingController();
  final sex = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final id = TextEditingController();

  final name = TextEditingController();
  final address = TextEditingController();
  final bday = TextEditingController();

  bool inCreated = false;
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
          !inCreated
              ? Container(
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
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
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
                                onPressed: () {
                                  setState(() {
                                    inCreated = true;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              : Container(
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
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextWidget(
                                    text: 'Personal Information',
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    fontFamily: 'Bold',
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextFieldWidget(
                                      width: 200,
                                      label: 'First Name',
                                      controller: fnameController,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    TextFieldWidget(
                                      width: 80,
                                      label: 'M.I',
                                      controller: mnameController,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    TextFieldWidget(
                                      width: 200,
                                      label: 'Last Name',
                                      controller: lnameController,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextWidget(
                                    text: 'Home Address',
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    fontFamily: 'Bold',
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextFieldWidget(
                                      width: 175,
                                      label: 'Purok/Street/Zone',
                                      controller: purokController,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    TextFieldWidget(
                                      width: 175,
                                      label: 'Barangay',
                                      controller: brgyController,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextFieldWidget(
                                      width: 175,
                                      label: 'Municipality/City',
                                      controller: cityController,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    TextFieldWidget(
                                      width: 175,
                                      label: 'Province',
                                      controller: provinceController,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    TextFieldWidget(
                                      width: 100,
                                      label: 'Sex',
                                      controller: sex,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextWidget(
                                    text: 'Birthdate',
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    fontFamily: 'Bold',
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextFieldWidget(
                                      width: 125,
                                      label: 'Month',
                                      controller: monthController,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    TextFieldWidget(
                                      inputType: TextInputType.number,
                                      width: 85,
                                      label: 'Day',
                                      controller: dayController,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    TextFieldWidget(
                                      inputType: TextInputType.number,
                                      width: 125,
                                      label: 'Year',
                                      controller: yearController,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    TextFieldWidget(
                                      inputType: TextInputType.number,
                                      width: 250,
                                      label: 'Birthplace',
                                      controller: birthplace,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextWidget(
                                    text: 'Login Information',
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    fontFamily: 'Bold',
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextFieldWidget(
                                      width: 200,
                                      label: 'Email',
                                      controller: email,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    TextFieldWidget(
                                      isObscure: true,
                                      width: 200,
                                      label: 'Password',
                                      controller: password,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFieldWidget(
                                  width: 200,
                                  label: 'Enforcer ID Number',
                                  controller: id,
                                ),
                              ],
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
                                label: 'Submit',
                                onPressed: () {
                                  setState(() {
                                    inCreated = false;
                                  });
                                },
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
