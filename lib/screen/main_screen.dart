import 'package:calculator_with_provider/provider/main_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Consumer<MainScreenProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          foregroundColor: white,
          title: const Text('Calculator'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.all(height * 0.02),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      provider.displayTxt,
                      style: TextStyle(
                          fontSize: height * 0.08, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  calBtn('AC', null, black, height, width, provider),
                  calBtn('.', null, black, height, width, provider),
                  calBtn('+', blue, white, height, width, provider),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  calBtn('9', null, black, height, width, provider),
                  calBtn('8', null, black, height, width, provider),
                  calBtn('7', null, black, height, width, provider),
                  calBtn('/', blue, white, height, width, provider),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  calBtn('6', null, black, height, width, provider),
                  calBtn('5', null, black, height, width, provider),
                  calBtn('4', null, black, height, width, provider),
                  calBtn('x', blue, white, height, width, provider),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  calBtn('3', null, black, height, width, provider),
                  calBtn('2', null, black, height, width, provider),
                  calBtn('1', null, black, height, width, provider),
                  calBtn('-', blue, white, height, width, provider),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  calBtn('00', null, black, height, width, provider),
                  calBtn('0', null, black, height, width, provider),
                  calBtn('=', blue, white, height, width, provider),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget calBtn(
    String btnVal,
    Color? bgColor,
    Color? fgColor,
    double height,
    double? width,
    MainScreenProvider provider,
  ) {
    return SizedBox(
      width: btnVal != '=' && btnVal != 'AC' ? (width! / 4) : (width! / 2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size.square(height * 0.09),
            shape: btnVal != '=' && btnVal != 'AC'
                ? const CircleBorder()
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(height * 0.03)),
            foregroundColor: fgColor,
            backgroundColor: bgColor,
            side: const BorderSide(width: 2)),
        // onPressed: () => ,
        onPressed: () => provider.addBtnVal(btnVal),
        child: Text(
          btnVal,
          style: TextStyle(fontSize: height * 0.04),
        ),
      ),
    );
  }
}
