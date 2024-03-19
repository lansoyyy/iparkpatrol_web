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
                                style: const TextStyle(
                                  fontFamily: 'Regular',
                                  fontSize: 14,
                                  color: Colors.white,
                                ),

                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.calendar_month_outlined,
                                    color: Colors.white,
                                  ),
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Regular',
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                  hintText: dateController.text,
                                  border: InputBorder.none,
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
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
                      const SizedBox(
                        height: 20,
                      ),
                      DataTable(columns: [
                        DataColumn(
                          label: TextWidget(
                            text: '#',
                            fontSize: 18,
                            fontFamily: 'Bold',
                            color: Colors.white,
                          ),
                        ),
                        DataColumn(
                          label: TextWidget(
                            text: 'Ticket ID',
                            fontSize: 18,
                            fontFamily: 'Bold',
                            color: Colors.white,
                          ),
                        ),
                        DataColumn(
                          label: TextWidget(
                            text: 'Date',
                            fontSize: 18,
                            fontFamily: 'Bold',
                            color: Colors.white,
                          ),
                        ),
                        DataColumn(
                          label: TextWidget(
                            text: 'Option',
                            fontSize: 18,
                            fontFamily: 'Bold',
                            color: Colors.white,
                          ),
                        ),
                      ], rows: [
                        for (int i = 0; i < 50; i++)
                          DataRow(cells: [
                            DataCell(
                              TextWidget(
                                text: '${i + 1}',
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            DataCell(
                              TextWidget(
                                text: DateFormat('hh:mm a')
                                    .format(DateTime.now()),
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            DataCell(
                              TextWidget(
                                text: DateFormat('yyyy-MM-dd')
                                    .format(DateTime.now()),
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            DataCell(TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 30, 20, 20),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 650,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: primary),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 20, 20, 20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Center(
                                                        child: TextWidget(
                                                          text:
                                                              'Illegal Parking Citation Ticket',
                                                          fontSize: 18,
                                                          color: Colors.black,
                                                          fontFamily: 'Bold',
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      TextWidget(
                                                        text:
                                                            'Date: January 5, 2024',
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                        fontFamily: 'Medium',
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      TextWidget(
                                                        text:
                                                            'Time: 12:00 P.M.',
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                        fontFamily: 'Medium',
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      TextWidget(
                                                        text:
                                                            'Citation Ticket Number: 2024-01-001',
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                        fontFamily: 'Medium',
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      rowData('Name',
                                                          'Sample data'),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      rowData('Address',
                                                          'Sample data'),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      rowData('Gender',
                                                          'Sample data'),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      rowData(
                                                          'Drivers License Number',
                                                          'Sample data'),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      rowData('Expiry',
                                                          'Sample data'),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      rowData('Nationality',
                                                          'Sample data'),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      rowData('Height',
                                                          'Sample data'),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      rowData('Weight',
                                                          'Sample data'),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      rowData('Restriction',
                                                          'Sample data'),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      rowData('Plate No.',
                                                          'Sample data'),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      rowData('Maker',
                                                          'Sample data'),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      rowData('Color',
                                                          'Sample data'),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      rowData('Model',
                                                          'Sample data'),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      rowData('Marking',
                                                          'Sample data'),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            TextWidget(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              text:
                                                                  'Mark Lister Nalupa',
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            TextWidget(
                                                              text:
                                                                  'Traffic Enforcer on Case',
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'Bold',
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              'assets/images/logo.png',
                                                              height: 75,
                                                            ),
                                                            Image.asset(
                                                              'assets/images/RTA logo 1.png',
                                                              height: 75,
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
                                color: Colors.white,
                              ),
                            )),
                          ])
                      ])
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
