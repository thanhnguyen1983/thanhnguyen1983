import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:humanweb/components/filb01a.dart';
import 'package:humanweb/utilities/constants.dart';
class CharacterGridItem extends StatelessWidget {
  const CharacterGridItem({
    required this.character,
    Key? key,
  }) : super(key: key);
  final FILB01A character;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
    imageUrl: '${urlImage}${character.EMP_ID}.${character.extension}',
  );
}
