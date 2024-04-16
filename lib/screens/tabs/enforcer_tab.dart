import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:iparkpatrol_web/services/add_enforcer.dart';
import 'package:iparkpatrol_web/utlis/colors.dart';
import 'package:iparkpatrol_web/widgets/button_widget.dart';
import 'package:iparkpatrol_web/widgets/text_widget.dart';
import 'package:iparkpatrol_web/widgets/toast_widget.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;
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
  final bloodtype = TextEditingController();
  final status = TextEditingController();

  bool inCreated = false;

  late String? imgUrl = '';

  uploadToStorage() {
    InputElement input = FileUploadInputElement() as InputElement
      ..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot =
            await fs.ref().child(DateTime.now().toString()).putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        showToast('Uploaded Succesfully');

        setState(() {
          imgUrl = downloadUrl;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Colors.grey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Manage Enforcer',
                    fontSize: 24,
                    fontFamily: 'Bold',
                    color: primary,
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  !inCreated
                      ? Container(
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton.icon(
                            onPressed: () {
                              setState(() {
                                inCreated = true;
                              });
                            },
                            icon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            label: TextWidget(
                              text: 'Register an Enforcer',
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: 'Bold',
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton.icon(
                            onPressed: () {
                              setState(() {
                                inCreated = false;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            label: TextWidget(
                              text: 'Back',
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: 'Bold',
                            ),
                          ),
                        ),
                  const SizedBox(
                    width: 20,
                  ),
                  !inCreated
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primary,
                                ),
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextFormField(
                                style: TextStyle(
                                    color: primary,
                                    fontFamily: 'Regular',
                                    fontSize: 14),
                                onChanged: (value) {
                                  setState(() {
                                    nameSearched = value;
                                  });
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelStyle: TextStyle(
                                      color: primary,
                                    ),
                                    hintText: 'Search Enforcer',
                                    hintStyle: TextStyle(
                                      fontFamily: 'QRegular',
                                      color: primary,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: primary,
                                    )),
                                controller: searchController,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              !inCreated
                  ? Container(
                      width: 1000,
                      height: 500,
                      decoration: const BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('Enforcers')
                                      .where('fname',
                                          isGreaterThanOrEqualTo:
                                              toBeginningOfSentenceCase(
                                                  nameSearched))
                                      .where('fname',
                                          isLessThan:
                                              '${toBeginningOfSentenceCase(nameSearched)}z')
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasError) {
                                      print('error');
                                      return const Center(child: Text('Error'));
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Padding(
                                        padding: EdgeInsets.only(top: 50),
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          color: Colors.black,
                                        )),
                                      );
                                    }

                                    final data = snapshot.requireData;
                                    return SizedBox(
                                      height: 475,
                                      child: GridView.builder(
                                        itemCount: data.docs.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4),
                                        itemBuilder: (context, index) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  CircleAvatar(
                                                    minRadius: 50,
                                                    maxRadius: 50,
                                                    child: Image.network(data
                                                        .docs[index]['img']),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: PopupMenuButton(
                                                      itemBuilder: (context) {
                                                        return [
                                                          PopupMenuItem(
                                                            onTap: () {
                                                              showInfoDialog(
                                                                  data.docs[
                                                                      index]);
                                                            },
                                                            child: TextWidget(
                                                              text: 'Edit info',
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          PopupMenuItem(
                                                            onTap: () async {
                                                              await FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'Enforcers')
                                                                  .doc(data
                                                                      .docs[
                                                                          index]
                                                                      .id)
                                                                  .delete();
                                                              showToast(
                                                                  'Enforcer deleted succesfully!');
                                                            },
                                                            child: TextWidget(
                                                              text:
                                                                  'Remove enforcer',
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ];
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              TextWidget(
                                                text:
                                                    '${data.docs[index]['name']}',
                                                fontSize: 24,
                                                color: primary,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    );
                                  }),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ))
                  : SizedBox(
                      width: 1000,
                      height: 550,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  imgUrl == ''
                                      ? Icon(
                                          Icons.account_circle,
                                          size: 150,
                                          color: primary,
                                        )
                                      : CircleAvatar(
                                          minRadius: 50,
                                          maxRadius: 50,
                                          child: Image.network(imgUrl!),
                                        ),
                                  TextButton(
                                    onPressed: () {
                                      uploadToStorage();
                                    },
                                    child: TextWidget(
                                      text: 'Change Profile Picture',
                                      fontSize: 14,
                                      color: primary,
                                      fontFamily: 'Bold',
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
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
                                        color: primary,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextFieldWidget(
                                          textColor: primary,
                                          width: 200,
                                          label: 'First Name',
                                          controller: fnameController,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        TextFieldWidget(
                                          textColor: primary,
                                          width: 80,
                                          label: 'M.I',
                                          controller: mnameController,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        TextFieldWidget(
                                          textColor: primary,
                                          width: 200,
                                          label: 'Last Name',
                                          controller: lnameController,
                                        ),
                                        const SizedBox(
                                          width: 100,
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
                                        color: primary,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextFieldWidget(
                                          textColor: primary,
                                          width: 175,
                                          label: 'Purok/Street/Zone',
                                          controller: purokController,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        TextFieldWidget(
                                          textColor: primary,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextFieldWidget(
                                          textColor: primary,
                                          width: 175,
                                          label: 'Municipality/City',
                                          controller: cityController,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        TextFieldWidget(
                                          textColor: primary,
                                          width: 175,
                                          label: 'Province',
                                          controller: provinceController,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        TextFieldWidget(
                                          textColor: primary,
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
                                        color: primary,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            dateFromPicker(context);
                                          },
                                          child: TextFieldWidget(
                                            isEnabled: false,
                                            textColor: primary,
                                            width: 125,
                                            label: 'Month',
                                            controller: monthController,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            dateFromPicker(context);
                                          },
                                          child: TextFieldWidget(
                                            isEnabled: false,
                                            textColor: primary,
                                            inputType: TextInputType.number,
                                            width: 85,
                                            label: 'Day',
                                            controller: dayController,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            dateFromPicker(context);
                                          },
                                          child: TextFieldWidget(
                                            isEnabled: false,
                                            textColor: primary,
                                            inputType: TextInputType.number,
                                            width: 125,
                                            label: 'Year',
                                            controller: yearController,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        TextFieldWidget(
                                          textColor: primary,
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
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
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
                                        color: primary,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextFieldWidget(
                                          textColor: primary,
                                          width: 200,
                                          label: 'Email',
                                          controller: email,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        TextFieldWidget(
                                          textColor: primary,
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
                                      textColor: primary,
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
                                      register(context);
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
        ),
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
        yearController.text = formattedDate.split('-')[0];
        monthController.text = formattedDate.split('-')[1];
        dayController.text = formattedDate.split('-')[2];
      });
    } else {
      return null;
    }
  }

  register(context) async {
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      // signup(nameController.text, numberController.text, addressController.text,
      //     emailController.text);

      addEnforcer(
          user.user!.uid,
          fnameController.text,
          mnameController.text,
          lnameController.text,
          purokController.text,
          brgyController.text,
          cityController.text,
          provinceController.text,
          sex.text,
          monthController.text,
          dayController.text,
          yearController.text,
          birthplace.text,
          email.text,
          id.text,
          imgUrl);

      showToast("Registered Successfully!");

      setState(() {
        inCreated = false;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        showToast('The email address is not valid.');
      } else {
        showToast(e.toString());
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }

  showInfoDialog(data) {
    setState(() {
      name.text = data['name'];
      address.text = data['address'];
      monthController.text = data['birthdate'];
      sex.text = data['sex'];
    });
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            height: 500,
            width: 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  color: primary,
                  size: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFieldWidget(
                      width: 250,
                      textColor: Colors.black,
                      controller: name,
                      label: 'Name',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextFieldWidget(
                      width: 250,
                      textColor: Colors.black,
                      controller: address,
                      label: 'Address',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFieldWidget(
                              width: 150,
                              textColor: Colors.black,
                              controller: monthController,
                              label: 'Birthdate',
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            TextFieldWidget(
                              width: 150,
                              textColor: Colors.black,
                              controller: sex,
                              label: 'Sex',
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 250,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: primary,
                        ),
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: 'Documents',
                              fontSize: 14,
                              color: primary,
                              fontFamily: 'Bold',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 225,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: primary,
                                ),
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 225,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: primary,
                                ),
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                ButtonWidget(
                  width: 150,
                  color: primary,
                  fontSize: 14,
                  label: 'Apply Changes',
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('Enforcers')
                        .doc(data.id)
                        .update({
                      'name': name.text,
                      'address': address.text,
                      'birthdate': monthController.text,
                      'sex': sex.text
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
