import 'package:flutter/material.dart';
import 'package:shopapp/app/themes/theme_colors.dart';

import '../data/model/client_model.dart';


class ClientCard extends StatelessWidget {
  final Client client;
  const ClientCard({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),

      height: 60,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemeColor.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //avatar
           SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage:
              NetworkImage(client.user.photo),
              backgroundColor: Colors.transparent,
            ),
          ),
          //space
          const SizedBox(width: 10),
          //user infos
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(
                  client.surname,
                  style: const TextStyle(
                    fontSize: 14,
                    color: ThemeColor.primaryBlack,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  client.user.email,
                  style: const TextStyle(
                    fontSize: 11,
                    color: ThemeColor.primaryShadowGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          // details
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                client.telephone,
                style: const TextStyle(
                  fontSize: 12,
                  color: ThemeColor.primaryBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 140,
                child: Text(
                  client.address,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12,
                    color: ThemeColor.primaryShadowGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

