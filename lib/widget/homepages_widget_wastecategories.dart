import 'package:flutter/material.dart';
import 'package:junkbee_user/constant/constant.dart';

class WasteCategories extends StatelessWidget {
  const WasteCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Waste Categories',
            style: titleBody,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 10,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Image.asset('icons/waste_icons/plastic_button.png'),
                Image.asset('icons/waste_icons/paper_button.png'),
                Image.asset('icons/waste_icons/glass_button.png'),
                Image.asset('icons/waste_icons/sachet_button.png'),
                Image.asset('icons/waste_icons/metal_button.png'),
                Image.asset('icons/waste_icons/oil_button.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
