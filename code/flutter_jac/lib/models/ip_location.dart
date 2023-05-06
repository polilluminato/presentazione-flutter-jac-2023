import 'package:freezed_annotation/freezed_annotation.dart';

part 'ip_location.freezed.dart';
part 'ip_location.g.dart';

@freezed
class IpLocation with _$IpLocation {
  const factory IpLocation({
    required String query,
    required String status,
    required String country,
    required String countryCode,
    required String region,
    required String regionName,
    required String city,
    required String zip,
    required double lat,
    required double lon,
    required String timezone,
    required String isp,
    required String org,
    required String as,
  }) = _IpLocation;

  factory IpLocation.fromJson(Map<String, Object?> json) =>
      _$IpLocationFromJson(json);
}
