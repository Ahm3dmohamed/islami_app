import 'package:flutter/material.dart';
import 'package:islami/modules/layout/pages/hadeth/hadeth_details.dart';
import 'package:islami/modules/layout/pages/hadeth/hadeth_model.dart';

class HadethTitle extends StatelessWidget {
  HadethModel hadethModel;
  HadethTitle(this.hadethModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
  Navigator.pushNamed(context, HadethDetails.routeName,arguments: hadethModel );

      },
      child: Text(hadethModel.title,textAlign: TextAlign.center,
    ),
    );
  }
}
