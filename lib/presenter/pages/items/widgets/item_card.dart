import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/data/entities/item.dart';
import 'package:pokedex/presenter/assets.gen.dart';
import 'package:pokedex/presenter/themes/colors.dart';

import 'item_category.dart';

class ItemCard extends StatelessWidget {
  static const double _pokeballFraction = 0.60;
  static const double _itemFraction = 0.61;

  const ItemCard(
    this.item, {
    super.key,
    this.onPress,
    required this.index,
  });

  final int index;
  final Function()? onPress;
  final Item item;

  Widget _buildPokeballDecoration({required double height}) {
    final pokeballSize = height * _pokeballFraction;

    return Positioned(
      bottom: -height * 0.13,
      right: -height * 0.03,
      child: Image(
        image: Assets.images.pokeball.provider(),
        width: pokeballSize,
        height: pokeballSize,
        color: Colors.white.withOpacity(0.14),
      ),
    );
  }

  Widget _buildItem({required double height}) {
    final itemSize = height * _itemFraction;

    return Positioned(
      bottom: -2,
      right: 2,
      child: Hero(
        tag: item.image,
        child: CachedNetworkImage(
          imageUrl: item.image,
          width: itemSize,
          height: itemSize,
          // imageRenderMethodForWeb: ImageRenderMethodForWeb.HtmlImage,
          useOldImageOnUrlChange: true,
          fit: BoxFit.contain,
          alignment: Alignment.bottomRight,
          placeholder: (context, url) => Image(
            image: Assets.images.bulbasaur.provider(),
            width: itemSize,
            height: itemSize,
            color: Colors.black12,
          ),
          errorWidget: (_, __, error) => Stack(
            alignment: Alignment.center,
            children: [
              Image(
                image: Assets.images.bulbasaur.provider(),
                width: itemSize,
                height: itemSize,
                color: Colors.black12,
              ),
              Icon(
                Icons.warning_amber_rounded,
                size: itemSize * 0.4,
                color: Colors.black45,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;

        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.12),
                blurRadius: 30,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              color: AppColors.grey,
              child: InkWell(
                onTap: onPress,
                splashColor: Colors.white10,
                highlightColor: Colors.white10,
                child: Stack(
                  children: [
                    _buildPokeballDecoration(height: itemHeight),
                    _buildItem(height: itemHeight),
                    _CardContent(item),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CardContent extends StatelessWidget {
  const _CardContent(this.item);

  final Item item;

  Widget _buildCategory(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: ItemCategory(item.category),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Hero(
              tag: item.name,
              child: Text(
                item.name,
                style: const TextStyle(
                  fontSize: 14,
                  height: 0.7,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _buildCategory(context),
          ],
        ),
      ),
    );
  }
}
