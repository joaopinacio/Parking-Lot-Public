import 'package:flutter/material.dart';

import 'behaviour.dart';

abstract class Component {
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    throw ("$this does not implements Behaviour.regular");
  }

  Widget whenLoading(BuildContext context, Behaviour childBehaviour) {
    debugPrint('$this does not implements Behaviour.loading');
    return whenRegular(context, childBehaviour);
  }

  Widget whenEmpty(BuildContext context, Behaviour childBehaviour) {
    debugPrint('$this does not implements Behaviour.empty');
    return whenRegular(context, childBehaviour);
  }

  Widget whenBlocked(BuildContext context, Behaviour childBehaviour) {
    debugPrint('$this does not implements Behaviour.blocked');
    return whenRegular(context, childBehaviour);
  }

  Widget whenError(BuildContext context, Behaviour childBehaviour) {
    debugPrint('$this does not implements Behaviour.error');
    return whenRegular(context, childBehaviour);
  }

  Widget render(
    BuildContext context,
    Behaviour behaviour,
  ) {
    switch (behaviour) {
      case Behaviour.regular:
        return whenRegular(context, behaviour);
      case Behaviour.loading:
        return whenLoading(context, behaviour);
      case Behaviour.empty:
        return whenEmpty(context, behaviour);
      case Behaviour.blocked:
        return whenBlocked(context, behaviour);
      case Behaviour.error:
        return whenError(context, behaviour);
      default:
        throw "$behaviour is not implemented for $this";
    }
  }
}
