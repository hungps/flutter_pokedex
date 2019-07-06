import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/widgets/pokemon_type.dart';

class PokemonOverallInfo extends StatefulWidget {
  @override
  _PokemonOverallInfoState createState() => _PokemonOverallInfoState();
}

class _PokemonOverallInfoState extends State<PokemonOverallInfo> {
  PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.6);
    _pageController.addListener(() {
      int next = _pageController.page.round();

      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });

    super.initState();
  }

  Widget _buildAppBar() {
    return Padding(
      padding: EdgeInsets.only(left: 26, right: 26, top: 56, bottom: 22),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            child: Icon(Icons.arrow_back, color: Colors.white),
            onTap: Navigator.of(context).pop,
          ),
          Icon(Icons.favorite_border, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildPokemonName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 9),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Bulbasaur",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 0.7,
              fontSize: 36,
            ),
          ),
          Text(
            "#001",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPokemonTypes() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              PokemonType("Grass", large: true),
              SizedBox(width: 7),
              PokemonType("Poison", large: true),
            ],
          ),
          Text(
            "Seed Pokemon",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPokemonSlider(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: screenHeight * 0.24,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              "assets/images/pokeball.svg",
              width: screenHeight * 0.24,
              height: screenHeight * 0.24,
              color: Colors.white.withOpacity(0.14),
            ),
          ),
          PageView.builder(
            physics: BouncingScrollPhysics(),
            controller: _pageController,
            itemCount: 3,
            itemBuilder: (context, index) => Hero(
              tag: index == 0 ? "assets/images/bulbasaur.png" : "",
              child: AnimatedPadding(
                duration: Duration(milliseconds: 600),
                curve: Curves.easeOutQuint,
                padding: EdgeInsets.only(
                  top: _currentPage == index ? 0 : screenHeight * 0.04,
                  bottom: _currentPage == index ? 0 : screenHeight * 0.04,
                ),
                child: Image.asset(
                  "assets/images/bulbasaur.png",
                  width: screenHeight * 0.28,
                  height: screenHeight * 0.28,
                  alignment: Alignment.bottomCenter,
                  color: _currentPage == index ? null : Color(0xFF28A889),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _buildAppBar(),
        _buildPokemonName(),
        _buildPokemonTypes(),
        SizedBox(height: 25),
        _buildPokemonSlider(context),
      ],
    );
  }
}
