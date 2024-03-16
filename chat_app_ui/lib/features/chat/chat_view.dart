import 'package:chat_app_ui/core/colors.dart';
import 'package:chat_app_ui/core/text_styles.dart';
import 'package:chat_app_ui/features/chat/model/user_model.dart';
import 'package:chat_app_ui/features/chat/widgets/fav_contacts.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Chats',
          style: getTitleStyle(color: AppColors.white, fontSize: 22),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: AppColors.white,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FavouriteContacts(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: AppColors.secondry,
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        onTap: () {},
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(users[index].image),
                        ),
                        title: Text(
                          users[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getTitleStyle(color: AppColors.primary),
                        ),
                        subtitle: Text(
                          users[index].lastMsg,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBodyStyle(),
                        ),
                        trailing: Text(
                          users[index].time,
                          style: getSmallStyle(),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 7,
                    );
                  },
                  itemCount: users.length),
            ),
          )
        ],
      ),
    );
  }
}
