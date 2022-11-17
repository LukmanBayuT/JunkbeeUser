import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_geocoding.dart';

class TapMaps extends StatefulWidget {
  const TapMaps({Key? key}) : super(key: key);

  @override
  State<TapMaps> createState() => _TapMapsState();
}

class _TapMapsState extends State<TapMaps> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 1.8,
            // child: ElevatedButton(
            //     onPressed: getGeocodeLocation,
            //     child: const Text('print')),
            child: FutureBuilder(
              future: GetLocationGeocoding().getCurrentLocation(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var userloc = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${userloc?.results[0].formattedAddress}',
                      ),
                      const SizedBox(width: 30),
                    ],
                  );
                } else {
                  return const Center(
                      child: SpinKitWave(size: 50, color: mainColor0));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
