library account_selector;

import 'package:account_selector/account.dart';
import 'package:account_selector/selector_widget.dart/muti_account_selector.dart';
import 'package:account_selector/selector_widget.dart/single_account_selector.dart';
import 'package:flutter/material.dart';

showAccountSelectorSheet({
  @required BuildContext context,
  @required List<Account> accountList,
  int initiallySelectedIndex = -1,
  Function(int index) tapCallback,
  bool hideSheetOnItemTap = false,
  Color selectedRadioColor = Colors.green,
  bool showAddAccountOption = false,
  Function addAccountTapCallback,
  String addAccountTitle = "Add Account",
  Color arrowColor = Colors.grey,
  Color backgroundColor = Colors.white,
  Color selectedTextColor = Colors.green,
  Color unselectedTextColor = const Color(0xFF424242),
  Color unselectedRadioColor = Colors.grey,
  bool isSheetDismissible = true,
}) {
  List<AccountWithSelectionBoolean> accountwithselectionList =
      setupAccountWithSelectionList(
    accountList,
    initiallySelectedIndex,
    showAddAccountOption,
    addAccountTitle,
  );
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isDismissible: isSheetDismissible,
    isScrollControlled: true,
    builder: (context) {
      return SingleAccountSelectionWidget(
        accountwithselectionList: accountwithselectionList,
        initiallySelectedIndex: initiallySelectedIndex,
        tapCallback: tapCallback ?? (val) {},
        hideSheetOnItemTap: hideSheetOnItemTap,
        selectedRadioColor: selectedRadioColor,
        showAddAccountOption: showAddAccountOption,
        addAccountTapCallback: addAccountTapCallback ?? () {},
        arrowColor: arrowColor,
        backgroundColor: backgroundColor,
        selectedTextColor: selectedTextColor,
        unselectedTextColor: unselectedTextColor,
        unselectedRadioColor: unselectedRadioColor,
      );
    },
  );
}

Future<List<int>> showMultiAccountSelectorSheet({
  @required BuildContext context,
  @required List<Account> accountList,
  List<int> initiallySelectedIndexList,
  Color checkedIconColor = Colors.green,
  Color doneButtonColor = Colors.blue,
  Color arrowColor = Colors.grey,
  Color backgroundColor = Colors.white,
  Color selectedTextColor = Colors.green,
  Color unselectedTextColor = const Color(0xFF424242),
  Color uncheckedIconColor = Colors.grey,
  String doneText = "DONE",
  bool isSheetDismissible = true,
}) async {
  List<AccountWithSelectionBoolean> accountwithselectionList =
      setupAccountWithMultiSelectionList(
    accountList,
    initiallySelectedIndexList,
  );
  List<int> selectedIndexList = await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: isSheetDismissible,
      builder: (context) {
        return MultiAccountSelectionWidget(
          accountwithselectionList: accountwithselectionList,
          initiallySelectedIndexList: initiallySelectedIndexList ?? [-1],
          checkedIconColor: checkedIconColor,
          doneText: doneText,
          doneButtonColor: doneButtonColor,
          arrowColor: arrowColor,
          backgroundColor: backgroundColor,
          selectedTextColor: selectedTextColor,
          unselectedTextColor: unselectedTextColor,
          uncheckedIconColor: uncheckedIconColor,
        );
      });
  return selectedIndexList ?? [];
}
