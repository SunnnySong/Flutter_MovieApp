import "dart:async";
import "dart:convert";

import "package:chopper/chopper.dart";
import "package:flutter_movie_app/models/release_dates.dart";
import "package:flutter_movie_app/models/us_certification.dart";

class CertificationConverter {
  static FutureOr<Response<USCertification>> response(
    Response<dynamic> response,
  ) async {
    final body = response.body;
    final bodyDecode = json.decode(body as String) as Map<String, dynamic>;
    final results = bodyDecode['results'] as List<dynamic>;
    final releaseDates = results.map((e) => ReleaseDates.fromJson(e as Map<String, dynamic>)).toList();
    final usReleaseDates = releaseDates.where((dates) {
      return dates.iso == "US";
    }).toList();
    final usCertificationValue = (usReleaseDates.first.releaseDates.first as Map<String, dynamic>)['certification'];
    final certification = USCertificationExtension.fromString(usCertificationValue);
    return response.copyWith(body: certification);
  }
}