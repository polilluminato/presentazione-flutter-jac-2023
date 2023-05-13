import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_jac/models/ip_location.dart';
import 'package:http/http.dart' as http;

class IpLocationTab extends StatefulWidget {
  const IpLocationTab({super.key});

  @override
  State<IpLocationTab> createState() => _IpLocationTabState();
}

class _IpLocationTabState extends State<IpLocationTab> {
  final TextEditingController _ipLocationController = TextEditingController();
  IpLocation _ipLocation = const IpLocation(
    query: "",
    status: "",
    country: "",
    countryCode: "",
    region: "",
    regionName: "",
    city: "",
    zip: "",
    lat: 0.0,
    lon: 0.0,
    timezone: "",
    isp: "",
    org: "",
    as: "",
  );

  Future<void> _loadInfoIpLocation() async {
    try {
      final http.Response response = await http.get(
        Uri.parse(
          "http://ip-api.com/json/${_ipLocationController.text}",
        ),
      );
      setState(() {
        _ipLocation = IpLocation.fromJson(
          json.decode(response.body),
        );
        _ipLocationController.text = _ipLocation.query;
      });
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: TextFormField(
                  controller: _ipLocationController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Inserisci un indirizzo IP",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ElevatedButton(
                onPressed: () => _loadInfoIpLocation(),
                child: const Text("Check IP"),
              ),
            )
          ],
        ),
        Expanded(child: IpLocationInfo(ipLocation: _ipLocation))
      ],
    );
  }
}

class IpLocationInfo extends StatelessWidget {
  const IpLocationInfo({super.key, required this.ipLocation});

  final IpLocation ipLocation;

  @override
  Widget build(BuildContext context) {
    return ipLocation.city.isEmpty
        ? Container()
        : Card(
            child: ListView(
              children: [
                IpLocationInfoRow(
                  title: ipLocation.query,
                  subtitle: "Ip Address",
                ),
                IpLocationInfoRow(
                  title: ipLocation.status,
                  subtitle: "Status",
                ),
                IpLocationInfoRow(
                  title: "${ipLocation.country} (${ipLocation.countryCode})",
                  subtitle: "Country",
                ),
                IpLocationInfoRow(
                  title: "${ipLocation.regionName} (${ipLocation.region})",
                  subtitle: "Region",
                ),
                IpLocationInfoRow(
                  title: ipLocation.city,
                  subtitle: "City",
                ),
                IpLocationInfoRow(
                  title: "(${ipLocation.lat},${ipLocation.lon})",
                  subtitle: "(Latitude, Longitude)",
                ),
                IpLocationInfoRow(
                  title: ipLocation.timezone,
                  subtitle: "Timezone",
                ),
                IpLocationInfoRow(
                  title: ipLocation.isp,
                  subtitle: "ISP name	",
                ),
                IpLocationInfoRow(
                  title: ipLocation.org,
                  subtitle: "Organization name",
                ),
                IpLocationInfoRow(
                  title: ipLocation.as,
                  subtitle: "AS number and organization",
                ),
              ],
            ),
          );
  }
}

class IpLocationInfoRow extends StatelessWidget {
  const IpLocationInfoRow(
      {super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 2,
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
