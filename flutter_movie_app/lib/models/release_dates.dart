import 'package:json_annotation/json_annotation.dart';

part 'release_dates.g.dart';

@JsonSerializable()
class ReleaseDates {
  ReleaseDates(
    this.iso,
    this.releaseDates,
  );

  @JsonKey(name: "iso_3166_1")
  final String iso;

  @JsonKey(name: "release_dates")
  final List<dynamic> releaseDates;

  factory ReleaseDates.fromJson(Map<String, dynamic> json) => _$ReleaseDatesFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseDatesToJson(this);
}
