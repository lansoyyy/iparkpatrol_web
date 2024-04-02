import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addEnforcer(id, fname, mi, lname, purok, brgy, city, province, sex,
    month, day, year, birthplace, email, idnumber, img) async {
  final docUser = FirebaseFirestore.instance.collection('Enforcers').doc(id);

  final json = {
    'fname': fname,
    'mi': mi,
    'lname': lname,
    'purok': purok,
    'brgy': brgy,
    'city': city,
    'province': province,
    'sex': sex,
    'month': month,
    'day': day,
    'year': year,
    'birthplace': birthplace,
    'email': email,
    'idnumber': idnumber,
    'id': docUser.id,
    'img': img,
    'name': '$fname $mi $lname',
    'address': '$purok $brgy $city $province',
    'birthdate': '$day/$month/$year',
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}
