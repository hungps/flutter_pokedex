import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/domain/entities/item.dart';
import 'package:pokedex/core/extensions/context.dart';
import 'package:pokedex/ui/widgets/spacer.dart';

import '../../../../states/theme/theme_cubit.dart';
import 'item_category.dart';

class ItemCard extends StatelessWidget {
  static const double _pokeballFraction = 0.60;
  static const double _itemFraction = 0.61;

  const ItemCard(
    this.item, {
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
        image: AppImages.pokeball,
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
            image: AppImages.bulbasaur,
            width: itemSize,
            height: itemSize,
            color: Colors.black12,
          ),
          errorWidget: (_, __, error) => Stack(
            alignment: Alignment.center,
            children: [
              Image(
                image: AppImages.bulbasaur,
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
    var themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    var isDark = themeCubit.isDark;
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;

        return Container(
          decoration: BoxDecoration(
            color: isDark ? Colors.black12 : AppColors.grey,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.12),
                blurRadius: 30,
                offset: Offset(0, 8),
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
  const _CardContent(this.item, {Key? key}) : super(key: key);

  final Item item;

  Widget _buildCategory(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.responsive(3),
        right: context.responsive(3),
      ),
      child: ItemCategory(item.category),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: context.responsive(24),
          bottom: context.responsive(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Hero(
              tag: item.name,
              child: Text(
                item.name,
                style: TextStyle(
                  fontSize: 14,
                  height: 0.7,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            VSpacer(context.responsive(10)),
            _buildCategory(context),
          ],
        ),
      ),
    );
  }
}
