import 'package:flutter/material.dart';
import 'package:kino_actor/models/actor.model.dart';

class ActorDetails extends StatelessWidget {
  Actor actor;
  ActorDetails({Key? key, required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(actor.name);
  }
}
