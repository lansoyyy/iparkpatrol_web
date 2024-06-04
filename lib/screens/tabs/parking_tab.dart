import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iparkpatrol_web/utlis/colors.dart';
import 'package:iparkpatrol_web/widgets/text_widget.dart';

class ParkingTab extends StatefulWidget {
  const ParkingTab({super.key});

  @override
  State<ParkingTab> createState() => _ParkingTabState();
}

class _ParkingTabState extends State<ParkingTab> {
  final dateController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Illegal Parking History',
                    fontSize: 24,
                    fontFamily: 'Bold',
                    color: primary,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: GestureDetector(
                        onTap: () {
                          dateFromPicker(context);
                        },
                        child: SizedBox(
                          width: 325,
                          height: 50,
                          child: TextFormField(
                            enabled: false,
                            style: TextStyle(
                              fontFamily: 'Regular',
                              fontSize: 14,
                              color: primary,
                            ),

                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.calendar_month_outlined,
                                color: primary,
                              ),
                              hintStyle: const TextStyle(
                                fontFamily: 'Regular',
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              hintText: dateController.text,
                              border: InputBorder.none,
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primary,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primary,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primary,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              errorStyle: const TextStyle(
                                  fontFamily: 'Bold', fontSize: 12),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),

                            controller: dateController,
                            // Pass the validator to the TextFormField
                          ),
                        ),
                      ),
                    ),
                  ),
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
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('illegal_parking')
                      .where('status', isEqualTo: 'Resolved')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return const Center(child: Text('Error'));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Center(
                            child: CircularProgressIndicator(
                          color: Colors.black,
                        )),
                      );
                    }

                    final data = snapshot.requireData;
                    return Container(
                        width: 1000,
                        height: 525,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Column(
                              children: [
                                DataTable(columnSpacing: 100, columns: [
                                  DataColumn(
                                    label: TextWidget(
                                      text: '#',
                                      fontSize: 18,
                                      fontFamily: 'Bold',
                                      color: primary,
                                    ),
                                  ),
                                  DataColumn(
                                    label: TextWidget(
                                      text: 'Time',
                                      fontSize: 18,
                                      fontFamily: 'Bold',
                                      color: primary,
                                    ),
                                  ),
                                  DataColumn(
                                    label: TextWidget(
                                      text: 'Date',
                                      fontSize: 18,
                                      fontFamily: 'Bold',
                                      color: primary,
                                    ),
                                  ),
                                  DataColumn(
                                    label: TextWidget(
                                      text: 'NPS Area',
                                      fontSize: 18,
                                      fontFamily: 'Bold',
                                      color: primary,
                                    ),
                                  ),
                                  DataColumn(
                                    label: TextWidget(
                                      text: 'Option',
                                      fontSize: 18,
                                      fontFamily: 'Bold',
                                      color: primary,
                                    ),
                                  ),
                                ], rows: [
                                  for (int i = 0; i < data.docs.length; i++)
                                    DataRow(cells: [
                                      DataCell(
                                        TextWidget(
                                          text: '2024-${i + 1}',
                                          fontSize: 14,
                                          color: primary,
                                        ),
                                      ),
                                      DataCell(
                                        TextWidget(
                                          text: DateFormat('hh:mm a').format(
                                              DateTime.parse(data.docs[i].id
                                                  .split('_')[0])),
                                          fontSize: 14,
                                          fontFamily: 'Bold',
                                          color: primary,
                                        ),
                                      ),
                                      DataCell(
                                        TextWidget(
                                          text: DateFormat('MMMM dd, yyyy')
                                              .format(DateTime.parse(data
                                                  .docs[i].id
                                                  .split('_')[0])),
                                          fontSize: 14,
                                          fontFamily: 'Bold',
                                          color: primary,
                                        ),
                                      ),
                                      DataCell(
                                        TextWidget(
                                          text:
                                              '${data.docs[i]['location']} - ${data.docs[i]['title_of_violation']}',
                                          fontSize: 14,
                                          color: primary,
                                          fontFamily: 'Bold',
                                        ),
                                      ),
                                      DataCell(TextButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Container(
                                                  width: 750,
                                                  height: 400,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          data.docs[i]
                                                              ['image_url'],
                                                        ),
                                                        fit: BoxFit.cover),
                                                  ),
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
                                        child: TextWidget(
                                          text: 'View Image',
                                          decoration: TextDecoration.underline,
                                          fontSize: 14,
                                          color: primary,
                                          fontFamily: 'Bold',
                                        ),
                                      )),
                                    ])
                                ])
                              ],
                            ),
                          ),
                        ));
                  })
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
      });
    } else {
      return null;
    }
  }
}
