import 'package:account_selector/account.dart';
import 'package:flutter/material.dart';

class MultiAccountSelectionWidget extends StatefulWidget {
  final List<int> initiallySelectedIndexList;
  final List<AccountWithSelectionBoolean> accountwithselectionList;
  final Color checkedIconColor,
      uncheckedIconColor,
      doneButtonColor,
      arrowColor,
      backgroundColor,
      selectedTextColor,
      unselectedTextColor;
  final String doneText;

  MultiAccountSelectionWidget({
    @required this.initiallySelectedIndexList,
    @required this.accountwithselectionList,
    @required this.checkedIconColor,
    @required this.uncheckedIconColor,
    @required this.doneText,
    @required this.doneButtonColor,
    @required this.arrowColor,
    @required this.backgroundColor,
    @required this.selectedTextColor,
    @required this.unselectedTextColor,
  });
  @override
  _MultiAccountSelectionWidgetState createState() =>
      _MultiAccountSelectionWidgetState();
}

class _MultiAccountSelectionWidgetState
    extends State<MultiAccountSelectionWidget> {
  List<int> currentlySelectedIndexList;

  @override
  void initState() {
    currentlySelectedIndexList = widget.initiallySelectedIndexList;
    currentlySelectedIndexList.removeWhere(
        (element) => element > (widget.accountwithselectionList.length - 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: widget.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: widget.arrowColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Container(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 30,
                maxHeight: MediaQuery.of(context).size.height * 0.5,
                minWidth: double.maxFinite,
                maxWidth: double.maxFinite,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
                    child: ListTile(
                      leading: ClipOval(
                        child: Container(
                          height: 56,
                          width: 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: widget.accountwithselectionList[index]
                              .accountImageWidget,
                        ),
                      ),
                      title: Text(
                        widget.accountwithselectionList[index].title,
                        style: TextStyle(
                          color: currentlySelectedIndexList.contains(index)
                              ? widget.selectedTextColor
                              : widget.unselectedTextColor,
                        ),
                      ),
                      trailing: Icon(
                          (currentlySelectedIndexList.contains(index))
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: (currentlySelectedIndexList.contains(index))
                              ? widget.checkedIconColor
                              : widget.uncheckedIconColor),
                      onTap: () {
                        setState(
                          () {
                            if (currentlySelectedIndexList.contains(index)) {
                              currentlySelectedIndexList.remove(index);
                            } else {
                              currentlySelectedIndexList.add(index);
                            }
                          },
                        );
                      },
                    ),
                  );
                },
                itemCount: widget.accountwithselectionList.length,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.resolveWith(
                        (states) => TextStyle(color: Colors.white)),
                    backgroundColor:
                        MaterialStateProperty.all(widget.doneButtonColor)),
                child: Text(widget.doneText),
                onPressed: () {
                  Navigator.of(context).pop(currentlySelectedIndexList);
                },
              )),
        ],
      ),
    );
  }
}
