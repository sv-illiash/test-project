import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/widgets/CustomTrackShape.dart';

class AudioPlayerWidget extends StatelessWidget {
  final double iconsOpacity;

  const AudioPlayerWidget({
    Key key,
    this.iconsOpacity = 0.3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "0:38",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                  color: Theme.of(context).buttonColor),
            ),
            Expanded(
                child: SizedBox(
              width: 20,
            )),
            Text("0:45",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: Theme.of(context).buttonColor))
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            inactiveTrackColor: Theme.of(context).buttonColor.withOpacity(0.3),
            trackShape: CustomTrackShape(padding: 0),
            trackHeight: 3,
            inactiveTickMarkColor: Colors.transparent,
            activeTickMarkColor: Colors.transparent,
          ),
          child: Slider(
            onChanged: (double value) {},
            value: 0.5,
            activeColor: Theme.of(context).buttonColor,
            inactiveColor: Theme.of(context).buttonColor.withOpacity(0.3),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RewindButton(
              iconsOpacity: iconsOpacity,
              image: "reverb.png",
            ),
            SizedBox(
              width: 10,
            ),
            FlatButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                shape: CircleBorder(),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/play.png",
                    height: 32,
                    color: Theme.of(context).buttonColor,
                    width: 32,
                  ),
                )),
            SizedBox(
              width: 10,
            ),
            RewindButton(
              iconsOpacity: iconsOpacity,
              image: "forward.png",
            ),
          ],
        ),
      ],
    );
  }
}

class RewindButton extends StatelessWidget {
  final String image;
  final double iconsOpacity;

  const RewindButton({
    Key key,
    @required this.image,
    this.iconsOpacity = 0.3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        shape: CircleBorder(),
        child: Container(
          height: 54,
          width: 54,
          alignment: Alignment.center,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/icons/$image",
                    color:
                        Theme.of(context).buttonColor.withOpacity(iconsOpacity),
                  )),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "15",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Theme.of(context).buttonColor),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
