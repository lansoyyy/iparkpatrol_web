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
                            text: 'Time',
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
                              child: TextWidget(
                                text: 'View Image',
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
}
