import 'dart:convert';

import 'package:crush_notion/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class myWalletPg extends StatefulWidget {
  const myWalletPg({Key? key, required this.user_id}) : super(key: key);
  final String user_id;
  @override
  _myWalletPgState createState() => _myWalletPgState();
}

class _myWalletPgState extends State<myWalletPg> {
  Future deposit() async {
    var response = await http.post(
        Uri.parse('https://crush.notionprojects.tech/api/deposit.php'),
        body: {
          'token': '123456789',
          'user_id': widget.user_id,
          'coins_amount': coins_amount
        });
    var Response = jsonDecode(response.body);
    if (Response['status']) {
      Navigator.pop(context);
    }
  }

  Future withdraw() async {
    var response = await http.post(
        Uri.parse('https://crush.notionprojects.tech/api/withdrawal.php'),
        body: {
          'token': '123456789',
          'user_id': widget.user_id,
          'coins_amount': coins_amount
        });
    var Response = jsonDecode(response.body);
    if (Response['status']) {
      Navigator.pop(context);
    }
  }

  late String coins_amount;
  TextEditingController coins_amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'My Wallet',
                  style: TextStyle(color: appThemeColor, fontSize: 20),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.23,
                color: appThemeColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('INR 200',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Balance',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                width: 118,
                                height: 36,
                                child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title: Text(
                                                      'Enter Coints Amount to Deposit'),
                                                  content: TextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller:
                                                        coins_amountController,
                                                    onChanged: (value) {
                                                      value =
                                                          coins_amountController
                                                              .text
                                                              .toString();
                                                      coins_amount = value;
                                                    },
                                                  ),
                                                  actions: [
                                                    commonBtn(
                                                        s: 'ADD',
                                                        bgcolor: appThemeColor,
                                                        textColor: Colors.white,
                                                        onPressed: () {
                                                          setState(() {
                                                            deposit();
                                                          });
                                                        })
                                                  ],
                                                ));
                                      });
                                    },
                                    child: Text(
                                      'Deposit',
                                      style: TextStyle(
                                          color: appThemeColor, fontSize: 14),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                width: 118,
                                height: 36,
                                child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title: Text(
                                                      'Enter Coints Amount to Withdraw'),
                                                  content: TextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller:
                                                        coins_amountController,
                                                    onChanged: (value) {
                                                      value =
                                                          coins_amountController
                                                              .text
                                                              .toString();
                                                      coins_amount = value;
                                                    },
                                                  ),
                                                  actions: [
                                                    commonBtn(
                                                        s: 'Withdraw',
                                                        bgcolor: appThemeColor,
                                                        textColor: Colors.white,
                                                        onPressed: () {
                                                          setState(() {
                                                            withdraw();
                                                          });
                                                        })
                                                  ],
                                                ));
                                      });
                                    },
                                    child: Text(
                                      'Withdraw',
                                      style: TextStyle(
                                          color: appThemeColor, fontSize: 14),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '0',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'SegoeUI',
                                color: Colors.black),
                          ),
                          Text(
                            'Promo Balance',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'SegoeUI',
                                fontWeight: FontWeight.bold,
                                color: Color(0xff0B0D0F).withOpacity(0.6)),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.info,
                        size: 30,
                        color: Color(0xff0B0D0F),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                  child: Text(
                'Transaction History',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'SegoeUI',
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0B0D0F)),
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                color: appThemeColor,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'SegoeUI'),
                      ),
                      Text(
                        'Amount',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'SegoeUI'),
                      ),
                      Text(
                        'Remark',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'SegoeUI'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
