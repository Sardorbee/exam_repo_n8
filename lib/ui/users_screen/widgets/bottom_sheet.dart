import 'package:exam_repo_n8/services/data/models/users_model.dart';
import 'package:exam_repo_n8/services/provider/ui_utils/error_message_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:exam_repo_n8/services/provider/user_provider.dart';
import 'package:exam_repo_n8/ui/users_screen/widgets/input_field.dart';

// ignore: must_be_immutable
class BottomSheetScreen extends StatefulWidget {
  final bool isAdding;
  UserModel? userModel;

  BottomSheetScreen({super.key, this.isAdding = true, this.userModel});

  @override
  // ignore: library_private_types_in_public_api
  _BottomSheetStateScreen createState() => _BottomSheetStateScreen();
}

class _BottomSheetStateScreen extends State<BottomSheetScreen> {
  @override
  void initState() {
    if (widget.isAdding == false) {
      context.read<UserProvider>().firstNameController.text =
          widget.userModel!.firstName;
      context.read<UserProvider>().lastNameController.text =
          widget.userModel!.lastName;
      context.read<UserProvider>().ageController.text = widget.userModel!.age;
      context.read<UserProvider>().selectedUserRole =
          widget.userModel!.usersRole;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.isAdding ? 'Add User' : 'Update User';
    String actionText = widget.isAdding ? 'Add' : 'Update';

    return WillPopScope(
      onWillPop: () async {
        context.read<UserProvider>().tozalash();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
              onPressed: () {
                context.read<UserProvider>().tozalash();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Stack(
          children: [
            SizedBox(
              height: 500.h,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(12.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20.h),
                      CustomText(
                        controller:
                            context.read<UserProvider>().firstNameController,
                        label: "First Name",
                      ),
                      SizedBox(height: 10.h),
                      CustomText(
                        controller:
                            context.read<UserProvider>().lastNameController,
                        label: "Last Name",
                      ),
                      SizedBox(height: 10.h),
                      CustomText(
                        controller: context.read<UserProvider>().ageController,
                        label: "Age",
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: 100.h,
                        child: PopupMenuButton<String>(
                          icon: Text(
                            context.watch<UserProvider>().selectedUserRole,
                          ),
                          initialValue: '',
                          onSelected: (value) {
                            context.read<UserProvider>().updateUserRole(value);
                          },
                          itemBuilder: (BuildContext context) {
                            return ['Admin', 'Client', 'Owner']
                                .map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          },
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (widget.isAdding) {
                              String firstName = context
                                  .read<UserProvider>()
                                  .firstNameController
                                  .text;
                              String lastName = context
                                  .read<UserProvider>()
                                  .lastNameController
                                  .text;
                              String age = context
                                  .read<UserProvider>()
                                  .ageController
                                  .text;
                              String role =
                                  context.read<UserProvider>().selectedUserRole;
                              if (firstName.isNotEmpty &&
                                  lastName.isNotEmpty &&
                                  age.isNotEmpty &&
                                  role.isNotEmpty) {
                                context.read<UserProvider>().addUsers(
                                    context: context,
                                    userModel: UserModel(
                                        firstName: firstName,
                                        lastName: lastName,
                                        age: age,
                                        usersId: '',
                                        fcm: context.read<UserProvider>().fcm,
                                        createdDate: DateTime.now().toString(),
                                        usersRole: role));
                              } else {
                                showErrorMessage(
                                    message: "You must enter all fields",
                                    context: context);
                                showConfirmMessage(
                                    message: '', context: context);
                              }
                            } else {
                              String firstName = context
                                  .read<UserProvider>()
                                  .firstNameController
                                  .text;
                              String lastName = context
                                  .read<UserProvider>()
                                  .lastNameController
                                  .text;
                              String age = context
                                  .read<UserProvider>()
                                  .ageController
                                  .text;
                              String role =
                                  context.read<UserProvider>().selectedUserRole;
                              if (firstName.isNotEmpty &&
                                  lastName.isNotEmpty &&
                                  age.isNotEmpty &&
                                  role.isNotEmpty) {
                                context.read<UserProvider>().updateUsers(
                                    context: context,
                                    userModel: UserModel(
                                        firstName: firstName,
                                        lastName: lastName,
                                        age: age,
                                        usersId: widget.userModel!.usersId,
                                        fcm: widget.userModel!.fcm,
                                        createdDate:
                                            widget.userModel!.createdDate,
                                        usersRole: role));
                              } else {
                                showErrorMessage(
                                    message: "You must enter all fields",
                                    context: context);
                                showConfirmMessage(
                                    message: '', context: context);
                              }
                            }

                            String actionMessage = widget.isAdding
                                ? 'User added successfully!'
                                : 'User updated successfully!';
                            print(actionMessage);

                            Navigator.of(context).pop();
                          },
                          child: Text(actionText),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<UserProvider>().tozalash();

                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Visibility(
                visible: context.watch<UserProvider>().isloading,
                child: const Center(
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        color: Colors.red,
                        strokeWidth: 8,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
