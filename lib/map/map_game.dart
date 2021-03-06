import 'dart:ui';

import 'package:bonfire/map/tile.dart';
import 'package:bonfire/rpg_game.dart';
import 'package:bonfire/util/priority_layer.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';

abstract class MapGame extends Component with HasGameRef<RPGGame> {
  Iterable<Tile> tiles;
  Size mapSize;

  MapGame(this.tiles);

  Iterable<Tile> getRendered();

  Iterable<Tile> getCollisionsRendered();
  Iterable<Tile> getCollisions();

  void updateTiles(Iterable<Tile> map);

  Size getMapSize();

  @override
  int priority() => PriorityLayer.MAP;
}
