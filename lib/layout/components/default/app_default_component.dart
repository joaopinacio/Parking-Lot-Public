import 'package:flutter/material.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/classes/component.dart';

class AppDefaultComponent extends StatelessWidget with Component {
  /// ### AppDefaultComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  final Behaviour behaviour;

  const AppDefaultComponent({
    Key? key,
    required this.behaviour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return Container();
  }

  @override
  Widget whenLoading(BuildContext context, Behaviour childBehaviour) {
    return Container();
  }

  @override
  Widget whenEmpty(BuildContext context, Behaviour childBehaviour) {
    return Container();
  }

  @override
  Widget whenBlocked(BuildContext context, Behaviour childBehaviour) {
    return Container();
  }

  @override
  Widget whenError(BuildContext context, Behaviour childBehaviour) {
    return Container();
  }
}
