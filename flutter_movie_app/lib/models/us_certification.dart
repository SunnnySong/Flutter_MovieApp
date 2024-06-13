enum USCertification {
  R,
  PG,
  NC17,
  G,
  NR,
  PG13,
  Undefined,
}

extension USCertificationExtension on USCertification {
  String get koreanDescription {
    switch (this) {
      case USCertification.R:
        return "청소년 관람 불가";
      case USCertification.PG:
        return "전체 관람가";
      case USCertification.NC17:
        return "청소년 관람 불가";
      case USCertification.G:
        return "전체 관람가";
      case USCertification.NR:
        return "상영 등급 미지정";
      case USCertification.PG13:
        return "15세 이상 관람가";
      default:
        return "알 수 없는 등급";
    }
  }

  static USCertification? fromString(String str) {
    switch (str) {
      case "R":
        return USCertification.R;
      case "PG":
        return USCertification.PG;
      case "NC-17":
        return USCertification.NC17;
      case "G":
        return USCertification.G;
      case "NR":
        return USCertification.NR;
      case "PG-13":
        return USCertification.PG13;
      default:
        return USCertification.Undefined;
    }
  }
}