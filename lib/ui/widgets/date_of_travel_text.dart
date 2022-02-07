import 'package:flutter/material.dart';
// if startdate==enddate => show only startdate. Else => both
class DateText extends StatelessWidget {
  final String startDate;
  final String endDate;
  const DateText({Key? key,required this.startDate, required this.endDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (startDate!=endDate){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const Text('Дата мероприятия:',
          //   style: TextStyle(color: Colors.black,
          //       fontSize: 12),
          // ),
          Text('с $startDate',
          style: const TextStyle(color: Colors.black,
              fontSize: 16),
          ),
          Text('по $endDate',
            style: const TextStyle(color: Colors.black,
                fontSize: 16),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         /* const Text('Дата мероприятия:',
            style: TextStyle(color: Colors.black,
                fontSize: 12),
          ),*/
          Text(startDate,
            style: const TextStyle(color: Colors.black,
                fontSize: 18),
          ),
        ],
      );
    }
  }
}
