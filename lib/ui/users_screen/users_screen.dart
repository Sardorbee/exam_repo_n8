import 'package:exam_repo_n8/services/data/models/users_model.dart';
import 'package:exam_repo_n8/services/provider/user_provider.dart';
import 'package:exam_repo_n8/ui/users_screen/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BottomSheetScreen(isAdding: true),
          ));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<UserModel>>(
              stream: context.read<UserProvider>().getUsers(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<UserModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox();
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  List<UserModel>? users = snapshot.data;
                  if (users != null && users.isNotEmpty) {
                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        UserModel user = users[index];
                        return ListTile(
                          title: Text(user.firstName),
                          subtitle: Text(user.lastName),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BottomSheetScreen(
                                      isAdding: false,
                                      userModel: user,
                                    ),
                                  ));
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<UserProvider>().deleteUsers(
                                      context: context, usersId: user.usersId);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    // Empty data
                    return const Center(child: Text('There is no user yet'));
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
