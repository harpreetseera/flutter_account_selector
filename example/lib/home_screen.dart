import 'package:account_selector/account.dart';
import 'package:account_selector/account_selector.dart';
import 'package:flutter/material.dart';

class HomeScreenWidget extends StatefulWidget {
  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  String resultText = "";
  List<Account> accountList = [
    Account(
        title: "Bill Gates",
        accountImageWidget: getImage("assets/sample1.jpg")),
    Account(
        title: "Steve Jobs",
        accountImageWidget: getImage("assets/sample2.jpg")),
    Account(
        title: "Mark Elliot Zuckerberg",
        accountImageWidget: getImage("assets/sample3.jpg")),
    Account(
        title: "Sundar Pichai",
        accountImageWidget: getImage("assets/sample4.jpg")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account selector Example"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(resultText),
          ),
          RaisedButton(
            onPressed: () {
              showAccountSelectorSheet(
                context: context,
                accountList: accountList,
                isSheetDismissible: false, //Optional
                initiallySelectedIndex: 2, //Optional
                hideSheetOnItemTap: true, //Optional
                addAccountTitle: "Add User", //Optional
                showAddAccountOption: true, //Optional
                backgroundColor: Colors.indigo, //Optional
                arrowColor: Colors.white, //Optional
                unselectedRadioColor: Colors.white, //Optional
                selectedRadioColor: Colors.amber, //Optional
                unselectedTextColor: Colors.white, //Optional
                selectedTextColor: Colors.amber, //Optional
                //Optional
                tapCallback: (index) {
                  setState(() {
                    resultText =
                        "selected account is : ${accountList[index].title}";
                  });
                  print(resultText);
                },
                //Optional
                addAccountTapCallback: () {
                  setState(() {
                    resultText = "Add account clicked";
                  });
                  print(resultText);
                },
              );
            },
            child: Text("Single Account Selector"),
          ),
          RaisedButton(
            onPressed: () async {
              var res = await showMultiAccountSelectorSheet(
                context: context,
                accountList: accountList,
                initiallySelectedIndexList: [0, 2], //Optional
                isSheetDismissible: false, //Optional
                backgroundColor: Colors.orange[100], //Optional
                arrowColor: Colors.purple, //Optional
                doneButtonColor: Colors.purple, //Optional
                doneText: "Done", //Optional
                checkedIconColor: Colors.purple, //Optional
                selectedTextColor: Colors.purple, //Optional
                uncheckedIconColor: Colors.grey[800], //Optional
                unselectedTextColor: Colors.grey[800], //Optional
              );
              setState(() {
                resultText = "list of indexes selected  : ${res.toString()}";
              });
              print(resultText);
            },
            child: Text("Multi Account Selector"),
          ),
        ],
      )),
    );
  }

  static getImage(String assetPath) {
    return Image.asset(assetPath, fit: BoxFit.cover);
  }
}
