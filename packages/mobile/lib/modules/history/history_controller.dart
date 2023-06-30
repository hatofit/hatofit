import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Workout {
  final String name;
  final String date;

  Workout({
    required this.name,
    required this.date,
  });
}

class HistoryController extends GetxController {
  final _connectGetX = GetConnect();
  final String title = 'History';
  final RxList<Workout> workouts = <Workout>[].obs;
  late DateFormat formatter;
  DateTime now = DateTime.now();
  Response<dynamic> response = const Response<dynamic>();

  Future<void> postSession() async {
    Response<dynamic> postRes = await _connectGetX.post(
      'https://127.0.0.1/api/session',
      {
        "exerciseId": "test123",
        "startTime": 0000054455,
        "endTime": 0000054455032,
        "timelines": [
          {"name": "instruction_1", "startTime": 1686913335015},
          {"name": "rest_1", "startTime": 1686913341097}
        ],
        "data": [
          {
            "second": 0,
            "timeStamp": 1686913335064,
            "devices": [
              {
                "type": "PolarDataType.hr",
                "identifier": "BBADFE28",
                "value": [
                  {
                    "hr": 92,
                    "rrsMs": [648]
                  }
                ]
              }
            ]
          },
          {
            "second": 1,
            "timeStamp": 1686913336106,
            "devices": [
              {
                "type": "PolarDataType.hr",
                "identifier": "BBADFE28",
                "value": [
                  {
                    "hr": 93,
                    "rrsMs": [660, 644]
                  }
                ]
              }
            ]
          },
          {
            "second": 2,
            "timeStamp": 1686913337097,
            "devices": [
              {
                "type": "PolarDataType.hr",
                "identifier": "BBADFE28",
                "value": [
                  {
                    "hr": 92,
                    "rrsMs": [630]
                  }
                ]
              }
            ]
          },
          {
            "second": 3,
            "timeStamp": 1686913338097,
            "devices": [
              {
                "type": "PolarDataType.hr",
                "identifier": "BBADFE28",
                "value": [
                  {
                    "hr": 93,
                    "rrsMs": [627, 640]
                  }
                ]
              }
            ]
          },
          {
            "second": 4,
            "timeStamp": 1686913339097,
            "devices": [
              {
                "type": "PolarDataType.hr",
                "identifier": "BBADFE28",
                "value": [
                  {
                    "hr": 93,
                    "rrsMs": [647]
                  }
                ]
              }
            ]
          }
        ]
      },
    );
    print(postRes.body);
    print(postRes.statusCode);
  }

  Future<void> _sendGetRequest() async {
    response =
        await _connectGetX.get('https://polar.viandwi24.site/api/exercise');
    isToday();
    parseData();
  }

  void isToday() {
    DateTime date = DateTime.parse(response.body['exercises'][0]['createdAt']);
    if (now.year == date.year &&
        now.month == date.month &&
        now.day == date.day) {
      formatter = DateFormat('HH:mm:ss');
    } else {
      formatter = DateFormat('yyyy-MM-dd ');
    }
  }

  void parseData() {
    int length = response.body['exercises'].length;
    for (int i = 0; i < length; i++) {
      DateTime dateTime =
          DateTime.parse(response.body['exercises'][i]['createdAt']);
      String formattedDate = formatter.format(dateTime);
      workouts.add(
        Workout(
          name: response.body['exercises'][i]['name'],
          date: formattedDate,
        ),
      );
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await _sendGetRequest();
  }

  @override
  void onClose() {
    _connectGetX.dispose();
    super.onClose();
  }
}
