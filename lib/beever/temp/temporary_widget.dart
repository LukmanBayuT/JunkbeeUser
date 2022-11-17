            // SingleChildScrollView(
            //   child: SizedBox(
            //     width: MediaQuery.of(context).size.width,
            //     height: MediaQuery.of(context).size.height,
            //     child: Padding(
            //       padding: defaultPadding4,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Image.asset(
            //             'assets/onboarding/logo_junkbee.png',
            //             width: MediaQuery.of(context).size.height / 4,
            //           ),
            //           Column(
            //             children: [
            //               SizedBox(
            //                 height: MediaQuery.of(context).size.height / 100,
            //               ),
            //               Padding(
            //                 padding: defaultPadding6,
            //                 child: TextFormField(
            //                   style: const TextStyle(fontSize: 22),
            //                   decoration: const InputDecoration(
            //                       labelStyle: signScreenTextStyle,
            //                       labelText:
            //                           'Full Name (Same as Identity Card)'),
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: MediaQuery.of(context).size.height / 100,
            //               ),
            //               Padding(
            //                 padding: defaultPadding6,
            //                 child: TextFormField(
            //                   style: const TextStyle(fontSize: 22),
            //                   decoration: const InputDecoration(
            //                       labelStyle: signScreenTextStyle,
            //                       labelText: 'Address'),
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: MediaQuery.of(context).size.height / 40,
            //               ),
            //               Padding(
            //                   padding: defaultPadding6,
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       const Text(
            //                         'Upload Your Selfie',
            //                         style: signScreenTextStyle,
            //                       ),
            //                       SizedBox(
            //                         height:
            //                             MediaQuery.of(context).size.height / 60,
            //                       ),
            //                       Image.asset(
            //                           'assets/onboarding/upload_blank.png'),
            //                       const Divider(
            //                         color: Colors.grey,
            //                         height: 10,
            //                       )
            //                     ],
            //                   )),
            //               SizedBox(
            //                 height: MediaQuery.of(context).size.height / 40,
            //               ),
            //               Padding(
            //                   padding: defaultPadding6,
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       const Text(
            //                         'Upload Your Identity Card (KTP)',
            //                         style: signScreenTextStyle,
            //                       ),
            //                       SizedBox(
            //                         height:
            //                             MediaQuery.of(context).size.height / 60,
            //                       ),
            //                       Image.asset(
            //                           'assets/onboarding/upload_blank.png'),
            //                       const Divider(
            //                         color: Colors.grey,
            //                         height: 10,
            //                       )
            //                     ],
            //                   )),
            //             ],
            //           ),
            //           CheckboxListTile(
            //             activeColor: Colors.amber,
            //             controlAffinity: ListTileControlAffinity.leading,
            //             value: _isChecked,
            //             onChanged: (value) {
            //               setState(() => _isChecked = value!);
            //             },
            //             title: const Text(
            //                 'I agree with terms conditions and privacy policy'),
            //           ),
            //           SizedBox(
            //               width: MediaQuery.of(context).size.width / 1,
            //               height: MediaQuery.of(context).size.height / 15,
            //               child: ElevatedButton(
            //                 onPressed: () {
            //                   (_isChecked)
            //                       ? null
            //                       : Get.snackbar('Stop u breaking meh!',
            //                           'checking testing',
            //                           snackPosition: SnackPosition.BOTTOM);
            //                 },
            //                 child: const Text(
            //                   'Submit',
            //                   style: onboardingTextButton,
            //                 ),
            //                 style: ElevatedButton.styleFrom(
            //                     primary: Colors.amber,
            //                     shape: RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.circular(15))),
            //               ))
            //         ],
            //       ),
            //     ),
            //   ),
            // ),