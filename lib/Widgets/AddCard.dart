import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedElevatedButton.dart';
import 'package:uggiso/Widgets/ui-kit/TextFieldCurvedEdges.dart';

import '../base/common/utils/colors.dart';
import '../base/common/utils/fonts.dart';
import '../base/common/utils/strings.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController _cardHolderName = TextEditingController();
  TextEditingController _cardNumber1 = TextEditingController();
  TextEditingController _cardNumber2 = TextEditingController();
  TextEditingController _cardNumber3 = TextEditingController();
  TextEditingController _cardNumber4 = TextEditingController();
  TextEditingController _cvv = TextEditingController();
  TextEditingController _expDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBg,
      appBar: AppBar(
        elevation: 2.0,
        leading: Container(),
        backgroundColor: AppColors.textFieldBg,
        title: Text(
          Strings.wallet,
          style: AppFonts.appBarText.copyWith(color: AppColors.appPrimaryColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/card.png',
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Gap(24),
              Text(
                Strings.card_holder_name,
                style: AppFonts.title,
              ),
              Gap(12),
              TextFieldCurvedEdges(
                  controller: _cardHolderName,
                  backgroundColor: Colors.transparent,
                  keyboardType: TextInputType.name,
                  borderColor: AppColors.borderColor),
              Gap(24),
              Text(
                Strings.card_number,
                style: AppFonts.title,
              ),
              Gap(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    child: TextFieldCurvedEdges(
                        controller: _cardNumber1,
                        backgroundColor: Colors.transparent,
                        keyboardType: TextInputType.number,
                        length: 4,
                        borderColor: AppColors.borderColor),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    child: TextFieldCurvedEdges(
                        controller: _cardNumber2,
                        backgroundColor: Colors.transparent,
                        keyboardType: TextInputType.number,
                        length: 4,
                        borderColor: AppColors.borderColor),
                  ),
                  Container(

                    width: MediaQuery.of(context).size.width*0.2,
                    child: TextFieldCurvedEdges(
                        controller: _cardNumber3,
                        backgroundColor: Colors.transparent,
                        keyboardType: TextInputType.number,
                        length: 4,
                        borderColor: AppColors.borderColor),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    child: TextFieldCurvedEdges(
                        controller: _cardNumber4,
                        backgroundColor: Colors.transparent,
                        keyboardType: TextInputType.number,
                        length: 4,
                        borderColor: AppColors.borderColor),
                  ),
                ],
              ),
              Gap(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        Strings.expiration_date,
                        style: AppFonts.title,
                      ),
                      Gap(12),
                      Container(
                        width: MediaQuery.of(context).size.width*0.3,
                        child: TextFieldCurvedEdges(
                            controller: _expDate,
                            length: 5,
                            backgroundColor: Colors.transparent,
                            keyboardType: TextInputType.datetime,
                            borderColor: AppColors.borderColor),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.cvv,
                        style: AppFonts.title,
                      ),
                      Gap(12),
                      Container(
                        width: MediaQuery.of(context).size.width*0.3,
                        child: TextFieldCurvedEdges(
                            controller: _cvv,
                            length: 3,
                            backgroundColor: Colors.transparent,
                            keyboardType: TextInputType.datetime,
                            borderColor: AppColors.borderColor),
                      )
                    ],
                  ),
                ],
              ),
              Gap(48),
              Center(
                child: RoundedElevatedButton(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: 40.0,
                    text: Strings.submit,
                    onPressed: () {

                    },
                    cornerRadius: 6.0,
                    buttonColor: AppColors.appPrimaryColor,
                    textStyle: AppFonts.header
                        .copyWith(color: AppColors.black)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
