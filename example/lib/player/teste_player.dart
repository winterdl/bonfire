import 'package:bonfire/bonfire.dart';
import 'package:flame/animation.dart' as FlameAnimation;

class TestRotationPlayer extends RotationPlayer {
  double initSpeed = 150;
  TestRotationPlayer(Position position)
      : super(
            initPosition: position,
            animIdle: FlameAnimation.Animation.sequenced(
              "player/knight_idle_left.png",
              6,
              textureWidth: 16,
              textureHeight: 16,
            ),
            animRun: FlameAnimation.Animation.sequenced(
              "player/knight_run.png",
              6,
              textureWidth: 16,
              textureHeight: 16,
            ),
            speed: 150);

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    this.speed = initSpeed * event.intensity;
    super.joystickChangeDirectional(event);
  }

  @override
  void die() {
    remove();
    gameRef.addDecoration(
      GameDecoration(
        initPosition: Position(
          positionInWorld.left,
          positionInWorld.top,
        ),
        height: 30,
        width: 30,
        sprite: Sprite('player/crypt.png'),
      ),
    );
    super.die();
  }

  @override
  void joystickAction(int action) {
    if (action == 0) {
      actionAttackMelee();
    }

    if (action == 1) {
      actionAttackRange();
    }
    super.joystickAction(action);
  }

  void actionAttackRange() {
    this.simpleAttackRange(
      animationTop: FlameAnimation.Animation.sequenced(
        'player/fireball_top.png',
        3,
        textureWidth: 23,
        textureHeight: 23,
      ),
      animationDestroy: FlameAnimation.Animation.sequenced(
        'player/explosion_fire.png',
        6,
        textureWidth: 32,
        textureHeight: 32,
      ),
      width: 25,
      height: 25,
      damage: 10,
      speed: initSpeed * 1.5,
    );
  }

  void actionAttackMelee() {
    this.simpleAttackMelee(
      attackEffectTopAnim: FlameAnimation.Animation.sequenced(
        'player/atack_effect_top.png',
        6,
        textureWidth: 16,
        textureHeight: 16,
      ),
      heightArea: 20,
      widthArea: 20,
      damage: 20,
    );
  }
}
