import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {


  static const String availabilityBASEURL = 'https://rails.makemytrip.com/pwa/mobile/enquiry/availability';
  static const String livestationBASEURL = 'https://mapi.makemytrip.com/api/rails/train/livestation/v1';
  static const String traincitylivestationBASEURL = 'https://www.makemytrip.com/pwa-hlp/getRailsCity?city=';
  static const String trainlivestatusBASEURL = 'https://railsinfo-services.makemytrip.com/api/rails/train/livestatus/v2';
  static const String trainpnrstatusBASEURL = 'https://railsinfo-services.makemytrip.com/api/rails/pnr/currentstatus/v1';
  static const String trainbookBASEURL = 'https://www.makemytrip.com/pwa-hlp/getRailsCity?city=';
  static const String livetrainstatuslistBASEURL = 'https://travel.paytm.com/api/trains-search/v1/train/';
  static const String trainroutelistBASEURL = 'https://rails.makemytrip.com/pwa/mobile/searchWithAvailAndRecommendation/';
  static const String trainscheduleBASEURL = 'https://mapi.makemytrip.com/api/rails/train/schedule/v1';
  static const String trainschedulelistBASEURL = 'https://travel.paytm.com/api/trains-search/v1/train/';
  static const String searchStationBASEURL = 'https://travel.paytm.com/api/trains/v3/station/';



  Future<dynamic> availabilityAPI({
    required String reservationChoice,
    required String source,
    required String destination,
    required String className,
    required String quota,
    required String doj,
    required String trainNumber,
    required bool moreThanOneDay,
  }) async {
    final response = await http.post(
      Uri.parse(availabilityBASEURL),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: {
        "reservationChoice": reservationChoice,
        "source": source,
        "destination": destination,
        "class": className,
        "quota": quota,
        "doj": doj,
        "trainNumber": trainNumber,
        "moreThanOneDay": moreThanOneDay
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to send POST request. Status code: ${response.statusCode}');
    }
  }



  Future<dynamic> livestationAPI({
    required String sourceStationCode,
    required String destinationStationCode,
    required String channelCode,
    required String affiliateCode,
  }) async {
    final response = await http.post(
      Uri.parse(livestationBASEURL),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: {
        "sourceStationCode": sourceStationCode,
        "destinationStationCode": destinationStationCode,
        "trackingParams": {"channelCode": channelCode, "affiliateCode": affiliateCode}
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to send POST request. Status code: ${response.statusCode}');
    }
  }




  Future<dynamic> traincitylivestationAPI(String endpoint) async {
    final response =
        await http.get(Uri.parse('$traincitylivestationBASEURL$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }



  Future<dynamic> trainlivestatusAPI({
    required String dateOfJourney,
    required String stationCode,
    required String channelCode,
    required String affiliateCode,
    required String trainNumber,
  }) async {
    final response = await http.post(
      Uri.parse(trainlivestatusBASEURL),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: {
        "dateOfJourney": dateOfJourney,
        "stationCode": stationCode,
        "trackingParams": {
          "affiliateCode": affiliateCode,
          "channelCode": channelCode
        },
        "trainNumber": trainNumber
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to send POST request. Status code: ${response.statusCode}');
    }
  }



  Future<dynamic> trainpnrstatusAPI({
    required String pnrID,
    required String channelCode,
    required String affiliateCode,
  }) async {
    final response = await http.post(
      Uri.parse(trainpnrstatusBASEURL),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: {
        "pnrID": pnrID,
        "trackingParams": {
          "channelCode": channelCode,
          "affiliateCode": affiliateCode
        }
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {


      throw Exception(
          'Failed to send POST request. Status code: ${response.statusCode}');
    }
  }



  Future<dynamic> trainbookAPI(String endpoint) async {
    final response =
    await http.get(Uri.parse('$trainbookBASEURL$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  }

  Future<dynamic> searchStationAPI(String endpoint) async {
    final response =
    await http.get(Uri.parse('$searchStationBASEURL$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }


  Future<dynamic> livetrainstatuslistAPI({
    required String reservationChoice,
    required String source,
    required String destination,
    required String className,
    required String quota,
    required String doj,
    required String trainNumber,
    required bool moreThanOneDay,
  }) async {
    final response = await http.post(
      Uri.parse(livetrainstatuslistBASEURL),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: {
        "reservationChoice": reservationChoice,
        "source": source,
        "destination": destination,
        "class": className,
        "quota": quota,
        "doj": doj,
        "trainNumber": trainNumber,
        "moreThanOneDay": moreThanOneDay
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to send POST request. Status code: ${response.statusCode}');
    }
  }



  Future<dynamic> trainroutelistAPI(String endpoint) async {
    final response =
    await http.get(Uri.parse('$trainroutelistBASEURL$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }


  Future<dynamic> trainscheduleAPI({
    required String trainNumber,
    required String channelCode,
    required String affiliateCode,
  }) async {
    final response = await http.post(
      Uri.parse(trainscheduleBASEURL),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: {
        "trainNumber": trainNumber,
        "trackingParams": {
          "channelCode": channelCode,
          "affiliateCode": affiliateCode
        }
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to send POST request. Status code: ${response.statusCode}');
    }
  }



  Future<dynamic> trainschedulelistURL(String endpoint) async {
    final response =
    await http.get(Uri.parse('$trainschedulelistBASEURL$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
