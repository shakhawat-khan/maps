// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../utils/style.dart';

import 'package:url_launcher/url_launcher.dart';

class InfromationCard extends StatelessWidget {
  final String name;
  final String number;
  const InfromationCard({Key? key, required this.name, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                height: 200,
                width: 150,
                child: Card(
                  elevation: 5,
                  child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/flutter_logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name : $name',
                      style: interBold,
                    ),
                    Text('Number : $number', style: interBold),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Card(
                            elevation: 4,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.whatshot,
                                color: Colors.green,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            String telephoneNumber = '+8801962823007';
                            String telephoneUrl = 'tel:$telephoneNumber';

                            //canLaunchUrl();

                            if (await canLaunch(telephoneUrl)) {
                              await launch(telephoneUrl);
                            } else {
                              throw 'Error occured trying to call that number.';
                            }
                          },
                          child: const Card(
                            elevation: 4,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.call,
                                color: Colors.blue,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
