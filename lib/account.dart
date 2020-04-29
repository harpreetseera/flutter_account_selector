import 'package:flutter/material.dart';

class Account {
  String title;
  Widget accountImageWidget;
  Account({
    @required this.title,
    @required this.accountImageWidget,
  });
}

class AccountWithSelectionBoolean {
  String title;
  Widget accountImageWidget;
  bool selected;
  AccountWithSelectionBoolean({
    @required this.title,
    @required this.accountImageWidget,
    @required this.selected,
  });
}

List<AccountWithSelectionBoolean> setupAccountWithSelectionList(
  List<Account> accountList,
  int initialySelectedElementIndex,
  bool showAddAccountOption,
  String addAccountTitle,
) {
  List<AccountWithSelectionBoolean> actualList =
      List<AccountWithSelectionBoolean>();
  for (int i = 0; i < accountList.length; i++) {
    actualList.add(
      AccountWithSelectionBoolean(
        title: accountList[i].title,
        accountImageWidget: accountList[i].accountImageWidget,
        selected: i == initialySelectedElementIndex ? true : false,
      ),
    );
  }
  actualList.add(
    AccountWithSelectionBoolean(
      title: addAccountTitle,
      accountImageWidget: null,
      selected: false,
    ),
  );
  return actualList;
}

List<AccountWithSelectionBoolean> setupAccountWithMultiSelectionList(
  List<Account> accountList,
  List<int> initiallySelectedIndexList,
) {
  List<AccountWithSelectionBoolean> actualList =
      List<AccountWithSelectionBoolean>();
  for (int index = 0; index < accountList.length; index++) {
    actualList.add(
      AccountWithSelectionBoolean(
        title: accountList[index].title,
        accountImageWidget: accountList[index].accountImageWidget,
        selected: (initiallySelectedIndexList == null ||
                initiallySelectedIndexList.length < 1)
            ? false
            : initiallySelectedIndexList.contains(index) ? true : false,
      ),
    );
  }
  return actualList;
}
