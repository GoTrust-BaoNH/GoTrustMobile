import 'package:flutter/material.dart';

class BankItem extends StatelessWidget {
  const BankItem({
    required this.icon,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Widget icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
              right: 14,
              left: 16,
            ),
            child: icon,
          ),
          Text(
            title,
            style: Theme.of(context).accentTextTheme.headline1,
          )
        ],
      ),
    );
  }
}
