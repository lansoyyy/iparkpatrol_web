import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iparkpatrol_web/utlis/colors.dart';
import 'package:iparkpatrol_web/widgets/text_widget.dart';

class TicketsTab extends StatefulWidget {
  const TicketsTab({super.key});

  @override
  State<TicketsTab> createState() => _TicketsTabState();
}

class _TicketsTabState extends State<TicketsTab> {
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
              TextWidget(
                text: 'Illegal Parking History',
                fontSize: 24,
                fontFamily: 'Bold',
                color: primary,
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
                        height: 550,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
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
                                            suffixIcon: const Icon(
                                              Icons.calendar_month_outlined,
                                              color: Colors.white,
                                            ),
                                            hintStyle: TextStyle(
                                              fontFamily: 'Regular',
                                              fontSize: 14,
                                              color: primary,
                                            ),
                                            hintText: dateController.text,
                                            border: InputBorder.none,
                                            disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: primary,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: primary,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: primary,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            errorStyle: const TextStyle(
                                                fontFamily: 'Bold',
                                                fontSize: 12),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),

                                          controller: dateController,
                                          // Pass the validator to the TextFormField
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataTable(columnSpacing: 50, columns: [
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
                                      text: 'NPS',
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
                                      text: 'Status',
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
                                          text: '${i + 1}',
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
                                          text:
                                              'NPS-${data.docs[i]['location']}',
                                          fontSize: 14,
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
                                          text: data.docs[i]['status'],
                                          fontSize: 14,
                                          color: primary,
                                        ),
                                      ),
                                      DataCell(TextButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 30, 20, 20),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 650,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color: primary),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .fromLTRB(
                                                                    20,
                                                                    20,
                                                                    20,
                                                                    20),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Center(
                                                                  child:
                                                                      TextWidget(
                                                                    text:
                                                                        'Illegal Parking Citation Ticket',
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .black,
                                                                    fontFamily:
                                                                        'Bold',
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                TextWidget(
                                                                  text:
                                                                      'Date: ${DateFormat('MMMM dd, yyyy').format(DateTime.parse(data.docs[i].id.split('_')[0]))}',
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      'Medium',
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                TextWidget(
                                                                  text:
                                                                      'Time: ${DateFormat('hh:mm a').format(DateTime.parse(data.docs[i].id.split('_')[0]))}',
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      'Medium',
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                rowData(
                                                                    'Name',
                                                                    data.docs[i]
                                                                        [
                                                                        'name']),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                rowData(
                                                                    'Address',
                                                                    data.docs[i]
                                                                        [
                                                                        'address']),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                rowData(
                                                                    'Gender',
                                                                    data.docs[i]
                                                                        [
                                                                        'gender']),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                rowData(
                                                                    'Drivers License Number',
                                                                    data.docs[i]
                                                                        [
                                                                        'licensenumber']),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                rowData(
                                                                    'Expiry',
                                                                    data.docs[i]
                                                                        [
                                                                        'expiry']),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                rowData(
                                                                    'Nationality',
                                                                    data.docs[i]
                                                                        [
                                                                        'nationality']),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                rowData(
                                                                    'Height',
                                                                    data.docs[i]
                                                                        [
                                                                        'height']),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                rowData(
                                                                    'Weight',
                                                                    data.docs[i]
                                                                        [
                                                                        'weight']),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                rowData(
                                                                    'Restriction',
                                                                    data.docs[i]
                                                                        [
                                                                        'restriction']),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                rowData(
                                                                    'Plate No.',
                                                                    data.docs[i]
                                                                        [
                                                                        'platenumber']),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                rowData(
                                                                    'Maker',
                                                                    data.docs[i]
                                                                        [
                                                                        'make']),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                rowData(
                                                                    'Color',
                                                                    data.docs[i]
                                                                        [
                                                                        'color']),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                rowData(
                                                                    'Model',
                                                                    data.docs[i]
                                                                        [
                                                                        'model']),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                rowData(
                                                                    'Marking',
                                                                    data.docs[i]
                                                                        [
                                                                        'marking']),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                // Align(
                                                                //   alignment:
                                                                //       Alignment
                                                                //           .bottomRight,
                                                                //   child: Column(
                                                                //     mainAxisAlignment:
                                                                //         MainAxisAlignment
                                                                //             .center,
                                                                //     crossAxisAlignment:
                                                                //         CrossAxisAlignment
                                                                //             .center,
                                                                //     children: [
                                                                //       TextWidget(
                                                                //         decoration:
                                                                //             TextDecoration.underline,
                                                                //         text:
                                                                //             'Mark Lister Nalupa',
                                                                //         fontSize:
                                                                //             14,
                                                                //         color: Colors
                                                                //             .black,
                                                                //       ),
                                                                //       TextWidget(
                                                                //         text:
                                                                //             'Traffic Enforcer on Case',
                                                                //         fontSize:
                                                                //             14,
                                                                //         color: Colors
                                                                //             .black,
                                                                //         fontFamily:
                                                                //             'Bold',
                                                                //       ),
                                                                //     ],
                                                                //   ),
                                                                // ),
                                                                // const SizedBox(
                                                                //   height: 10,
                                                                // ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomLeft,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        'assets/images/logo.png',
                                                                        height:
                                                                            75,
                                                                      ),
                                                                      Image
                                                                          .asset(
                                                                        'assets/images/RTA logo 1.png',
                                                                        height:
                                                                            75,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
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
                                          text: 'View Ticket',
                                          decoration: TextDecoration.underline,
                                          fontSize: 14,
                                          color: primary,
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

  rowData(String label, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextWidget(
          text: '$label:',
          fontSize: 12,
          color: Colors.black,
          fontFamily: 'Bold',
        ),
        const SizedBox(
          width: 10,
        ),
        TextWidget(
          decoration: TextDecoration.underline,
          text: data,
          fontSize: 12,
          color: Colors.black,
          fontFamily: 'Bold',
        ),
      ],
    );
  }
}
