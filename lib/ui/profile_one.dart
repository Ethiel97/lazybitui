import 'package:flutter/material.dart';
import 'package:lazybitui/navigation/profile_tab_navigation_one.dart';
import 'package:lazybitui/utils/config.dart';

class ProfileOne extends StatefulWidget {
  @override
  _ProfileOne createState() => _ProfileOne();
}

class _ProfileOne extends State<ProfileOne>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _profileFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _shippingFormKey = GlobalKey<FormState>();
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Profile',
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height - 82.0,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent),
              Positioned(
                top: 75.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width),
              ),
              Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/productimage.webp"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 200.0,
                    width: 200.0),
              ),
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Container(
                  width: 200.0,
                  child: Container(
                    height: 40,
                    child: ProfileTabNavigationOne(
                      tabController: _tabController,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 300.0,
                left: 25.0,
                right: 25.0,
                child: Container(
                  width: 200.0,
                  height: MediaQuery.of(context).size.height - 350,
                  child:
                      TabBarView(controller: _tabController, children: <Widget>[
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 50, top: 5),
                        child: Form(
                          key: _profileFormKey,
                          autovalidate: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              getInputTextField(context,
                                  title: 'Nickname',
                                  errorText: 'Nickname is required'),
                              const SizedBox(height: 16.0),
                              getInputTextField(context,
                                  title: 'Full Name',
                                  errorText: 'Full Name is required'),
                              const SizedBox(height: 16.0),
                              getInputTextField(context,
                                  title: 'Email',
                                  errorText: 'Email is required'),
                              const SizedBox(height: 16.0),
                              getInputTextField(context,
                                  title: 'Phone',
                                  errorText: 'Phone is required'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 50, top: 5),
                        child: Form(
                          key: _shippingFormKey,
                          autovalidate: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              getInputTextField(
                                context,
                                title: 'Full Address',
                                minLines: 3,
                                maxLines: 3,
                                isRequired: true,
                              ),
                              const SizedBox(height: 16.0),
                              getInputTextField(
                                context,
                                title: 'City',
                                isRequired: true,
                              ),
                              const SizedBox(height: 16.0),
                              getInputTextField(
                                context,
                                title: 'State',
                                isRequired: true,
                              ),
                              const SizedBox(height: 16.0),
                              getInputTextField(
                                context,
                                title: 'Country',
                                isRequired: true,
                              ),
                              const SizedBox(height: 16.0),
                              getInputTextField(context,
                                  title: 'Pincode',
                                  textInputType: TextInputType.number,
                                  maxLength: 6,
                                  minLength: 6,
                                  isRequired: true,
                                  isNumberCheck: true),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(),
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget getInputTextField(BuildContext context,
    {@required String title,
    bool isRequired = false,
    bool isNumberCheck = false,
    String errorText,
    String minLengthErrorText,
    TextInputType textInputType,
    int maxLength,
    int minLength,
    int minLines,
    int maxLines}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: title,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Config.primaryColor,
        ),
      ),
      labelStyle: TextStyle(
        color: Config.primaryColor,
        decorationColor: Config.primaryColor,
      ),
    ),
    keyboardType: textInputType,
    maxLength: maxLength,
    maxLengthEnforced: maxLength != null && maxLength > 0,
    minLines: minLines,
    maxLines: maxLines,
    textCapitalization: TextCapitalization.words,
    cursorColor: Config.primaryColor,
    style: TextStyle(
      color: Color(0xFF73737F),
    ),
    validator: (String value) {
      if (!isRequired) return null;
      if (isNumberCheck) {
        if (minLength != null && minLength > 0 && value != null) {
          if (value.length < minLength)
            return minLengthErrorText ?? "Minimum Length is $minLength";
        } else if (value == null || value.trim().isEmpty) {
          return errorText ?? "Invalid Number";
        }
        return null;
      }
      if (errorText != null && value.trim().isEmpty) {
        return errorText ?? "This field cannot be empty";
      }
      return null;
    },
  );
}
