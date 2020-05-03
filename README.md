# account_selector

A Flutter package which provides helper widgets for selecting single or multiple account/user from a list


## Supported Dart Versions
**Dart SDK version >= 2.1.0**

## Demo Screen Shots

<img src="https://raw.githubusercontent.com/harpreetseera/flutter_account_selector/master/ss1.png" height="35%" width="35%"  alt="Account Selector Demo"/> <img src="https://raw.githubusercontent.com/harpreetseera/flutter_account_selector/master/ss2.png"   height="35%" width="35%" alt="Custom Account Selector Demo" /> <img src="https://raw.githubusercontent.com/harpreetseera/flutter_account_selector/master/ss3.png"   height="35%" width="35%" alt=" MultiAccount Selector Demo" /> <img src="https://raw.githubusercontent.com/harpreetseera/flutter_account_selector/master/ss4.png"   height="35%" width="35%" alt="Custom MultiAccount Selector Demo" />


## Demo Gif

<img src="https://raw.githubusercontent.com/harpreetseera/flutter_account_selector/master/demo.gif" height="35%" width="35%"  alt="Account Selector Demo"/>

## Installation
[![Pub](https://img.shields.io/badge/pub-1.0.1-blue)](https://pub.dev/packages/account_selector)

Add the Package
```yaml
dependencies:
  account_selector: ^1.0.1
```
## How to use



Import the package in your dart file

```dart
import 'package:account_selector/account.dart';
import 'package:account_selector/account_selector.dart';
```
Create an account list to provide to custom widgets 
```dart
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

   static getImage(String assetPath) {
    return Image.asset(assetPath, fit: BoxFit.cover);
  }
```
Now to use the Single Account Selection modal sheet call showAccountSelectorSheet as follows :
```dart
showAccountSelectorSheet(
                context: context,
                accountList: accountList,
                isSheetDismissible: false,              // Optional
                initiallySelectedIndex: 2,              // Optional
                hideSheetOnItemTap: true,               // Optional
                addAccountTitle: "Add User",            // Optional
                showAddAccountOption: true,             // Optional
                backgroundColor: Colors.indigo,         // Optional
                arrowColor: Colors.white,               // Optional
                unselectedRadioColor: Colors.white,     // Optional
                selectedRadioColor: Colors.amber,       // Optional
                unselectedTextColor: Colors.white,      // Optional
                selectedTextColor: Colors.amber,        // Optional
               //Optional
                tapCallback: (index) {
                  //use the index of item selected to do your work over here
                }, 
                //Optional
                addAccountTapCallback: () {
                 // operation to perform when add account is clicked
                },
              );
```
For MultiSelection the showMultiAccountSelectorSheet() method return the list of index of the items selected. If the sheet is closed without clicking done then the empty list is returned.
```dart
onPressed: () async {
              var res = await showMultiAccountSelectorSheet(
                context: context,
                accountList: accountList,
                initiallySelectedIndexList: [0, 2],         // Optional
                isSheetDismissible: false,                  // Optional
                backgroundColor: Colors.orange[100],        // Optional
                arrowColor: Colors.purple,                  // Optional
                doneButtonColor: Colors.purple,             // Optional
                doneText: "Done",                           // Optional
                checkedIconColor: Colors.purple,            // Optional
                selectedTextColor: Colors.purple,           // Optional
                uncheckedIconColor: Colors.grey[800],       // Optional
                unselectedTextColor: Colors.grey[800],      // Optional
              );
           
              print(res.toString());
```

### Default configuration/styles

If you don't like to configure/style the modal sheets and continue with the default style, it's okay but just have a look at our default configuration.

For showAccountSelectorSheet

| Attribute           | Value   |
| -------------       | :-----:|
| isSheetDismissible     | true  |
| initiallySelectedIndex | if not provided, initially no item will be selected  |
| hideSheetOnItemTap     | false |
| selectedRadioColor     | Colors.green|
| tapCallback            | by default it will be (val){}, ie it wont do anything |
| showAddAccountOption   | false |
| addAccountTitle        | "Add Account" |
| addAccountTapCallback  | by default it will be (){}, ie it wont do anything |
| arrowColor             | Colors.grey |
| backgroundColor        | Colors.white |
| selectedTextColor      | Colors.green |
| unselectedTextColor    | const Color(0xFF424242) |
| unselectedRadioColor   | Colors.grey |

For showMultiAccountSelectorSheet

| Attribute           | Value   |
| -------------       | :-----:|
| isSheetDismissible   | true  |
| initiallySelectedIndexList | if not provided, initially no item will be selected  |
| doneText             | "Done" |
| checkedIconColor     | Colors.green|
| uncheckedIconColor   | Colors.grey |
| doneButtonColor      | Colors.blue|
| arrowColor           | Colors.grey |
| backgroundColor      | Colors.white |
| selectedTextColor    | Colors.green |
| unselectedTextColor  | const Color(0xFF424242) |


# Pull Requests

I welcome and encourage all pull requests. It usually will take me within 24-48 hours to respond to any issue or request. Here are some basic rules to follow to ensure timely addition of your request:

1.  Match coding style (braces, spacing, etc.) This is best achieved using `Reformat Code` feature of Android Studio `CMD`+`Option`+`L` on Mac and `CTRL` + `ALT` + `L` on Linux + Windows .
2.  If its a feature, bugfix, or anything please only change code to what you specify.
3.  Please keep PR titles easy to read and descriptive of changes, this will make them easier to merge :)
4.  Pull requests _must_ be made against `develop` branch. Any other branch (unless specified by the maintainers) will get rejected.
5.  Check for existing [issues](https://github.com/harpreetseera/flutter_account_selector/issues) first, before filing an issue.
6.  Make sure you follow the set standard as all other projects in this repo do
7.  Have fun!

### Created & Maintained By

[Harpreet Singh](https://github.com/harpreetseera) 

# License

    Copyright 2020 Harpreet Singh

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.



